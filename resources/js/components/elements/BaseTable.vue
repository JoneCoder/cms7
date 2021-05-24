<template>
  <div>
    <!-- ================Excel , PDF, Print Button================ -->
    <div class="box-header no-padding epp-content">
      <select
        @change="$parent.search"
        v-model="$parent.search_data.pagination"
        class="form-control form-control-sm paginate"
      >
        <option>10</option>
        <option>25</option>
        <option>50</option>
        <option>100</option>
      </select>
      <div class="box-tools pull-right">
        <!-- print -->
        <a
          href="javascript:void(0)"
          class="btn btn-default btn-xs"
          @click="print('printArea',$parent.model)"
        >
          <i class="fa fa-print"></i> Print
        </a>
        <!-- /print -->
        <!-- PDF -->
        <a href="javascript:void(0)" class="btn btn-default btn-xs" @click="generatePdf">
          <i class="fa fa-file-pdf-o"></i> Download PDF
        </a>
        <!-- /pdf -->
        <!-- Excel -->
        <download-excel
          v-if="$parent.table.datas"
          class="btn btn-default btn-xs"
          :data="$parent.table.datas"
          :fields="$parent.json_fields"
          :name="$parent.model+'.xls'"
        >
          <i class="fa fa-file-excel-o"></i> Export as Excel
        </download-excel>
        <!-- Excel -->
      </div>
    </div>
    <!-- ================Excel , PDF, Print Button================ -->

    <div class="col-12 no-padding" id="printArea">
      <div class="table-responsive">
        <table
          id="pdf-table"
          class="table table-bordered table-hover table-striped"
          :class="tableClass"
          border="1"
        >
          <thead class="bg-purple text-white base-table-thead">
            <tr>
              <th class="sl">#</th>
              <slot name="columns">
                <th
                  v-for="(column,index) in columns"
                  :key="'a'+index"
                  @click="sort(column.field)"
                  class="sort-th"
                >
                  {{column.title}}
                  <i
                    v-if="!column.subfield && order=='desc'"
                    class="fa fa-sort-amount-desc pull-right sort"
                  ></i>
                  <i
                    v-if="!column.subfield  && order=='asc'"
                    class="fa fa-sort-amount-asc pull-right sort"
                  ></i>
                </th>

                <th
                  v-if="Object.keys(routes).length>0 && ($root.checkPermission(routes.view)||$root.checkPermission(routes.edit)||$root.checkPermission(routes.destroy))"
                  :class="routes.array?'action-extra':'action'"
                >Action</th>
              </slot>
            </tr>
          </thead>
          <tbody v-if="Object.keys(this.data).length > 0" :class="tbodyClasses">
            <tr v-for="(item, index) in data" :key="index">
              <td v-if="$parent.table.meta">{{$parent.table.meta.from+index}}</td>
              <td v-else>{{index+1}}</td>
              <slot :row="item">
                <td
                  v-for="(column, index) in columns"
                  :key="'b'+index"
                  :v-if="hasValue(item, column.field)"
                >
                  <span v-if="column.html" v-html="itemValue(item, column.field, column.subfield)"></span>
                  <span
                    v-else-if="column.maxLength && itemValue(item, column.field, column.subfield).length>column.maxLength"
                    class="des"
                  >{{ itemValue(item, column.field, column.subfield).substring(0,column.maxLength) + "..."}}</span>
                  <span
                    v-else-if="column.date "
                  >{{itemValue(item, column.field, column.subfield)|formatDate}}</span>
                  <span
                    v-else-if="column.field == 'created_at'"
                  >{{itemValue(item, column.field, column.subfield)|formatDate}}</span>
                  <span
                    v-else-if="column.array"
                  >{{ column.array_value[0][itemValue(item, column.field, column.subfield)] }}</span>
                  <span
                    v-else-if="column.field == 'updated_at'"
                  >{{itemValue(item, column.field, column.subfield)|formatDate}}</span>
                  <img
                    v-else-if="(column.image && itemValue(item, column.field, column.subfield))"
                    :src="itemValue(item, column.field, column.subfield)"
                    class="img-fluid"
                    :width="column.width"
                    :height="column.height"
                  />
                  <span v-else-if="column.custom_status">
                    <span
                      class="badge text-uppercase text-white"
                      :class="itemValue(item, column.field, column.subfield)==0?'bg-danger':'bg-success'"
                    >{{column.value[itemValue(item, column.field, column.subfield)]}}</span>
                  </span>
                  <span v-else-if="column.field == 'status'">
                    <span
                      class="badge bg-green"
                      v-if="itemValue(item, column.field, column.subfield) == 'a' || itemValue(item, column.field, column.subfield) == 1"
                    >ACTIVE</span>
                    <span
                      class="badge bg-red"
                      v-if="itemValue(item, column.field, column.subfield) == 'd' || itemValue(item, column.field, column.subfield) == 0"
                    >DEACTIVE</span>
                    <span
                      class="badge bg-red"
                      v-if="itemValue(item, column.field, column.subfield) == 'ur'"
                    >UNREAD</span>
                    <span
                      class="badge bg-green"
                      v-if="itemValue(item, column.field, column.subfield) == 'r'"
                    >READ</span>
                    <span
                      class="badge bg-red"
                      v-if="itemValue(item, column.field, column.subfield) == 'pending'"
                    >PENDING</span>
                    <span
                      class="badge bg-green"
                      v-if="itemValue(item, column.field, column.subfield) == 'success'"
                    >SUCCESS</span>
                  </span>
                  <span
                    v-else-if="column.time"
                  >{{itemValue(item, column.field, column.subfield)|formatTime}}</span>
                  <span v-else>{{itemValue(item, column.field, column.subfield)}}</span>
                </td>

                <td
                  v-if="Object.keys(routes).length>0 && ($root.checkPermission(routes.view)||$root.checkPermission(routes.edit)||$root.checkPermission(routes.destroy))"
                  :class="routes.array?'action-extra':'action'"
                >
                  <router-link
                    v-if="routes.view && $root.checkPermission(routes.view)"
                    :to="{ name:routes.view, params: { id: item.slug?item.slug:item.id }}"
                    class="btn btn-xs btn-success action-view"
                    title="View"
                  >
                    <i class="fa fa-eye"></i>
                  </router-link>

                  <router-link
                    v-if="routes.edit && $root.checkPermission(routes.edit)"
                    :to="{ name:routes.edit, params: { id: item.slug?item.slug:item.id }}"
                    class="btn btn-xs btn-primary action-pencil"
                    title="Edit"
                  >
                    <i class="fa fa-pencil"></i>
                  </router-link>

                  <button
                    v-if="routes.destroy && $root.checkPermission(routes.destroy)"
                    v-on:click="destroy(item.slug?item.slug:item.id)"
                    class="btn btn-xs btn-danger action-trash"
                    title="Delete"
                  >
                    <i class="fa fa-trash"></i>
                  </button>

                  <!-- custom route -->
                  <slot v-if="routes.array">
                    <slot v-for="(rt , index) in routes.array">
                      <router-link
                        :key="index"
                        v-if="rt.route && $root.checkPermission(rt.route)"
                        :to="{ name:rt.route, params: { id: item.slug?item.slug:item.id }}"
                        :class="'btn btn-xs btn-'+rt.btnColor"
                        class="action-custom"
                      >
                        <i :class="'fa fa-'+rt.icon"></i>
                      </router-link>
                    </slot>
                  </slot>
                </td>
              </slot>
            </tr>
          </tbody>
          <tbody v-else>
            <tr>
              <td :colspan="Object.keys(columns).length+2">
                <p class="p-2 text-center text-red no-data">No data found.</p>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>
<script>
import Axios from "axios";
export default {
  name: "base-table",
  data() {
    return {
      order: "desc",
      noDataFound: false,
      json_meta: [
        [
          {
            key: "charset",
            value: "utf-8",
          },
        ],
      ],
    };
  },
  props: {
    columns: {
      type: Array,
      default: () => [],
      description: "Table columns",
    },
    data: {
      type: Array,
      default: () => [],
      description: "Table data",
    },
    type: {
      type: String, // striped | hover
      default: "",
      description: "Whether table is striped or hover type",
    },
    theadClasses: {
      type: String,
      default: "",
      description: "<thead> css classes",
    },
    tbodyClasses: {
      type: String,
      default: "",
      description: "<tbody> css classes",
    },
    routes: {
      type: Object,
      default: () => [],
      description: "Table columns",
    },
  },
  computed: {
    tableClass() {
      return this.type && `table-${this.type}`;
    },
    filteredData: function () {
      var self = this;

      var searchValue = self.$parent.search_data.value;
      return this.data.filter((item, key) => {
        let field_check = self.columns[0].field;
        return !self.columns[0].subfield
          ? field_check
              .toLowerCase()
              .includes(self.$parent.search_data.value.toLowerCase())
          : item;
      });
    },
  },
  methods: {
    hasValue(item, column) {
      return item[column.toLowerCase()] !== "undefined";
    },
    itemValue(item, column, subcolunn = "") {
      var objcolumn = item[column.toLowerCase()];
      if (column == "guard") {
        return this.$root.guards[objcolumn];
      }
      if (objcolumn == null) {
        return objcolumn;
      } else if (typeof objcolumn == "object") {
        var return_data = item[column.toLowerCase()][subcolunn.toLowerCase()];
        return return_data;
      } else {
        return objcolumn;
      }
    },
    destroy(id) {
      // const sp = this.routes.view.split(".");
      if (confirm("Are you sure want to delete?")) {
        this.$parent.destroy(id);
      }
    },
    sort(field) {
      this.data.sort(this.sortBy(field));
    },
    sortBy(property) {
      if (this.order === "desc") {
        this.order = "asc";
      } else {
        this.order = "desc";
      }
      const order = this.order;
      return function (a, b) {
        const varA =
          typeof a[property] === "string"
            ? a[property].toUpperCase()
            : a[property];
        const varB =
          typeof b[property] === "string"
            ? b[property].toUpperCase()
            : b[property];

        let comparison = 0;
        if (varA > varB) comparison = 1;
        else if (varA < varB) comparison = -1;
        return order === "desc" ? comparison * -1 : comparison;
      };
    },
    generatePdf() {
      const doc = new jsPDF();
      $(".action").css("display", "none");
      autoTable(doc, { html: "#pdf-table" });
      doc.save(this.$parent.model + ".pdf");
    },
  },
};
</script>