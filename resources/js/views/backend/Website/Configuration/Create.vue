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
            id="form"
            enctype="multipart/form-data"
            class="form-row col-12"
          >
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.title'), 'has-success': data.title }"
            >
              <label>Title</label>
              <input
                type="text"
                v-model="data.title"
                name="title"
                class="form-control form-control-sm"
                placeholder="Title"
              />
              <span class="help-block">{{ validation.firstError('data.title') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.short_title'), 'has-success': data.short_title }"
            >
              <label>Short Title</label>
              <input
                type="text"
                v-model="data.short_title"
                name="short_title"
                class="form-control form-control-sm"
                placeholder="Short title"
              />
              <span class="help-block">{{ validation.firstError('data.short_title') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.logo'), 'has-success': data.profile }"
            >
              <label>Logo</label>
              <div class="row">
                <div class="col-2">
                  <img
                    class="img-responsive rounded-circle choose-file-size"
                    :src="data.logo?data.logo:$root.noimage"
                    alt="picture"
                  />
                </div>
                <div class="col-10">
                  <b-form-file
                    accept="image/*"
                    id="file-small"
                    size="sm"
                    class="file1"
                    v-on:change="onFileChange($event,'logo','file1')"
                    drop-placeholder="Drop file here"
                  ></b-form-file>
                </div>
              </div>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.email'), 'has-success': data.email }"
            >
              <label>Email</label>
              <input
                type="email"
                v-model="data.email"
                name="email"
                class="form-control form-control-sm"
                placeholder="Email"
              />
              <span class="help-block">{{ validation.firstError('data.email') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.mobile'), 'has-success': data.mobile }"
            >
              <label>Mobile</label>
              <input
                type="number"
                v-model="data.mobile"
                name="mobile"
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
                v-model="data.address"
                name="address"
                class="form-control form-control-sm"
                placeholder="Address"
              ></textarea>
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
const model = "configuration";

export default {
  data() {
    return {
      model: model,
      data: { logo: "" },
      image: {},
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
          var form = document.getElementById("form");
          var formData = new FormData(form);
          if (this.image.logo) {
            formData.append("logo", this.image.logo);
          } else {
            formData.append("logo", "");
          }
          this.store(this.model, formData);
        }
      });
    },
    onFileChange(e, model, fileClass, pdf = null) {
      this.showImage(e, model, model, fileClass, pdf); // 1st data image, second show image
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
    "data.title": function(value = null) {
      return Validator.value(value).required("Title is required");
    },
    "data.short_title": function(value = null) {
      return Validator.value(value).required("Short Title is required");
    },
    "data.mobile": function(value = null) {
      return Validator.value(value).required("Mobile is required");
    },
    "data.email": function(value = null) {
      return Validator.value(value).required("Email is required");
    },
    "data.address": function(value = null) {
      return Validator.value(value).required("Address is required");
    },
    "data.logo": function(value = null) {
      return Validator.value(value).required("Logo is required");
    }
  }
};
</script>