<template>
  <div>
    <div class="box box-success" v-if="!$root.spinner">
      <div class="box-header with-border">
        <div class="row">
          <form v-on:submit.prevent="search" class="form-row col-12 no-padding pl-1">
            <!------------ Single Input ------------>
            <div class="col-2 pl-3 no-padding">
              <select v-model="search_data.type" class="form-control form-control-sm">
                <option value>Select menu type</option>
                <option value="content">Content</option>
                <option value="external_link">External Link</option>
                <option value="outside_website">Outside Website</option>
              </select>
            </div>
            <!------------ Single Input ------------>
            <div class="col-2 pl-3 no-padding">
              <select v-model="search_data.position" class="form-control form-control-sm">
                <option value>Menu position</option>
                <option value="header">Header</option>
                <option value="top_bar">Top Bar</option>
                <option value="footer_bottom">Footer Bottom</option>
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
const model = "menu";

// define table coloumn show in datatable / datalist
const tableColumns = [
  { field: "parent", title: "Parent", subfield: "title" },
  { field: "title", title: "Title" },
  { field: "type", title: "Menu Type" },
  { field: "menu_look_type", title: "Menu Look Type" },
  { field: "content", title: "Content", subfield: "title" },
  { field: "position", title: "position" },
  { field: "sorting", title: "Sorting" },
  { field: "created_at", title: "Created at" },
];
//json fields for export excel
const json_fields = {
  "Parent Menu": "parent.title",
  Title: "title",
  "Menu Type": "type",
  "Menu Look Type": "menu_look_type",
  Content: "content.title",
  Position: "position",
  Sorting: "sorting",
  "Created at": "created_at",
};

export default {
  data() {
    return {
      model: model,
      json_fields: json_fields,
      fields_name: { 0: "Select One", title: "Title", sorting: "Sorting" },
      search_data: {
        pagination: 10,
        field_name: 0,
        value: "",
        type: "",
        position: "",
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