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
                placeholder="Name"
              />
              <span class="help-block">{{ validation.firstError('data.title') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.slider'), 'has-success': data.slider }"
            >
              <label>Slider</label>
              <div class="row">
                <div class="col-2">
                  <img
                    class="img-responsive rounded-circle choose-file-size"
                    :src="data.slider?data.slider:$root.noimage"
                    alt="picture"
                  />
                </div>
                <div class="col-10">
                  <b-form-file
                    accept="image/*"
                    id="file-small"
                    size="sm"
                    class="file1"
                    v-on:change="onFileChange($event,'slider','file1')"
                    drop-placeholder="Drop file here"
                  ></b-form-file>
                </div>
              </div>
              <span class="help-block">{{ validation.firstError('data.slider') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-1"
              :class="{ 'has-error': validation.hasError('data.sorting'), 'has-success': data.sorting }"
            >
              <label>Sorting</label>
              <input
                type="number"
                v-model.number="data.sorting"
                name="sorting"
                class="form-control form-control-sm"
                placeholder="Sorting"
              />
              <span class="help-block">{{ validation.firstError('data.sorting') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.url'), 'has-success': data.url }"
            >
              <label>URL</label>
              <input
                type="text"
                v-model="data.url"
                name="url"
                class="form-control form-control-sm"
                placeholder="URL"
              />
              <span class="help-block">{{ validation.firstError('data.url') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div class="form-group col-2">
              <label>Status</label>
              <div class="row mt-2">
                <div class="col-6">
                  <input type="radio" name="status" v-model="data.status" :value="'a'" /> Active
                </div>
                <div class="col-6">
                  <input type="radio" name="status" v-model="data.status" :value="'d'" /> Deactive
                </div>
              </div>
            </div>
            <!------------ Single Input ------------>
            <div class="form-row col-12">
              <label class="col-12">Description</label>
              <div class="col-12">
                <editor :editorModel="'description'" />
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
const model = "slider";

export default {
  data() {
    return {
      model: model,
      image: {},
      data: { slider: "", status: "a" },
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
          if (this.image.slider) {
            formData.append("slider", this.image.slider);
          } else {
            formData.append("slider", "");
          }
          if (this.data.description) {
            formData.append("description", this.data.description);
          } else {
            formData.append("description", "");
          }
          if (this.data.id) {
            this.update(this.model, formData, this.data.id, "image");
          } else {
            this.store(this.model, formData);
          }
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
    "data.slider": function(value = null) {
      return Validator.value(value).required("Slider is required");
    },
    "data.sorting": function(value = null) {
      return Validator.value(value).required("Sorting is required");
    }
  }
};
</script>