import Vuex from 'vuex'
import Vue from 'vue'
Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        breadcrumbLevels: []
    },
    getters: {},
    actions: {
        setBreadcrumbs(context, data) {
            context.commit('pushBreadcrumbs', data)
        }
    },
    mutations: {
        pushBreadcrumbs(state, data) {
            state.breadcrumbLevels = [];
            state.breadcrumbLevels.push(data);
        }
    },
});