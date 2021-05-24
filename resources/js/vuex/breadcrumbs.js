import Vuex from 'vuex'
import Vue from 'vue'
Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        breadcrumbLevels: [],
        menuTags: [{ route: 'admin.dashboard', title: "Dashboard" }]
    },
    getters: {},
    actions: {
        setBreadcrumbs(context, data) {
            context.commit('pushBreadcrumbs', data)
        },
        addMenu(context, data) {
            context.commit('pushMenu', data)
        },
        removeMenu(context, index) {
            context.commit('spliceMenu', index)
        }
    },
    mutations: {
        pushBreadcrumbs(state, data) {
            state.breadcrumbLevels = [];
            state.breadcrumbLevels.push(data);
        },
        pushMenu(state, data) {
            if (!state.menuTags.some(obj => obj.title === data.title)) {
                state.menuTags.push(data);
            };
        },
        spliceMenu(state, index) {
            state.menuTags.splice(index, 1);
        }
    },
});