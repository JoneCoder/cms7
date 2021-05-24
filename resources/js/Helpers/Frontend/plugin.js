import Vue from 'vue';
import 'aos/dist/aos.css'
import AOS from 'aos';
window.AOS = AOS;

// ===============Pagination===============
import Pagination from './../../components/elements/Pagination'
Vue.component('Pagination', Pagination)

// ===============VueLazyload===============
import VueLazyload from 'vue-lazyload'
Vue.use(VueLazyload, {
    listenEvents: ['scroll', 'wheel', 'mousewheel', 'resize', 'animationend', 'transitionend']
})

// ===============Flash Message===============
import FlashMessage from '@smartweb/vue-flash-message';
Vue.use(FlashMessage);

// ===============Spinner===============
import Spinner from './../../components/elements/Spinner'
Vue.component('Spinner', Spinner)

// ===============Breadcrumbs from vuex===============
import breadcrumbs from "../../vuex/breadcrumbs_frontend";
window.frontBreadcrumbs = breadcrumbs;

import BootstrapVue from 'bootstrap-vue'
Vue.use(BootstrapVue);
import IconsPlugin from "bootstrap-vue/dist/bootstrap-vue.css";
Vue.use(IconsPlugin);

