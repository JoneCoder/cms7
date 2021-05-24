<template>
  <div>
    <div class="box box-success" v-if="!$root.spinner">
      <div class="box-header with-border">
        <div class="row">
          <form v-on:submit.prevent="search" class="form-row col-12 no-padding pl-1">
            <div class="col-2 pl-3 no-padding">
              <select v-model="search_data.dominion_id" class="form-control form-control-sm">
                <option value>Select Dominion</option>
                <option
                  v-for="(dominion, dominion_id) in $root.allDominionList"
                  :key="dominion_id"
                  v-bind:value="dominion_id"
                >{{ dominion}}</option>
              </select>
            </div>
            <!--============ Search Option Start ============-->
            <Search :fields_name="fields_name" />
            <!--============ Search Option End ============-->
          </form>
        </div>

        <!--============ Add or Back Button Start ============-->
        <AddOrBackButton :route="model+'.create'" :portion="model" :icon="'plus'" />
        <!--============ Add or Back Button End ============-->
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
const model = "process";

// define table coloumn show in datatable / datalist
const tableColumns = [
  { field: "name", title: "Process Name" },
  { field: "dominion", title: "Dominion Name", subfield: "name" },
  { field: "route_name", title: "Route Name" },
  { field: "created_at", title: "Created at" },
];
//json fields for export excel
const json_fields = {
  "Process Name": "name",
  "Dominion Name": "dominion.name",
  "Route Name": "route_name",
  "Created at": "created_at",
};

export default {
  data() {
    return {
      model: model,
      json_fields: json_fields,
      fields_name: { 0: "Select One", name: "Name" },
      search_data: {
        pagination: 10,
        dominion_id: "",
        field_name: 0,
        value: "",
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
  },
  async created() {
    await this.search(); // get data list
    this.getRouteName(this.model); // get route name for edit / delete / show
    this.setBreadcrumbs(this.model, "index"); // Set Breadcrumbs
  },
};
</script>