<template>
  <q-page class="q-pa-md">
    <div class="text-h5 text-center q-mb-md text-primary">Moje narudžbe</div>

    <q-card class="q-mb-md q-pa-md shadow-2">
      <q-card-section class="text-center">
        <p class="text-grey-8">Pregledajte i upravljajte svojim narudžbama ili dodajte novu.</p>
        <q-btn color="primary" label="Dodaj narudžbu" icon="add" @click="otvoriFormu = true" />
      </q-card-section>
    </q-card>

    <div v-if="narudzbe.length > 0">
      <q-list class="q-gutter-md">
        <q-card v-for="narudzba in narudzbe" :key="narudzba.id" class="shadow-2 q-pa-md hover-card">
          <q-card-section horizontal>
            <q-avatar color="primary" text-color="white" icon="assignment" />
            <q-card-section>
              <q-item-label class="text-bold text-primary">{{ narudzba.opis_posla }}</q-item-label>
              <q-item-label caption>Freelancer: <span class="text-dark">{{ narudzba.freelancer }}</span></q-item-label>
              <q-item-label caption>
                Datum narudžbe: 
                <span class="text-dark">{{ formatirajDatum(narudzba.datum_vrijeme) }}</span>
              </q-item-label>
            </q-card-section>
          </q-card-section>
        </q-card>
      </q-list>
    </div>

    <q-card v-else class="q-pa-md text-center shadow-2">
      <q-card-section>
        <q-icon name="info" size="lg" color="grey" />
        <div class="text-h6">Nemate aktivnih narudžbi</div>
        <p class="text-grey-8">Pregledajte dostupne freelancere i napravite narudžbu.</p>
        <q-btn color="primary" label="Pronađi freelancera" to="/freelanceri" />
      </q-card-section>
    </q-card>

    <!-- MODAL ZA DODAVANJE NARUDŽBE -->
    <q-dialog v-model="otvoriFormu">
      <q-card class="q-pa-md" style="max-width: 400px; width: 100%;">
        <q-card-section>
          <div class="text-h6 text-primary">Nova narudžba</div>
        </q-card-section>
        <q-card-section>
          <q-form @submit.prevent="dodajNarudzbu">
            <q-select 
              v-model="novaNarudzba.freelancer_id" 
              :options="freelanceri" 
              option-label="label" 
              option-value="value"
              label="Odaberi freelancera" 
              filled 
              class="q-mb-md" 
            />
            <q-input v-model="novaNarudzba.opis_posla" label="Opis posla" type="textarea" filled class="q-mb-md" />
            <q-btn color="primary" label="Dodaj" type="submit" class="full-width q-mt-md" />
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>
  </q-page>
</template>

<script>
import axios from 'axios';
import { Notify } from 'quasar';

export default {
  data() {
    return {
      narudzbe: [],
      freelanceri: [],
      novaNarudzba: {
        freelancer_id: null,
        opis_posla: ''
      },
      otvoriFormu: false
    };
  },
  mounted() {
    this.dohvatiNarudzbe();
    this.dohvatiFreelancere();
  },
  methods: {
    async dohvatiNarudzbe() {
      try {
        const response = await axios.get('http://localhost:3000/narudzbe');
        this.narudzbe = response.data;
      } catch (err) {
        console.error('Greška pri dohvaćanju narudžbi:', err);
      }
    },
    async dohvatiFreelancere() {
      try {
        const response = await axios.get('http://localhost:3000/freelanceri');
        this.freelanceri = response.data.map(f => ({
          label: f.ime,
          value: f.id
        }));
      } catch (err) {
        console.error('Greška pri dohvaćanju freelancera:', err);
      }
    },
    async dodajNarudzbu() {
      const korisnik = JSON.parse(localStorage.getItem('user'));
      if (!korisnik) {
        Notify.create({
          type: 'negative',
          message: 'Niste prijavljeni! Prijavite se kako biste poslali narudžbu.',
          position: 'top-right',
          timeout: 2000
        });
        return;
      }

      const podaciZaSlanje = {
        freelancer_id: this.novaNarudzba.freelancer_id.value, 
        opis_posla: this.novaNarudzba.opis_posla,
        korisnik_id: korisnik.id
      };

      try {
        const response = await axios.post('http://localhost:3000/narudzbe', podaciZaSlanje);
        if (response.data.success) {
          Notify.create({
            type: 'positive',
            message: 'Narudžba je uspješno dodana!',
            position: 'top-right',
            timeout: 2000
          });
          this.dohvatiNarudzbe();
          this.otvoriFormu = false;
        } else {
          throw new Error('Greška pri dodavanju narudžbe!');
        }
      } catch (err) {
        console.error('Greška pri dodavanju narudžbe:', err);
        Notify.create({
          type: 'negative',
          message: 'Greška na serveru!',
          position: 'top-right',
          timeout: 2000
        });
      }
    },
    formatirajDatum(isoDatum) {
      if (!isoDatum) return 'Nepoznato';
      const datum = new Date(isoDatum);
      return datum.toLocaleString('hr-HR', { dateStyle: 'short', timeStyle: 'short' });
    }
  }
};
</script>

<style scoped>
.q-card {
  border-radius: 10px;
  transition: transform 0.2s;
}

.q-card:hover {
  transform: scale(1.02);
}

.hover-card:hover {
  background-color: rgba(0, 0, 0, 0.05);
  transition: background-color 0.3s ease;
}
</style>
