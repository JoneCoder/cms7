<template>
  <div>
    <div class="box box-success" v-if="!$root.spinner">
      <div class="box-header with-border">
        <h3 class="box-title">{{ model + " Create" }}</h3>

        <!--============ Add or Back Button Start ============-->
        <AddOrBackButton :route="model +'.index'" :portion="model" :icon="'arrow-left'" />
        <!--============ Add or Back Button End ============-->
      </div>

      <div class="box-body box-min-height">
        <!--============ Form Start ============-->
        <div class="row">
          <form v-on:submit.prevent="submit" class="form-row col-12">
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.parent_id'), 'has-success': data.parent_id }"
            >
              <label>Parent menu</label>
              <select v-model="data.parent_id" class="form-control form-control-sm">
                <option value>Select parent menu</option>
                <option
                  v-for="(value, id, index) in rootMenu"
                  :key="index"
                  v-bind:value="id"
                >{{ value }}</option>
              </select>
              <span class="help-block">{{ validation.firstError('data.parent_id') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.name'), 'has-success': data.name }"
            >
              <label>Name</label>
              <input
                type="text"
                v-model="data.name"
                class="form-control form-control-sm"
                placeholder="Name"
              />
              <span class="help-block">{{ validation.firstError('data.name') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.dominion_id'), 'has-success': data.dominion_id }"
            >
              <label>Dominion</label>
              <select
                v-on:change="getAllProcess(data.dominion_id,'dominion_id')"
                v-model="data.dominion_id"
                class="form-control form-control-sm"
              >
                <option value>Select Dominion</option>
                <option
                  v-for="(dominion, dominion_id) in $root.allDominionList"
                  :key="dominion_id"
                  v-bind:value="dominion_id"
                >{{ dominion}}</option>
              </select>
              <span class="help-block">{{ validation.firstError('data.dominion_id') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.process_id'), 'has-success': data.process_id }"
            >
              <label>Process</label>
              <select
                v-model="data.process_id"
                v-on:change="changeGuard(data.process_id)"
                class="form-control form-control-sm"
              >
                <option value>Select Process</option>
                <option
                  v-for="(process,id,index) in AllProcess"
                  :key="index"
                  :value="process.id"
                >{{ process.name }}({{$root.guards[process.guard]}})</option>
              </select>
              <span class="help-block">{{ validation.firstError('data.process_id') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.icon'), 'has-success': data.icon }"
            >
              <label>Icon</label>
              <input
                type="text"
                v-model="data.icon"
                class="form-control form-control-sm"
                placeholder="Icon"
              />
              <span class="help-block">{{ validation.firstError('data.icon') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.position'), 'has-success': data.position }"
            >
              <label>Position</label>
              <input
                type="text"
                v-model.number="data.position"
                class="form-control form-control-sm"
                placeholder="Position"
              />
              <span class="help-block">{{ validation.firstError('data.position') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.route_name'), 'has-success': data.route_name }"
            >
              <label>Route Name</label>
              <input
                type="text"
                v-model="data.route_name"
                class="form-control form-control-sm"
                placeholder="Route Name"
                disabled
              />
              <span class="help-block">{{ validation.firstError('data.route_name') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.params'), 'has-success': data.params }"
            >
              <label>Params</label>
              <input
                type="text"
                v-model="data.params"
                class="form-control form-control-sm"
                placeholder="Params"
              />
              <span class="help-block">{{ validation.firstError('data.params') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div class="form-group col-2">
              <label>Show Dashboard</label>
              <div class="row mt-2">
                <div class="col-4">
                  <input type="radio" name="status" v-model="data.show_dasboard" :value="0" /> No
                </div>
                <div class="col-6">
                  <input type="radio" name="status" v-model="data.show_dasboard" :value="1" /> Yes
                </div>
              </div>
            </div>
            <!-------------- button -------------->
            <div class="col-12 mb-3 mt-2">
              <button type="submit" class="btn btn-sm btn-info">Submit</button>
            </div>
            <!-------------- button -------------->
          </form>
        </div>
        <!--============ Form End ============-->
      </div>
    </div>
  </div>
</template>

<script>
// define model name
const model = "authorizedmenu";

export default {
  data() {
    return {
      model: model,
      dominions: {},
      ProcessList: [],
      AllProcess: [],
      rootMenu: [],
      data: {
        parent_id: "",
        dominion_id: "",
        process_id: "",
        position: 0,
        icon: "<i class='fa fa-circle-o text-aqua'></i>",
        show_dasboard: 0,
        guard: "admin"
      },
      errors: {}
    };
  },
  methods: {
    submit: function() {
      const error = this.validation.countErrors();
      this.$validate().then(res => {
        // If there is an error
        if (error > 0) {
          this.notification(
            "You need to fill " + error + " more empty mandatory fields",
            "warning"
          );
          return false;
        }

        // If there is no error
        if (res) {
          if (this.data.id) {
            this.update(this.model, this.data, this.data.id);
          } else {
            this.store(this.model, this.data);
          }
        }
      });
    },
    dominionList() {
      axios
        .get("/dominionList")
        .then(response => {
          this.dominions = response.data;
        })
        .catch(error => {
          console.log(error.response);
        });
    },
    getProcessList(id = null, field = null) {
      let url = "/processList";
      if ((id.length > 0) & (field.length > 0)) {
        url = url + "/" + id + "/" + field;
      }
      axios
        .get(url)
        .then(response => {
          this.ProcessList = response.data;
        })
        .catch(error => {
          console.log(error.response);
        });
    },
    getAllProcess(id = null, field = null) {
      let url = "/AllProcess";
      if ((id.length > 0) & (field.length > 0)) {
        url = url + "/" + id + "/" + field;
      }
      axios
        .get(url)
        .then(response => {
          this.AllProcess = response.data;
        })
        .catch(error => {
          console.log(error.response);
        });
    },
    getRootMenu() {
      axios
        .get("/rootmenu")
        .then(response => {
          this.rootMenu = response.data;
          // console.log(response.data);
        })
        .catch(error => {
          console.log(error.response);
        });
    },
    changeGuard(process_id) {
      for (process in this.AllProcess) {
        if (this.AllProcess[process].id == process_id) {
          this.data.guard = this.AllProcess[process].guard;
          this.data.route_name = this.AllProcess[process].route_name;
        }
      }
    }
  },
  created() {
    if (this.$route.params.id) {
      this.setBreadcrumbs(this.model, "edit"); // Set Breadcrumbs
      this.get_data(this.model, this.$route.params.id, "data"); // get data for edit
      this.getAllProcess(this.data.dominion_id, "dominion_id");
    } else {
      this.setBreadcrumbs(this.model, "create"); // Set Breadcrumbs
      setTimeout(() => (this.$root.spinner = false), 200);
    }

    this.dominionList();
    this.getRootMenu();
  },
  beforeCreate() {
    this.$root.spinner = true;
  },

  // ================== validation rule for form ==================
  validators: {
    "data.name": function(value = null) {
      return Validator.value(value).required("Name is required");
    },
    // "data.dominion_id": function(value = null) {
    //   return Validator.value(value).required("Dominion is required");
    // },
    // "data.process_id": function(value = null) {
    //   return Validator.value(value).required("Process is required");
    // },
    "data.position": function(value = null) {
      return Validator.value(value).digit();
    }
  }
};
</script>