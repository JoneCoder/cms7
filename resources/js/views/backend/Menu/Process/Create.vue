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
              :class="{ 'has-error': validation.hasError('data.dominion_id'), 'has-success': data.dominion_id }"
            >
              <label>Dominion</label>
              <select
                v-model="data.dominion_id"
                @change="dominion($event)"
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
              class="form-group col-8"
              :class="{ 'has-error': validation.hasError('data.route_name'), 'has-success': data.route_name }"
            >
              <label>Route Name(x.index,x.create,x.store,x.show,x.edit,x.update,x.destroy)</label>
              <input
                type="text"
                v-model="data.route_name"
                class="form-control form-control-sm"
                placeholder="Route Name"
              />
              <span class="help-block">{{ validation.firstError('data.route_name') }}</span>
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
const model = "process";

export default {
  data() {
    return {
      model: model,
      data: { dominion_id: "", guard: "admin" },
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
    dominion(event) {
      let all_process = "";
      let process = [
        "index",
        "create",
        "store",
        "show",
        "edit",
        "update",
        "destroy"
      ];
      let dom = this.$root.allDominionList[event.target.value]
        .toLowerCase()
        .trim();

      process.forEach(element => {
        all_process += dom + "." + element + ",";
      });
      this.data.route_name = all_process.slice(0, -1);
    }
  },
  created() {
    if (this.$route.params.id) {
      this.setBreadcrumbs(this.model, "edit"); // Set Breadcrumbs
      this.get_data(this.model, this.$route.params.id, "data"); // get data for edit
    } else {
      this.setBreadcrumbs(this.model, "create"); // Set Breadcrumbs
      setTimeout(() => (this.$root.spinner = false), 200);
    }
  },
  beforeCreate() {
    this.$root.spinner = true;
  },

  // ================== validation rule for form ==================
  validators: {
    "data.dominion_id": function(value = null) {
      return Validator.value(value).required("Dominion is required");
    },
    "data.route_name": function(value = null) {
      return Validator.value(value).required("Route Name is required");
    }
  }
};
</script>