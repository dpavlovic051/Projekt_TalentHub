import { defineBoot } from '#q-app/wrappers';
import { Notify } from 'quasar';

export default defineBoot(({ app }) => {
  // Registriraj Notify globalno
  app.config.globalProperties.$notify = Notify;
});
