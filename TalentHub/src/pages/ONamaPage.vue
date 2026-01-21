<template>
  <q-page class="flex flex-center q-pa-md">
    <q-card class="q-mt-lg q-pa-md shadow-2 shadow-md" style="max-width: 800px; width: 100%">
      <q-card-section class="bg-primary text-white">
        <div class="text-h5 text-center">O nama</div>
      </q-card-section>

      <q-card-section>
        <p class="text-body1 text-center">
          Ova aplikacija omogućuje korisnicima jednostavno povezivanje s freelancerima za razne
          vrste poslova, uključujući dizajn, razvoj i marketing. Naš cilj je stvoriti sigurno i
          učinkovito mjesto za suradnju.
        </p>
      </q-card-section>

      <q-card-section class="flex flex-center md:flex-row">
        <iframe
          src="https://www.google.com/maps?q=Dražice+Zamet+130,51000,Rijeka&output=embed"
          width="100%"
          height="350px"
          style="border: 0; border-radius: 10px"
          class="shadow-md"
          allowfullscreen
          loading="lazy"
        >
        </iframe>
      </q-card-section>

      <q-card-section class="text-center">
        <q-btn color="primary" icon="home" label="Povratak na početnu" to="/" />
      </q-card-section>
    </q-card>
  </q-page>
</template>
