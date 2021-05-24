require('./bootstrap');
window.Vue = require('vue');
require('./Helpers/crud');
require('./Helpers/mixin');
require('./Helpers/filter');
require('./Helpers/plugin');

// ===============router=============
import router from "./Router/router.js";

Vue.component('app', require('./components/BackendApp.vue').default);
// ===============app===============
const app = new Vue({
    el: '#app',
    router,
    data: {
        baseurl: laravel.baseurl,
        spinner: false,
        loggedIn: false,
        userimage: laravel.baseurl + '/public/images/user.png',
        noimage: laravel.baseurl + '/public/images/noimage.png',
        attach: laravel.baseurl + '/public/images/attach.png',
        guards: { admin: 'Admin' },
        roleList: [],
        allDominionList: [],
        user_permissions: [],
        menu_datas: []
    },
    methods: {
        dominionList: function () {
            axios
                .get("/dominionList")
                .then(response => {
                    this.allDominionList = response.data;
                })
                .catch(error => console.log());
        },
        getRoleList() {
            axios
                .get("/roleList")
                .then(res => (this.roleList = res.data))
                .catch(error => console.log());
        },
        getMenuData() {
            axios
                .get('/rootmenu/side_menu')
                .then(res => (this.menu_datas = res.data))
                .catch(error => console.log());
        },
        getLoggedUser() {
            axios
                .get('/admin-info')
                .then(res => {
                    profile.dispatch("setProfile", res.data.profile);
                    this.user_permissions = res.data.permisson.permission_list;
                })
                .catch(error => {
                    Admin.logout();
                    console.log(error.respons)
                })
        },
        checkPermission(routeName) {
            if (routeName.length < 0) {
                routeName = this.$route.name
            }
            let index = '';
            for (index in this.user_permissions) {
                if (this.user_permissions[index] == routeName) {
                    return true;
                }
            }
            return false
        }
    },
    mounted() {
        if (Admin.loggedIn()) {
            this.dominionList();
            this.getRoleList();
            this.getMenuData();
            this.getLoggedUser();
        }
        this.loggedIn = Boolean(Admin.loggedIn());
    }
});
