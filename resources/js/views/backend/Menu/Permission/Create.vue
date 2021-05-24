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
              class="form-group mb-2 col-3"
              :class="{ 'has-error': validation.hasError('data.role_id'), '': data.role_id }"
            >
              <label class="control-label">Role</label>
              <select v-model="data.role_id" class="form-control form-control-sm">
                <option value>Select Role</option>
                <option
                  v-for="(value, index) in extraData.roles"
                  :key="index"
                  v-bind:value="value.id"
                >{{ value.name }}</option>
              </select>
              <span class="help-block">{{ validation.firstError('data.role_id') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div class="form-group col-1 pt-4">
              <input chacked type="checkbox" id="is_closed" value="1" v-model="check_all" />
              <label class="col-form-label-sm font-weight-normal mb-0" for="is_closed">Check All</label>
            </div>
            <div class="w-100"></div>
            <table border="1" class="table tablesorter border table-hover">
              <tr v-for="dominion in dominions" :key="dominion.id">
                <td>{{dominion.name}}</td>
                <td>
                  <div class="row">
                    <div class="col-3" v-for="processe in dominion.processes" :key="processe.id">
                      <input
                        :value="processe"
                        v-model="data.permissions"
                        type="checkbox"
                        checked
                        :id="processe.id"
                      />
                      <label :for="processe.id">{{processe.name}}({{$root.guards[processe.guard]}})</label>
                    </div>
                  </div>
                </td>
              </tr>
            </table>
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
const model = "permission";

export default {
  data() {
    return {
      model: model,
      check_all: null,
      dominions: {},
      data: {
        role_id: "",
        permissions: []
      },
      extraData: {
        roles: []
      },
      permission: [],
      errors: {}
    };
  },
  watch: {
    check_all: function(val, oldval) {
      this.data.permissions = [];
      if (val) {
        this.dominions.forEach(dominion => {
          dominion.processes.forEach(process => {
            this.data.permissions.push(process);
          });
        });
      }
    }
  },
  methods: {
    submit: function() {
      const error = this.validation.countErrors();
      this.$validate().then(res => {
        // If there is an error
        if (error > 0) {
          this.flashMessage.warning({
            title: "Empty Mandatory Fields!!",
            icon: this.$root.baseurl + "/images/warning.png",
            message:
              "You need to fill " + error + " more empty mandatory fields"
          });
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
    allDominion() {
      this.$root.spinner = true;
      axios
        .get("/alldominion")
        .then(response => {
          this.dominions = response.data;
        })
        .catch(error => console.log())
        .then(alw => setTimeout(() => (this.$root.spinner = false), 200));
    }
  },
  created() {
    if (this.$route.params.id) {
      this.setBreadcrumbs(this.model, "edit"); // Set Breadcrumbs
      this.get_data(this.model, this.$route.params.id, "data"); // get data for edit
    } else {
      this.setBreadcrumbs(this.model, "create"); // Set Breadcrumbs
    }
    this.get_paginate_data("role", { allData: true }, "roles"); // get roles
    this.allDominion();
  },

  // ================== validation rule for form ==================
  validators: {
    "data.role_id": function(value = null) {
      return Validator.value(value).required("Role is required");
    }
  }
};
</script>