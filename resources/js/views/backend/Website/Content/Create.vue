<template>
  <div>
    <div class="box box-success" v-if="!$root.spinner">
      <div class="box-header with-border">
        <h3 class="box-title">{{ model + " Create" }}</h3>

        <!--============ Add or Back Button Start ============-->
        <div class="box-tools pull-right">
          <router-link
            :to="{ name: model+'.show', params:{slug:$route.params.slug} }"
            class="btn btn-xs btn-success pull-left text-white mr-2"
            title="View File"
          >
            <i class="fa fa-eye"></i>
            <span class="text-capitalize">View {{ model }}</span>
          </router-link>
          <router-link
            :to="{ name: model+'.file' }"
            class="btn btn-xs btn-success pull-left text-white"
            title="Add File"
          >
            <i class="fa fa-plus"></i>
            <span class="text-capitalize">Add {{ model }} File</span>
          </router-link>
        </div>
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
              class="form-group col-6"
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
              <input type="hidden" v-model="data.slug" name="slug" />
              <span class="help-block">{{ validation.firstError('data.title') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div class="form-group col-3">
              <label>Image</label>
              <div class="row">
                <div class="col-2">
                  <img
                    class="img-responsive rounded-circle choose-file-size"
                    :src="data.image?data.image:$root.noimage"
                    alt="picture"
                  />
                </div>
                <div class="col-10">
                  <b-form-file
                    accept="image/*"
                    id="file-small"
                    size="sm"
                    class="file1"
                    v-on:change="onFileChange($event,'image','file1')"
                    drop-placeholder="Drop file here"
                  ></b-form-file>
                </div>
              </div>
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
const model = "content";

export default {
  data() {
    return {
      model: model,
      data: { status: 1, image: "" },
      image: {},
      errors: {}
    };
  },
  methods: {
    asyncData() {
      this.get_data(this.model, this.$route.params.slug, "data");
    },
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
          this.$root.spinner = true;
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
          axios
            .post("/content", formData)
            .then(res => {
              this.notification(res.data.message, "success");
              this.$router.push({
                name: "content.show",
                params: { slug: this.$route.params.slug }
              });
            })
            .catch(error => console.log(error))
            .then(alw => setTimeout(() => (this.$root.spinner = false), 200));
        }
      });
    },
    onFileChange(e, model, fileClass, pdf = null) {
      this.showImage(e, model, model, fileClass, pdf); // 1st data image, second show image
    }
  },
  created() {
    this.data.slug = this.$route.params.slug;
    // set breadcrumb
    var breadcrumb = [
      {
        route: model + ".create",
        title: model + " Create",
        slug: this.$route.params.slug
      }
    ];
    breadcrumbs.dispatch("setBreadcrumbs", breadcrumb); // Set Breadcrumbs
    this.get_data(this.model, this.$route.params.slug, "data"); // get data for edit
  },
  watch: {
    $route: {
      handler: "asyncData",
      immediate: true
    }
  },

  // ================== validation rule for form ==================
  validators: {
    "data.title": function(value = null) {
      return Validator.value(value).required("Title is required");
    }
  }
};
</script>