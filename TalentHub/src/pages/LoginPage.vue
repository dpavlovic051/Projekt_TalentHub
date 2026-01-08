<template>
  <q-page class="flex flex-center q-pa-md">
    <q-card class="q-pa-lg shadow-3" style="max-width: 400px; width: 100%;">
      
      <q-card-section class="bg-secondary text-white text-center">
        <q-icon name="lock" size="lg" />
        <div class="text-h5 q-mt-md">Prijava</div>
      </q-card-section>

      <q-card-section>
        <q-form @submit.prevent="login">
          <q-input v-model="email" label="Email" filled type="email" class="q-mb-md" />
          <q-input v-model="lozinka" label="Lozinka" filled type="password" class="q-mb-md" />
          <q-btn label="Prijavi se" color="primary" type="submit" class="full-width q-mt-md" />
        </q-form>
      </q-card-section>

      <q-card-section class="text-center">
        <q-btn flat color="grey" to="/registracija" label="Nemate račun? Registrirajte se" />
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
      email: '',
      lozinka: ''
    };
  },
  methods: {
    async login() {
      try {
        const response = await axios.post('http://localhost:3000/login', { 
          email: this.email, 
          lozinka: this.lozinka 
        });

        if (response.data && response.data.success) {
          const korisnik = response.data.user;

          // Spremi korisnika u localStorage
          localStorage.setItem('user', JSON.stringify(korisnik));

          // Prikaži obavijest o uspješnoj prijavi
          Notify.create({
            type: 'positive',
            message: 'Uspješno ste prijavljeni!',
            position: 'top-right',
            timeout: 1500
          });

          // Dodaj mali delay prije preusmjeravanja
          setTimeout(() => {
            this.$router.push('/freelanceri');
          }, 1600);
        } else {
          Notify.create({
            type: 'negative',
            message: 'Pogrešan email ili lozinka!',
            position: 'top-right',
            timeout: 2000
          });
        }
      } catch (err) {
        console.error('Greška pri prijavi:', err);

        Notify.create({
          type: 'negative',
          message: 'Greška na serveru! Provjerite vezu.',
          position: 'top-right',
          timeout: 2000
        });
      }
    }
  }
};
</script>
