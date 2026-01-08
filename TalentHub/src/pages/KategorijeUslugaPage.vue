<template>
  <q-page class="q-pa-md">
    <div class="text-h5 text-center q-mb-md text-primary">Kategorije usluga</div>

    <q-list bordered separator>
      <q-item
        v-for="kategorija in kategorije"
        :key="kategorija.id"
        clickable
        @click="otvoriFreelancere(kategorija.id)"
      >
        <q-item-section>
          <q-item-label class="text-bold">{{ kategorija.naziv }}</q-item-label>
        </q-item-section>
      </q-item>
    </q-list>
  </q-page>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      kategorije: []
    };
  },
  mounted() {
    axios.get('http://localhost:3000/kategorije')
      .then(response => {
        this.kategorije = response.data;
      })
      .catch(err => {
        console.error('Greška pri dohvaćanju kategorija:', err);
      });
  },
  methods: {
    otvoriFreelancere(kategorijaId) {
      this.$router.push({ path: '/freelanceri', query: { kategorija: kategorijaId } });
    }
  }
};
</script>
