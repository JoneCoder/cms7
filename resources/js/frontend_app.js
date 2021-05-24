require('./frontend_bootstrap');
window.Vue = require('vue');
require('./Helpers/filter');
require('./Helpers/Frontend/mixin');
require('./Helpers/Frontend/plugin');
require('./Helpers/Frontend/crud');

// ===============router=============
import router from "./Router/frontend_router.js";

Vue.component('app', require('./components/FrontendApp.vue').default);
// ===============app===============
const app = new Vue({
    el: '#app',
    router,
    data: {
        baseurl: laravel.baseurl,
        spinner: false,
        menus: [],
        config: [],
        variable: []
    },
    methods: {
        getMenus: function () {
            axios
                .get("/menus")
                .then(res => {
                    this.menus = res.data.menus;
                    this.config = res.data.config;
                })
                .catch(error => console.log());
        },
        getVariables: function () {
            axios
                .get("frontendvariablelist")
                .then(response => {
                    this.variable = response.data;
                })
                .catch(error => {
                    console.log(error.response);
                });
        }

    },
    mounted() {
        // this.getMenus();
        // this.getVariables();
    },
    created() {
        // active parent menu
        // $('.nav-item').children('.nav-link').removeClass('parent-active')
        // setTimeout(() => {
        //     $('.router-link-exact-active').parents('.dropdown-menu').siblings('#navbarDropdown').addClass('parent-active');
        // }, 3000);
    }
});
