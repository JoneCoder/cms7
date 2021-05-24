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
          <form v-on:submit.prevent="submit" id="form" class="form-row col-12">
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.name'), 'has-success': data.name }"
            >
              <label>Name</label>
              <input
                type="text"
                v-model="data.name"
                name="name"
                class="form-control form-control-sm"
                placeholder="Name"
              />
              <span class="help-block">{{ validation.firstError('data.name') }}</span>
            </div>

            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.name'), 'has-success': data.name }"
            >
              <label>Select Menu</label>
              <select v-model="data.select" class="form-control form-control-sm">
                <option value>--Select one--</option>
                <option
                  v-for="(value, index) in selectMenu"
                  :key="index"
                  v-bind:value="value"
                >{{ value }}</option>
              </select>
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
                name="sorting"
                class="form-control form-control-sm"
                placeholder="Sorting"
              />
              <span class="help-block">{{ validation.firstError('data.sorting') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-2"
              :class="{ 'has-error': validation.hasError('data.date'), 'has-success': data.date }"
            >
              <label>Datepicker</label>
              <b-form-datepicker
                id="datepicker-sm"
                size="sm"
                v-model="data.date"
                :date-format-options="{ year: 'numeric', month: 'short', day: '2-digit', weekday: 'short' }"
                class="col-12 no-padding"
              ></b-form-datepicker>
              <span class="help-block">{{ validation.firstError('data.date') }}</span>
            </div>

            <!------------ Single Input ------------>
            <div class="form-group col-2">
              <label>Status</label>
              <div class="row mt-2">
                <div class="col-6">
                  <input type="radio" name="status" v-model="data.status" :value="1" /> Active
                </div>
                <div class="col-6">
                  <input type="radio" name="status" v-model="data.status" :value="0" /> Deactive
                </div>
              </div>
            </div>

            <!------------ Single Input ------------>
            <div class="form-group col-2">
              <label>Active / Deactive</label>
              <div class="row col-12 mt-2">
                <b-form-checkbox
                  class="col-form-label-sm col-6"
                  v-model="data.status2"
                  name="status2"
                  :value="1"
                  :unchecked-value="null"
                >Active</b-form-checkbox>
                <b-form-checkbox
                  class="col-form-label-sm col-6"
                  v-model="data.status2"
                  name="status2"
                  :value="1"
                  :unchecked-value="null"
                >Deactive</b-form-checkbox>
              </div>
            </div>

            <!------------ Single Input ------------>
            <div class="form-row col-12">
              <label class="col-12">Description</label>
              <div class="col-12">
                <editor :editorModel="'description'" />
              </div>
            </div>

            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.profile'), 'has-success': data.profile }"
            >
              <label>Image</label>
              <div class="row">
                <div class="col-2">
                  <img
                    class="img-responsive rounded-circle choose-file-size"
                    :src="data.profile?data.profile:$root.noimage"
                    alt="picture"
                  />
                </div>
                <div class="col-10">
                  <b-form-file
                    accept="image/*"
                    id="file-small"
                    size="sm"
                    class="file1"
                    v-on:change="onFileChange($event,'profile','file1')"
                    drop-placeholder="Drop file here"
                  ></b-form-file>
                </div>
              </div>
              <span class="help-block">{{ validation.firstError('data.profile') }}</span>
            </div>

            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.pdf_file'), 'has-success': data.pdf_file }"
            >
              <label>File</label>
              <div class="row">
                <div class="col-2">
                  <img
                    class="img-responsive rounded-circle choose-file-size"
                    :src="data.pdf_file?data.pdf_file:$root.noimage"
                    alt="picture"
                  />
                </div>
                <div class="col-10">
                  <b-form-file
                    accept=".pdf"
                    id="file-small"
                    size="sm"
                    class="file2"
                    v-on:change="onFileChange($event,'pdf_file','file2','pdf')"
                    drop-placeholder="Drop file here"
                  ></b-form-file>
                </div>
              </div>
              <span class="help-block">{{ validation.firstError('data.pdf_file') }}</span>
            </div>

            <!-------------- button -------------->
            <div class="col-12 mb-3 mt-5">
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
import Promise from "bluebird"; //when use validation custom
// define model name
const model = "doc";

// set breadcrumb
//const breadcrumb = [{ route: "module.create", title: "Module Create" }];

export default {
  data() {
    return {
      model: model,
      selectMenu: {
        1: "Nothing",
        2: "Something"
      },
      data: {
        select: "",
        profile: "",
        pdf_file: ""
      },
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
    submitWithImage: function() {
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
          var form = document.getElementById("form");
          var formData = new FormData(form);
          if (this.image.image) {
            formData.append("image", this.image.image);
          } else {
            formData.append("image", "");
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
    },
    axiosReq() {
      const error = this.validation.countErrors();
      this.$validate().then(res => {
        if (res) {
          this.$root.spinner = true;
          axios
            .post("/module/create", this.data)
            .then(res => {
              this.notification("Module Create Successfully", "success");
              this.$router.push({
                name: this.model + ".index",
                params: { model: this.data.model_name }
              });
            })
            .catch(error =>
              this.notification(
                "Something went wrong, but Some file are crated, please check",
                "error"
              )
            )
            .then(alw => setTimeout(() => (this.$root.spinner = false), 200));
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
      //breadcrumbs.dispatch("setBreadcrumbs", breadcrumb); // Set Breadcrumbs
      setTimeout(() => (this.$root.spinner = false), 200);
    }
  },
  beforeCreate() {
    this.$root.spinner = true;
  },

  // ================== validation rule for form ==================
  validators: {
    "data.name": function(value = null) {
      //return Validator.value(value).required("Name is required");
    }
  }
};
</script>