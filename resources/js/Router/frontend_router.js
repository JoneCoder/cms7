import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)

// ========== define route==========
const routes = [
    {
        path: '/', component: () => import('./../views/frontend/Layout'),
        // chlidren menu
        children: [
            { path: '/', name: 'home.page', component: () => import('./../views/frontend/Home') },


            // {
            //     path: '/twoStateChild/',
            //     component: ChildLayoutName,
            //     children: [
            //         { path: '/', name: 'home.page', component: () => import('./../views/frontend/Home') },
            //     ]
            // }
        ],
    },

]

// ========== define router==========
const router = new VueRouter({
    routes,
    hashbang: false,
    mode: 'history',
    base: process.env.MIX_VUE_ROUTER_BASE,
    linkExactActiveClass: "active",
    scrollBehavior() {
        return { x: 0, y: 0 };
    }
});


router.beforeEach((to, from, next) => {
    next();
    // active parent menu
    // setTimeout(() => {
    //     $('.nav-item').children('.nav-link').removeClass('parent-active')
    //     $('.router-link-exact-active').parents('.dropdown-menu').siblings('#navbarDropdown').addClass('parent-active');
    // }, 100);
})

export default router
