<template>
  <q-page class="flex flex-center q-pa-md">
    <q-card class="q-pa-lg shadow-3" style="max-width: 400px; width: 100%;">
      
      <q-card-section class="bg-primary text-white text-center">
        <q-icon name="person_add" size="lg" />
        <div class="text-h5 q-mt-md">Registracija</div>
      </q-card-section>

      <q-card-section>
        <q-form @submit.prevent="registracija">
          <q-input v-model="ime" label="Ime" filled type="text" class="q-mb-md" />
          <q-input v-model="email" label="Email" filled type="email" class="q-mb-md" />
          <q-input v-model="lozinka" label="Lozinka" filled type="password" class="q-mb-md" />
          <q-btn label="Registriraj se" color="primary" type="submit" class="full-width q-mt-md" />
        </q-form>
      </q-card-section>

      <q-card-section class="text-center">
        <q-btn flat color="grey" to="/login" label="Već imate račun? Prijavite se" />
      </q-card-section>

    </q-card>
  </q-page>
</template>

<script>
import axios from 'axios';
import { Notify } from 'quasar';

export default {
  data() {
    return {
      ime: '',
      email: '',
      lozinka: ''
    };
  },
  methods: {
    async registracija() {
      if (!this.ime || !this.email || !this.lozinka) {
        Notify.create({
          type: 'negative',
          message: 'Sva polja moraju biti ispunjena!',
          position: 'top-right',
          timeout: 2000
        });
        return;
      }

      try {
        const response = await axios.post('http://localhost:3000/registracija', {
          ime: this.ime,
          email: this.email,
          lozinka: this.lozinka
        });

        if (response.data && response.data.success) {
          Notify.create({
            type: 'positive',
            message: 'Uspješno ste registrirani! Preusmjeravanje na prijavu...',
            position: 'top-right',
            timeout: 2000
          });

          // Dodaj delay prije preusmjeravanja na login
          setTimeout(() => {
            this.$router.push('/login');
          }, 2200);
        } else {
          Notify.create({
            type: 'negative',
            message: 'Registracija nije uspjela! Email može biti već u upotrebi.',
            position: 'top-right',
            timeout: 2000
          });
        }
      } catch (err) {
        console.error('Greška pri registraciji:', err);

        Notify.create({
          type: 'negative',
          message: 'Greška na serveru! Pokušajte ponovno kasnije.',
          position: 'top-right',
          timeout: 2000
        });
      }
    }
  }
};
</script>
