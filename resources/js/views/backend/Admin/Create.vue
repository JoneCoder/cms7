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
              v-if="!$route.params.id"
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.email') || errors.email, 'has-success': data.email }"
            >
              <label>Email</label>
              <input
                type="text"
                v-model="data.email"
                class="form-control form-control-sm"
                placeholder="Email"
              />
              <span class="help-block" v-if="errors.email">{{ errors.email[0] }}</span>
              <span class="help-block">{{ validation.firstError('data.email') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              v-if="!$route.params.id"
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.password'), 'has-success': data.password }"
            >
              <label>Password</label>
              <input
                type="password"
                v-model="data.password"
                class="form-control form-control-sm"
                placeholder="Password"
              />
              <span class="help-block">{{ validation.firstError('data.password') }}</span>
            </div>
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
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.mobile'), 'has-success': data.mobile }"
            >
              <label>Mobile</label>
              <input
                type="text"
                v-model="data.mobile"
                class="form-control form-control-sm"
                placeholder="Mobile"
              />
              <span class="help-block">{{ validation.firstError('data.mobile') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.address'), 'has-success': data.address }"
            >
              <label>Address</label>
              <textarea
                name="address"
                v-model="data.address"
                class="form-control form-control-sm"
                placeholder="Address"
              ></textarea>
              <span class="help-block">{{ validation.firstError('data.address') }}</span>
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
const model = "admin";

export default {
  data() {
    return {
      model: model,
      data: {
        role_id: ""
      },
      extraData: {
        roles: []
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
    this.get_paginate_data("role", { allData: true }, "roles"); // get roles
  },
  beforeCreate() {
    this.$root.spinner = true;
  },

  // ================== validation rule for form ==================
  validators: {
    "data.name": function(value = null) {
      return Validator.value(value).required("Name is required");
    },
    "data.email": function(value = null) {
      if (!this.$route.params.id) {
        return Validator.value(value)
          .required("Email is required")
          .email();
      }
    },
    "data.role_id": function(value = null) {
      return Validator.value(value).required("Role is required");
    },
    "data.password": function(value = null) {
      if (!this.$route.params.id) {
        return Validator.value(value)
          .required("Password is required")
          .minLength(6);
      }
    },
    "data.mobile": function(value = null) {
      return Validator.value(value)
        .digit()
        .regex("01+[0-9+-]*$", "Must start with 01.")
        .minLength(11)
        .maxLength(15);
    }
  }
};
</script>