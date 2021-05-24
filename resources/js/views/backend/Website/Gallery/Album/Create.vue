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
          <form
            v-on:submit.prevent="submit"
            enctype="multipart/form-data"
            id="form"
            class="form-row col-12"
          >
            <!------------ Single Input ------------>
            <div class="form-group col-2">
              <label>Type</label>
              <div class="row mt-2">
                <div class="col-6">
                  <input type="radio" name="status" v-model="data.type" :value="'Photos'" /> Photos
                </div>
                <div class="col-6">
                  <input type="radio" name="status" v-model="data.type" :value="'Videos'" /> Videos
                </div>
              </div>
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
              class="form-group col-2"
              :class="{ 'has-error': validation.hasError('data.sorting'), 'has-success': data.sorting }"
            >
              <label>Sorting</label>
              <input
                type="number"
                v-model="data.sorting"
                class="form-control form-control-sm"
                placeholder="Sorting"
              />
              <span class="help-block">{{ validation.firstError('data.sorting') }}</span>
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
// ===============Promise===============
import Promise from "bluebird";
// define model name
const model = "album";

export default {
  data() {
    return {
      model: model,
      exist: false,
      data: { type: "Photos" },
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
          if (this.data.slug) {
            this.update(this.model, this.data, this.data.slug);
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
      var app = this;
      return Validator.value(value)
        .required("Name is required")
        .custom(function() {
          if (!app.$route.params.id) {
            if (!Validator.isEmpty(value)) {
              axios
                .get("/check-album", {
                  params: { album: app.data.name }
                })
                .then(res => {
                  if (res.data) {
                    app.exist = true;
                  } else {
                    app.exist = false;
                  }
                });
              return Promise.delay(1500).then(function() {
                if (app.exist) {
                  return "Name already exists";
                }
              });
            }
          }
        });
    },
    "data.sorting": function(value = null) {
      return Validator.value(value).required("Sorting is required");
    }
  }
};
</script>