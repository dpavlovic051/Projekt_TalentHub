const routes = [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', component: () => import('pages/LoginPage.vue') }, // Login je početna stranica
      { path: '/login', component: () => import('pages/LoginPage.vue') }, // Ruta za prijavu
      { path: '/freelanceri', component: () => import('pages/FreelanceriPage.vue') },
      { path: '/kategorije-usluga', component: () => import('pages/KategorijeUslugaPage.vue') },
      { path: '/narudzbe', component: () => import('pages/NarudzbePage.vue') },
      { path: '/onama', component: () => import('pages/ONamaPage.vue') },
      { path: '/registracija', component: () => import('pages/RegistracijaPage.vue') }
    ]
  },

  // Stranica za greške
  {
    path: '/:catchAll(.*)*',
    component: () => import('pages/ErrorNotFound.vue')
  }
]

export default routes
