<template>
  <q-layout view="lHh Lpr lFf">
    <!-- Header -->
    <q-header elevated>
      <q-toolbar>
        <!-- Logo -->
        <q-btn flat dense round aria-label="Logo" class="q-ml-sm">
          <img src="src/assets/logo.png" alt="TalentHub Logo" style="height: 100px;" />
        </q-btn>

        <!-- Title -->
        <q-toolbar-title>TalentHub</q-toolbar-title>

        <!-- Menu toggle button -->
        <q-btn flat dense round icon="menu" aria-label="Menu" @click="toggleDrawer" />
      </q-toolbar>
    </q-header>

    <!-- Drawer for navigation -->
    <q-drawer v-model="drawerOpen" show-if-above bordered>
      <q-list>
        <q-item clickable tag="router-link" to="/">
          <q-item-section avatar>
            <q-icon name="home" />
          </q-item-section>
          <q-item-section>
            <q-item-label>Početna</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable tag="router-link" to="/freelanceri">
          <q-item-section avatar>
            <q-icon name="people" />
          </q-item-section>
          <q-item-section>
            <q-item-label>Freelanceri</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable tag="router-link" to="/kategorije-usluga">
          <q-item-section avatar>
            <q-icon name="category" />
          </q-item-section>
          <q-item-section>
            <q-item-label>Kategorije usluga</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable tag="router-link" to="/onama">
          <q-item-section avatar>
            <q-icon name="info" />
          </q-item-section>
          <q-item-section>
            <q-item-label>O nama</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable tag="router-link" to="/login">
          <q-item-section avatar>
            <q-icon name="login" />
          </q-item-section>
          <q-item-section>
            <q-item-label>Prijava</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-drawer>

    <!-- Main content -->
    <q-page-container>
      <router-view />
    </q-page-container>

    <!-- Footer -->
    <q-footer class="bg-grey-8 text-white">
      <q-toolbar>
        <q-toolbar-title>
          © 2025 TalentHub
        </q-toolbar-title>
      </q-toolbar>
    </q-footer>
  </q-layout>
</template>

<script>
import { ref } from 'vue';

export default {
  setup() {
    const drawerOpen = ref(false);

    function toggleDrawer() {
      drawerOpen.value = !drawerOpen.value;
    }

    return {
      drawerOpen,
      toggleDrawer
    };
  }
};
</script>

<style>
body {
  background-color: #f5f5f5;
}

img {
  max-height: 40px;
  object-fit: contain;
}
</style>
