Vue.mixin({
    methods: {
        // =================  get paginate data =================
        get_paginate_data(url, params = null, allData = null, id = null) {
            try {
                this.$root.spinner = true;
                if (id) {
                    url = url + '/' + id;
                }
                axios
                    .get(url, { params: params })
                    .then(res => {
                        if (allData) {
                            this.extraData[allData] = res.data;
                        } else {
                            this.table['datas'] = res.data.data;
                            this.table['meta'] = res.data.meta;
                            this.table['links'] = res.data.links;
                        }
                    })
                    .catch(error => console.log(error))
                    .then(alw => setTimeout(() => (this.$root.spinner = false), 200));
            } catch (e) {
                return e.response;
            }
        },

        // =================  get single data =================
        get_data(model_name, id, dataVar, extra = null) {
            try {
                this.$root.spinner = true;
                axios.get("/" + model_name + "/" + id)
                    .then(res => {
                        if (extra) {
                            this.extraData[dataVar] = res.data;
                        } else {
                            this.data = res.data
                        }
                    })
                    .catch(error => console.log(error))
                    .then(alw => setTimeout(() => (this.$root.spinner = false), 200));
            } catch (e) {
                return e.response;
            }
        },



        // =================  store data =================
        store(model_name, data) {
            this.$root.spinner = true;
            axios.post("/" + model_name, data)
                .then(res => {
                    this.notification(res.data.message, "success");
                    this.$router.push({ name: model_name + '.index' })
                })
                .catch(error => {
                    if (error.response.status === 422) {
                        this.errors = error.response.data.errors || {};
                        this.notification("You need to fill empty mandatory fields", "warning");
                    }
                })
                .then(alw => setTimeout(() => (this.$root.spinner = false), 400));
        },

        urlbasestore(url, model_name, data) {
            this.$root.spinner = true;
            axios.post("/" + url, data)
                .then(res => {
                    this.notification(res.data.message, "success");
                    this.$router.push({ name: model_name + '.index' })
                })
                .catch(error => {
                    if (error.response.status === 422) {
                        this.errors = error.response.data.errors || {};
                        this.notification("You need to fill empty mandatory fields", "warning");
                    }
                })
                .then(alw => setTimeout(() => (this.$root.spinner = false), 400));
        },

        // =================  update data =================
        update(model_name, data, id, image = null) {
            this.$root.spinner = true;
            if (image) {
                data.append("_method", "put");
                axios.post("/" + model_name + "/" + id, data)
                    .then(res => {
                        this.notification(res.data.message, "success");
                        this.$router.push({ name: model_name + '.index' })
                    })
                    .catch(error => {
                        if (error.response.status === 422) {
                            this.errors = error.response.data.errors || {};
                            this.notification("You need to fill empty mandatory fields", "warning");
                        }
                    })
                    .then(alw => setTimeout(() => (this.$root.spinner = false), 400));
            }
            else {
                axios.put("/" + model_name + "/" + id, data)
                    .then(res => {
                        this.notification(res.data.message, "success");
                        this.$router.push({ name: model_name + '.index' })
                    })
                    .catch(error => {
                        if (error.response.status === 422) {
                            this.errors = error.response.data.errors || {};
                            this.notification("You need to fill empty mandatory fields", "warning");
                        }
                    })
                    .then(alw => setTimeout(() => (this.$root.spinner = false), 400));
            }

        },

        // ================= destroy data =================
        destroy_data(model_name, id, search_data) {
            this.$root.spinner = true;
            axios
                .delete("/" + model_name + "/" + id)
                .then(res => {
                    this.get_paginate_data(model_name, search_data)
                    this.notification(res.data.message, "success");
                })
                .catch(error => console.log(error))
                .then(alw => setTimeout(() => (this.$root.spinner = false), 200));
        },

        // ================= get route name =================
        getRouteName(model) {
            this.table.routes = {
                view: model + ".show",
                edit: model + ".edit",
                destroy: model + ".destroy"
            };
        },
    }
});
