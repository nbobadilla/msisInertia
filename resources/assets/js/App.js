import Vue from "vue";
import VueMeta from "vue-meta";
import PortalVue from "portal-vue";
import { InertiaApp } from "@inertiajs/inertia-vue";

// import Quasar from "quasar-framework/dist/quasar.mat.esm";
// import "quasar-framework/dist/umd/quasar.mat.css";
// import {ClosePopup} from 'quasar-framework'
import Quasar from "quasar";
import "quasar/dist/quasar.css"
Vue.use(Quasar)

Vue.config.productionTip = false;
Vue.use(InertiaApp);
Vue.use(PortalVue);
Vue.use(VueMeta);

let app = document.getElementById("app");

new Vue({
  metaInfo: {
    title: "Loading...",
    titleTemplate: "%s | My Inertia.js App"
  },
  render: h =>
    h(InertiaApp, {
      props: {
        initialPage: JSON.parse(app.dataset.page),
        resolveComponent: name =>
          import(
            /* webpackChunkName: "includes/js/pages/[request]" */ `@/Pages/${name}`
          ).then(module => module.default)
      }
    })
}).$mount(app);
