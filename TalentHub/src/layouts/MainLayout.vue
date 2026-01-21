<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated style="background-color: #222a57" class="text-white">
      <q-toolbar>
        <q-toolbar-title class="text-h5 text-weight-bold">
          <q-icon name="work" class="q-mr-sm" /> Freelancer Aplikacija
        </q-toolbar-title>

        <q-avatar size="40px" class="cursor-pointer">
          <img src="https://cdn.quasar.dev/img/boy-avatar.png" />
        </q-avatar>
      </q-toolbar>
    </q-header>

    <q-drawer v-model="leftDrawerOpen" bordered class="bg-grey-1" :width="280" show-if-above>
      <q-list class="q-pa-sm">
        <q-item-label header class="text-overline text-grey-7 q-pb-md"> Navigacija </q-item-label>

        <q-item
          v-for="link in linksList"
          :key="link.title"
          clickable
          tag="router-link"
          :to="link.link"
          class="nav-item rounded-borders q-mb-sm"
          active-class="active-link"
        >
          <q-item-section avatar>
            <q-icon :name="link.icon" class="nav-icon" />
          </q-item-section>

          <q-item-section>
            <q-item-label class="text-weight-bold">{{ link.title }}</q-item-label>
            <q-item-label caption class="text-grey-6">{{ link.caption }}</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-drawer>

    <q-page-container class="bg-grey-2">
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script setup>
import { ref } from 'vue'

const leftDrawerOpen = ref(false)

const linksList = [
  { title: 'Freelanceri', caption: 'Pregled freelancera', icon: 'people', link: '/freelanceri' },
  {
    title: 'Kategorije usluga',
    caption: 'Različite vrste usluga',
    icon: 'category',
    link: '/kategorije-usluga',
  },
  { title: 'Narudžbe', caption: 'Vaše narudžbe', icon: 'shopping_cart', link: '/narudzbe' },
  { title: 'O nama', caption: 'Više informacija', icon: 'info', link: '/onama' },
  { title: 'Login', caption: 'Prijavite se', icon: 'login', link: '/login' },
  { title: 'Registracija', caption: 'Kreirajte račun', icon: 'person_add', link: '/registracija' },
]
</script>

<style scoped>
.nav-icon {
  color: #222a57;
}
.nav-item {
  transition: all 0.3s ease;
  color: #2c3e50;
}
.nav-item:hover {
  background-color: #e8eaf6;
  color: #222a57;
}
.active-link {
  background-color: #222a57 !important;
  color: white !important;
}
.active-link .nav-icon,
.active-link .text-grey-6 {
  color: white !important;
}
.rounded-borders {
  border-radius: 12px;
}
</style>
