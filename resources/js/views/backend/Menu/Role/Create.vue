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
        <div class="row justify-content-center">
          <form
            v-on:submit.prevent="submit"
            class="form-row col-5 border border-success p-4 rounded"
          >
            <!------------ Single Input ------------>
            <div
              class="form-row col-10"
              :class="{ 'has-error': validation.hasError('data.name'), 'has-success': data.name }"
            >
              <label class="col-3">Role Name</label>
              <div class="col-8">
                <input
                  type="text"
                  v-model="data.name"
                  class="form-control form-control-sm"
                  placeholder="Name"
                />
                <span class="help-block">{{ validation.firstError('data.name') }}</span>
              </div>
            </div>

            <!-------------- button -------------->
            <div class="col-2">
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
const model = "role";

export default {
  data() {
    return {
      model: model,
      data: {},
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
  },
  beforeCreate() {
    this.$root.spinner = true;
  },

  // ================== validation rule for form ==================
  validators: {
    "data.name": function(value = null) {
      return Validator.value(value).required("Name is required");
    }
  }
};
</script>