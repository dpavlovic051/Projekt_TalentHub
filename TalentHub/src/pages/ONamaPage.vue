<template>
  <q-page class="flex flex-center q-pa-md">
    <q-card class="q-mt-lg q-pa-md shadow-2" style="max-width: 800px; width: 100%;">
      
      <q-card-section class="bg-primary text-white">
        <div class="text-h5 text-center">O nama</div>
      </q-card-section>

      <q-card-section>
        <p class="text-body1 text-center">
          Ova aplikacija omogućuje korisnicima jednostavno povezivanje s freelancerima za razne vrste poslova, uključujući dizajn, razvoj i marketing. 
          Naš cilj je stvoriti sigurno i učinkovito mjesto za suradnju.
        </p>
      </q-card-section>

      <q-card-section class="flex flex-center">
        <iframe 
          src="//www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d618.2631008215776!2d14.363626750401204!3d45.35324078941214!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4764a65c0ffc8d39%3A0xd1b0d781b9b281bd!2sMartinkovac%20ul.%20143%2C%2051000%2C%20Rijeka!5e1!3m2!1sen!2shr!4v1739885402033!5m2!1sen!2shr"
          width="100%" 
          height="350px" 
          style="border:0; border-radius: 10px;"
          allowfullscreen
          loading="lazy">
        </iframe>
      </q-card-section>

      <q-card-section class="text-center">
        <q-btn color="primary" icon="home" label="Povratak na početnu" to="/" />
      </q-card-section>

    </q-card>
  </q-page>
</template>
