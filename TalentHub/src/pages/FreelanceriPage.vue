<template>
  <q-page class="q-pa-md">
    <div class="text-h5 text-center q-mb-lg text-primary">Naši Freelanceri</div>

    <q-list separator>
      <q-item v-for="freelancer in filtriraniFreelanceri" :key="freelancer.id" class="shadow-1 q-mb-md">
        <q-item-section avatar>
          <q-icon name="person" color="primary" size="md" />
        </q-item-section>

        <q-item-section>
          <q-item-label class="text-bold">{{ freelancer.ime }}</q-item-label>
          <q-item-label caption>{{ freelancer.usluga }}</q-item-label>
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
      freelanceri: [],
      filtriraniFreelanceri: [],
      odabranaKategorija: null
    };
  },
  mounted() {
    this.odabranaKategorija = this.$route.query.kategorija || null;

    axios.get('http://localhost:3000/freelanceri')
      .then(response => {
        this.freelanceri = response.data;

        if (this.odabranaKategorija) {
          this.filtriraniFreelanceri = this.freelanceri.filter(f => f.kategorija_id == this.odabranaKategorija);
        } else {
          this.filtriraniFreelanceri = this.freelanceri;
        }
      })
      .catch(err => {
        console.error('Greška pri dohvaćanju freelancera:', err);
      });
  }
};
</script>
  