import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)

// ========== define route==========
const routes = [
    { path: '/loginme', name: 'admin.loginme', component: () => import('./../views/login/Login') },

    { // allow for after login
        path: '/dashboard', component: () => import('./../views/backend/Layout'), beforeEnter: authGuard,
        // chlidren menu
        children: [
            // ------------------Configuration portion------------------
            { path: '/configuration', name: 'configuration.index', meta: { title: 'Configuration', nav: true }, component: () => import('./../views/backend/Website/Configuration/Index'), beforeEnter: authGuard },
            { path: '/configuration/create', name: 'configuration.create', component: () => import('./../views/backend/Website/Configuration/Create'), beforeEnter: authGuard },
            { path: '/configuration/:id', name: 'configuration.show', component: () => import('./../views/backend/Website/Configuration/View'), beforeEnter: authGuard },
            { path: '/configuration/:id/edit', name: 'configuration.edit', component: () => import('./../views/backend/Website/Configuration/Create'), beforeEnter: authGuard },

            // ------------------Content portion------------------
            { path: '/content/:slug', name: 'content.show', component: () => import('./../views/backend/Website/Content/View'), beforeEnter: authGuard },
            { path: '/content/:slug/create', name: 'content.create', component: () => import('./../views/backend/Website/Content/Create'), beforeEnter: authGuard },
            { path: '/content-file/:slug', name: 'content.file', component: () => import('./../views/backend/Website/Content/CreateFile'), beforeEnter: authGuard },

            // ------------------Slider portion------------------
            { path: '/slider', name: 'slider.index', meta: { title: 'Slider', nav: true }, component: () => import('./../views/backend/Website/Gallery/Slider/Index'), beforeEnter: authGuard },
            { path: '/slider/create', name: 'slider.create', component: () => import('./../views/backend/Website/Gallery/Slider/Create'), beforeEnter: authGuard },
            { path: '/slider/:id', name: 'slider.show', component: () => import('./../views/backend/Website/Gallery/Slider/View'), beforeEnter: authGuard },
            { path: '/slider/:id/edit', name: 'slider.edit', component: () => import('./../views/backend/Website/Gallery/Slider/Create'), beforeEnter: authGuard },

            // ------------------Album portion------------------
            { path: '/album', name: 'album.index', meta: { title: 'Album', nav: true }, component: () => import('./../views/backend/Website/Gallery/Album/Index'), beforeEnter: authGuard },
            { path: '/album/create', name: 'album.create', component: () => import('./../views/backend/Website/Gallery/Album/Create'), beforeEnter: authGuard },
            { path: '/album/:id', name: 'album.show', component: () => import('./../views/backend/Website/Gallery/Album/View'), beforeEnter: authGuard },
            { path: '/album/:id/edit', name: 'album.edit', component: () => import('./../views/backend/Website/Gallery/Album/Create'), beforeEnter: authGuard },

            // ------------------Photo portion------------------
            { path: '/photo', name: 'photo.index', meta: { title: 'Photo', nav: true }, component: () => import('./../views/backend/Website/Gallery/Photo/Index'), beforeEnter: authGuard },
            { path: '/photo/create', name: 'photo.create', component: () => import('./../views/backend/Website/Gallery/Photo/Create'), beforeEnter: authGuard },
            { path: '/photo/:id', name: 'photo.show', component: () => import('./../views/backend/Website/Gallery/Photo/View'), beforeEnter: authGuard },
            { path: '/photo/:id/edit', name: 'photo.edit', component: () => import('./../views/backend/Website/Gallery/Photo/Create'), beforeEnter: authGuard },

            // ------------------Video portion------------------
            { path: '/video', name: 'video.index', meta: { title: 'Video', nav: true }, component: () => import('./../views/backend/Website/Gallery/Video/Index'), beforeEnter: authGuard },
            { path: '/video/create', name: 'video.create', component: () => import('./../views/backend/Website/Gallery/Video/Create'), beforeEnter: authGuard },
            { path: '/video/:id', name: 'video.show', component: () => import('./../views/backend/Website/Gallery/Video/View'), beforeEnter: authGuard },
            { path: '/video/:id/edit', name: 'video.edit', component: () => import('./../views/backend/Website/Gallery/Video/Create'), beforeEnter: authGuard },

            // ------------------Menu portion------------------
            { path: '/menu', name: 'menu.index', meta: { title: 'Menu', nav: true }, component: () => import('./../views/backend/Website/Menu/Index'), beforeEnter: authGuard },
            { path: '/menu/create', name: 'menu.create', component: () => import('./../views/backend/Website/Menu/Create'), beforeEnter: authGuard },
            { path: '/menu/:id', name: 'menu.show', component: () => import('./../views/backend/Website/Menu/View'), beforeEnter: authGuard },
            { path: '/menu/:id/edit', name: 'menu.edit', component: () => import('./../views/backend/Website/Menu/Create'), beforeEnter: authGuard },

































































            // ------------------User portion------------------
            { path: '/user', name: 'user.index', meta: { title: 'User', nav: true }, component: () => import('./../views/backend/User/Index'), beforeEnter: authGuard },
            { path: '/user/create', name: 'user.create', component: () => import('./../views/backend/User/Create'), beforeEnter: authGuard },
            { path: '/user/:id', name: 'user.show', component: () => import('./../views/backend/User/View'), beforeEnter: authGuard },
            { path: '/user/:id/edit', name: 'user.edit', component: () => import('./../views/backend/User/Create'), beforeEnter: authGuard },
            // ------------------Admin portion------------------
            { path: '/admin', name: 'admin.index', meta: { title: 'Admin', nav: true }, component: () => import('./../views/backend/Admin/Index'), beforeEnter: authGuard },
            { path: '/admin/create', name: 'admin.create', component: () => import('./../views/backend/Admin/Create'), beforeEnter: authGuard },
            { path: '/admin/:id', name: 'admin.show', component: () => import('./../views/backend/Admin/View'), beforeEnter: authGuard },
            { path: '/admin/:id/edit', name: 'admin.edit', component: () => import('./../views/backend/Admin/Create'), beforeEnter: authGuard },
            { path: '/dashboard', name: 'admin.dashboard', meta: { title: 'Dashboard', nav: true }, component: () => import('./../views/backend/Admin/Dashboard'), beforeEnter: authGuard },
            // ------------------Role portion------------------
            { path: '/role', name: 'role.index', meta: { title: 'Role', nav: true }, component: () => import('./../views/backend/Menu/Role/Index'), beforeEnter: authGuard },
            { path: '/role/create', name: 'role.create', component: () => import('./../views/backend/Menu/Role/Create'), beforeEnter: authGuard },
            { path: '/role/:id', name: 'role.show', component: () => import('./../views/backend/Menu/Role/View'), beforeEnter: authGuard },
            { path: '/role/:id/edit', name: 'role.edit', component: () => import('./../views/backend/Menu/Role/Create'), beforeEnter: authGuard },
            // ------------------Dominion portion------------------
            { path: '/dominion', name: 'dominion.index', meta: { title: 'Dominion', nav: true }, component: () => import('./../views/backend/Menu/Dominion/Index'), beforeEnter: authGuard },
            { path: '/dominion/create', name: 'dominion.create', component: () => import('./../views/backend/Menu/Dominion/Create'), beforeEnter: authGuard },
            { path: '/dominion/:id', name: 'dominion.show', component: () => import('./../views/backend/Menu/Dominion/View'), beforeEnter: authGuard },
            { path: '/dominion/:id/edit', name: 'dominion.edit', component: () => import('./../views/backend/Menu/Dominion/Create'), beforeEnter: authGuard },
            // ------------------Process portion------------------
            { path: '/process', name: 'process.index', meta: { title: 'Process', nav: true }, component: () => import('./../views/backend/Menu/Process/Index'), beforeEnter: authGuard },
            { path: '/process/create', name: 'process.create', component: () => import('./../views/backend/Menu/Process/Create'), beforeEnter: authGuard },
            { path: '/process/:id', name: 'process.show', component: () => import('./../views/backend/Menu/Process/View'), beforeEnter: authGuard },
            { path: '/process/:id/edit', name: 'process.edit', component: () => import('./../views/backend/Menu/Process/Create'), beforeEnter: authGuard },
            // ------------------Permission portion------------------
            { path: '/permission', name: 'permission.index', meta: { title: 'Permission', nav: true }, component: () => import('./../views/backend/Menu/Permission/Index'), beforeEnter: authGuard },
            { path: '/permission/create', name: 'permission.create', component: () => import('./../views/backend/Menu/Permission/Create'), beforeEnter: authGuard },
            { path: '/permission/:id', name: 'permission.show', component: () => import('./../views/backend/Menu/Permission/View'), beforeEnter: authGuard },
            { path: '/permission/:id/edit', name: 'permission.edit', component: () => import('./../views/backend/Menu/Permission/Create'), beforeEnter: authGuard },
            // ------------------Authorizedmenu portion------------------
            { path: '/authorizedmenu', name: 'authorizedmenu.index', meta: { title: 'Authorized Menu', nav: true }, component: () => import('./../views/backend/Menu/Authorizedmenu/Index'), beforeEnter: authGuard },
            { path: '/authorizedmenu/create', name: 'authorizedmenu.create', component: () => import('./../views/backend/Menu/Authorizedmenu/Create'), beforeEnter: authGuard },
            { path: '/authorizedmenu/:id', name: 'authorizedmenu.show', component: () => import('./../views/backend/Menu/Authorizedmenu/View'), beforeEnter: authGuard },
            { path: '/authorizedmenu/:id/edit', name: 'authorizedmenu.edit', component: () => import('./../views/backend/Menu/Authorizedmenu/Create'), beforeEnter: authGuard },
            // ------------------Module portion------------------
            { path: '/module', name: 'module.index', meta: { title: 'Module Created File', nav: true }, component: () => import('./../views/backend/Module/Index'), beforeEnter: authGuard },
            { path: '/module/create', name: 'module.create', meta: { title: 'Module', nav: true }, component: () => import('./../views/backend/Module/Create'), beforeEnter: authGuard },
            // ------------------Activity Log portion------------------
            { path: '/activityLog', name: 'activityLog.index', meta: { title: 'Activity Log', nav: true }, component: () => import('./../views/backend/ActivityLog/Index'), beforeEnter: authGuard },
            { path: '/activityLog/:id', name: 'activityLog.show', component: () => import('./../views/backend/ActivityLog/View'), beforeEnter: authGuard },
            // ------------------Documents portion------------------
            { path: '/document', name: 'document.index', meta: { title: 'Documents', nav: true }, component: () => import('./../views/backend/Doc/Index'), beforeEnter: authGuard },
            { path: '/document/create', name: 'document.create', component: () => import('./../views/backend/Doc/Create'), beforeEnter: authGuard },
        ]
    },

    // if any component or view not found then showing 404 page
    {
        path: '*', component: () => import('./../views/backend/NotFoundLayout'), beforeEnter: authGuard,
        children: [
            { path: '*', name: '404', component: () => import('./../views/errors/404'), beforeEnter: authGuard }
        ]
    }
];



// ========== define router==========
const router = new VueRouter({
    routes,
    hashbang: false,
    mode: 'history',
    base: process.env.MIX_VUE_ROUTER_BASE + '/admin/',
    linkExactActiveClass: "active",
    scrollBehavior() {
        return { x: 0, y: 0 };
    }
})

// ==========check login or not==========
function authGuard(to, from, next) {
    if (Admin.loggedIn()) {
        if (to.meta.nav) {
            const obj = { 'route': to.name, 'title': to.meta.title ? to.meta.title : to.name }
            breadcrumbs.dispatch("addMenu", obj);
        }
        next();
    } else {
        next({ name: 'admin.loginme' });
    }
}

export default router
