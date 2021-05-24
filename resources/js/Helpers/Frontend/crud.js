Vue.mixin({
    methods: {
        // =================  get single data =================
        get_data(url, dataVar, id = null) {
            try {
                this.$root.spinner = true;
                axios.get("/" + url + "/" + id)
                    .then(res => {
                        this.datas[dataVar] = res.data;
                    })
                    .catch(error => console.log(error))
                    .then(alw => setTimeout(() => (this.$root.spinner = false), 200));
            } catch (e) {
                return e.response;
            }
        },

        // =================  get paginate data =================
        get_paginate_data(url, params = null) {
            try {
                this.$root.spinner = true;
                axios
                    .get(url, { params: params })
                    .then(res => {
                        this.table['datas'] = res.data.data;
                        this.table['meta'] = res.data.meta;
                        this.table['links'] = res.data.links;
                    })
                    .catch(error => console.log(error))
                    .then(alw => setTimeout(() => (this.$root.spinner = false), 200));
            } catch (e) {
                return e.response;
            }
        },
    }
});