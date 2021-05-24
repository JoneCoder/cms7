import Vuex from 'vuex'
import Vue from 'vue'
Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        image: "",
    },
    getters: {},
    actions: {
        setProfile(context, data) {
            context.commit('storeProfile', data)
        }
    },
    mutations: {
        storeProfile(state, data) {
            state.image = data;
        }
    },
});