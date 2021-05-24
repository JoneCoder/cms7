<template>
  <div>
    <div class="box box-success" v-if="!$root.spinner">
      <div class="box-header with-border">
        <div class="row">
          <form v-on:submit.prevent="search" class="form-row col-12 no-padding pl-1">
            <div class="col-2 pl-3 no-padding">
              <select v-model="search_data.description" class="form-control form-control-sm">
                <option value>All User</option>
                <option
                  v-for="(admins, index) in extraData.admins"
                  :key="index"
                  v-bind:value="admins.name"
                >{{ admins.name }}</option>
              </select>
            </div>
            <div class="col-2 pl-1 no-padding">
              <select v-model="search_data.dominion" class="form-control form-control-sm">
                <option value>All Module</option>
                <option
                  v-for="(dominion, dominion_id) in $root.allDominionList"
                  :key="dominion_id"
                  v-bind:value="dominion"
                >{{ dominion }}</option>
              </select>
            </div>

            <div class="col-2 pl-1 no-padding">
              <select v-model="search_data.action" class="form-control form-control-sm">
                <option value>Action</option>
                <option>created</option>
                <option>updated</option>
                <option>deleted</option>
              </select>
            </div>

            <!--============ Search Option Start ============-->
            <Search :fields_name="fields_name" />
            <!--============ Search Option End ============-->
            <div class="col-1 pl-3 no-padding">
              <button type="button" @click="allRead" class="btn btn-sm btn-info">
                <i class="fa fa-newspaper-o"></i> Mark all as read
              </button>
            </div>
          </form>
        </div>
      </div>

      <!--============ Data List Start ============-->
      <div class="box-body box-min-height">
        <base-table
          :data="table.datas"
          :columns="table.columns"
          :routes="table.routes"
          thead-classes="bg-light text-secondary"
        ></base-table>
      </div>
      <!--============ Data List End ============-->

      <div class="box-footer clearfix">
        <!--============ Pagination Start ============-->
        <Pagination :url="model" v-if="!$root.spinner" :search_data="search_data" />
        <!--============ Pagination End ============-->
      </div>
    </div>
  </div>
</template>

<script>
// define model name
const model = "activityLog";

// define table coloumn show in datatable / datalist
const tableColumns = [
  { field: "log_name", title: "Module" },
  { field: "description", title: "Description" },
  { field: "status", title: "Status" },
  { field: "created_at", title: "Created at" },
];
//json fields for export excel
const json_fields = {
  Module: "log_name",
  Description: "description",
  Status: "status",
  "Created at": "created_at",
};

export default {
  data() {
    return {
      model: model,
      json_fields: json_fields,
      fields_name: {
        0: "Select One",
        log_name: "Module",
        description: "Description",
      },
      search_data: {
        pagination: 10,
        field_name: 0,
        value: "",
        description: "",
        dominion: "",
        action: "",
        date: "",
      },
      extraData: {
        admins: [],
      },
      table: {
        columns: tableColumns,
        routes: {},
        datas: [],
        meta: [],
        links: [],
      },
    };
  },
  methods: {
    destroy(id) {
      this.destroy_data(this.model, id, this.search_data);
    },
    search() {
      this.get_paginate_data(this.model, this.search_data);
    },
    allRead() {
      this.$root.spinner = true;
      axios
        .get("/allRead")
        .then((res) => {
          this.search();
          this.notification(res.data.message, "success");
        })
        .catch((error) => console.log())
        .then((alw) => setTimeout(() => (this.$root.spinner = false), 200));
    },
  },
  async created() {
    await this.search(); // get data list
    this.getRouteName(this.model); // get route name for edit / delete / show
    this.setBreadcrumbs(this.model, "index"); // Set Breadcrumbs
    this.get_paginate_data("admin", { allData: true }, "admins"); // get admins
  },
};
</script>