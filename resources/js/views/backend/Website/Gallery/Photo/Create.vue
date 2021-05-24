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
              :class="{ 'has-error': validation.hasError('data.album_id'), 'has-success': data.album_id }"
            >
              <label>Select Album</label>
              <select v-model="data.album_id" name="album_id" class="form-control form-control-sm">
                <option value>--Select one--</option>
                <option
                  v-for="(value, index) in albums"
                  :key="index"
                  v-bind:value="value.id"
                >{{ value.name }}</option>
              </select>
              <span class="help-block">{{ validation.firstError('data.album_id') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-4"
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
              :class="{ 'has-error': validation.hasError('data.image'), 'has-success': data.image }"
            >
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
                    multiple
                    class="file1"
                    v-on:change="onFileChange($event,'image','file1')"
                    drop-placeholder="Drop file here"
                  ></b-form-file>
                </div>
              </div>
              <span class="help-block">{{ validation.firstError('data.image') }}</span>
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
const model = "photo";

export default {
  data() {
    return {
      model: model,
      data: { album_id: "", image: "" },
      image: {},
      albums: {},
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
          if (this.image.image) {
            formData.append("image", this.image.image);
          } else {
            formData.append("image", "");
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
    getAlbum() {
      axios.get("/get-album/Photos").then(res => (this.albums = res.data));
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
    this.getAlbum();
  },
  beforeCreate() {
    this.$root.spinner = true;
  },

  // ================== validation rule for form ==================
  validators: {
    "data.title": function(value = null) {
      return Validator.value(value).required("Title is required");
    },
    "data.image": function(value = null) {
      return Validator.value(value).required("Image is required");
    },
    "data.album_id": function(value = null) {
      return Validator.value(value).required("Album is required");
    },
    "data.sorting": function(value = null) {
      return Validator.value(value).required("Sorting is required");
    }
  }
};
</script>