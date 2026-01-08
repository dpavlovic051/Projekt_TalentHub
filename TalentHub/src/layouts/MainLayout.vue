<template>
  <q-layout view="lHh Lpr lFf">
    <!-- HEADER -->
    <q-header elevated class="bg-primary text-white">
      <q-toolbar>
        <q-btn
          flat
          dense
          round
          icon="menu"
          aria-label="Menu"
          @click="toggleLeftDrawer"
        />
        
        <q-toolbar-title class="text-h5">
          <q-icon name="work" class="q-mr-sm" /> Freelancer Aplikacija
        </q-toolbar-title>

        <q-avatar size="40px" class="cursor-pointer">
          <img src="https://cdn.quasar.dev/img/boy-avatar.png" />
        </q-avatar>
      </q-toolbar>
    </q-header>

    <!-- NAVIGACIJSKI DRAWER -->
    <q-drawer v-model="leftDrawerOpen" show-if-above bordered class="bg-grey-2">
      <q-list>
        <q-item-label header class="text-grey-8">
          Navigacija
        </q-item-label>

        <q-item
          v-for="link in linksList"
          :key="link.title"
          clickable
          tag="router-link"
          :to="link.link"
          class="hover-bg-secondary rounded-borders q-mb-sm"
        >
          <q-item-section avatar>
            <q-icon :name="link.icon" color="primary" />
          </q-item-section>
          <q-item-section>
            <q-item-label class="text-weight-bold">{{ link.title }}</q-item-label>
            <q-item-label caption>{{ link.caption }}</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-drawer>

    <!-- STRANICE -->
    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script setup>
import { ref } from 'vue'

const linksList = [
  {
    title: 'Freelanceri',
    caption: 'Pregled freelancera',
    icon: 'people',
    link: '/freelanceri'
  },
  {
    title: 'Kategorije usluga',
    caption: 'Različite vrste usluga',
    icon: 'category',
    link: '/kategorije-usluga'
  },
  {
    title: 'Narudžbe',
    caption: 'Vaše narudžbe',
    icon: 'shopping_cart',
    link: '/narudzbe'
  },
  {
    title: 'O nama',
    caption: 'Više informacija',
    icon: 'info',
    link: '/onama'
  },
  {
    title: 'Login',
    caption: 'Prijavite se',
    icon: 'login',
    link: '/'
  },
  {
    title: 'Registracija',
    caption: 'Kreirajte račun',
    icon: 'person_add',
    link: '/registracija'
  }
]

const leftDrawerOpen = ref(false)

function toggleLeftDrawer() {
  leftDrawerOpen.value = !leftDrawerOpen.value
}
</script>

<style scoped>
/* Hover efekt na navigacijske stavke */
.hover-bg-secondary:hover {
  background-color: rgba(0, 0, 0, 0.08);
}

/* Poboljšan izgled navigacije */
.q-drawer {
  width: 260px;
}

/* Zaobljeni rubovi i bolji razmaci */
.rounded-borders {
  border-radius: 8px;
}
</style>
