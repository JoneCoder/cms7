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
              :class="{ 'has-error': validation.hasError('data.parent_id'), 'has-success': data.parent_id }"
            >
              <label>Parent menu</label>
              <select v-model="data.parent_id" class="form-control form-control-sm">
                <option value>Select parent menu</option>
                <option
                  v-for="(value, name, index) in parentMenu"
                  :key="index"
                  v-bind:value="name"
                >{{ value }}</option>
              </select>
              <span class="help-block">{{ validation.firstError('data.parent_id') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.title'), 'has-success': data.title }"
            >
              <label>Title</label>
              <input
                type="text"
                v-model="data.title"
                class="form-control form-control-sm"
                placeholder="Title"
              />
              <span class="help-block">{{ validation.firstError('data.title') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.type'), 'has-success': data.type }"
            >
              <label>Menu Type</label>
              <select v-model="data.type" class="form-control form-control-sm">
                <option value>Select menu type</option>
                <option value="content">Content</option>
                <option value="external_link">External Link</option>
                <option value="outside_website">Outside Website</option>
              </select>
              <span class="help-block">{{ validation.firstError('data.type') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.menu_look_type'), 'has-success': data.menu_look_type }"
            >
              <label>Menu look type</label>
              <select v-model="data.menu_look_type" class="form-control form-control-sm">
                <option value="normal">Normal</option>
                <option value="mega">Mega</option>
              </select>
              <span class="help-block">{{ validation.firstError('data.menu_look_type') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              v-if="data.type == 'content'"
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.content_id'), 'has-success': data.content_id }"
            >
              <label>Content</label>
              <select v-model="data.content_id" class="form-control form-control-sm">
                <option value>Select content</option>
                <option
                  v-for="(value, index) in extraData.contents"
                  :key="index"
                  v-bind:value="value.id"
                >{{ value.title }}</option>
              </select>
              <span class="help-block">{{ validation.firstError('data.content_id') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              v-if="data.type == 'outside_website' || data.type == 'external_link'"
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.url'), 'has-success': data.url }"
            >
              <label v-if="data.type == 'outside_website'">URL</label>
              <label v-if="data.type == 'external_link'">Route Name</label>
              <input
                type="text"
                v-model="data.url"
                class="form-control form-control-sm"
                placeholder="URL / Route Name"
              />
              <span class="help-block">{{ validation.firstError('data.url') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.params'), 'has-success': data.params }"
            >
              <label>Params</label>
              <input
                type="text"
                v-model="data.params"
                class="form-control form-control-sm"
                placeholder="Params"
              />
              <span class="help-block">{{ validation.firstError('data.params') }}</span>
            </div>

            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.position'), 'has-success': data.position }"
            >
              <label>Menu position</label>
              <select v-model="data.position" class="form-control form-control-sm">
                <option value>Select menu position</option>
                <option value="header">Header</option>
                <option value="top_bar">Top Bar</option>
                <option value="footer_bottom">Footer Bottom</option>
              </select>
              <span class="help-block">{{ validation.firstError('data.position') }}</span>
            </div>
            <!------------ Single Input ------------>
            <div
              class="form-group col-3"
              :class="{ 'has-error': validation.hasError('data.sorting'), 'has-success': data.sorting }"
            >
              <label>sorting</label>
              <input
                type="text"
                v-model.number="data.sorting"
                class="form-control form-control-sm"
                placeholder="sorting"
              />
              <span class="help-block">{{ validation.firstError('data.sorting') }}</span>
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
const model = "menu";

export default {
  data() {
    return {
      model: model,
      extraData: {
        contents: []
      },
      parentMenu: {},
      data: {
        parent_id: "",
        content_id: "",
        type: "",
        position: "",
        content: "",
        menu_look_type: "normal",
        status: "a",
        sorting: 0
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
          if (this.data.slug) {
            this.update(this.model, this.data, this.data.slug);
          } else {
            this.store(this.model, this.data);
          }
        }
      });
    },
    get_parent: function() {
      axios
        .get("/parent-menus")
        .then(res => (this.parentMenu = res.data))
        .catch(error => console.log(error));
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

    this.get_parent();
    this.get_paginate_data("get-content", { allData: true }, "contents"); // get contents
  },
  beforeCreate() {
    this.$root.spinner = true;
  },

  // ================== validation rule for form ==================
  validators: {
    "data.title": function(value = null) {
      return Validator.value(value).required("Title is required");
    },
    "data.type": function(value = null) {
      return Validator.value(value).required("Menu Type is required");
    },
    "data.position": function(value = null) {
      return Validator.value(value).required("Menu Position is required");
    },
    "data.sorting": function(value = null) {
      return Validator.value(value).required("Sorting is required");
    }
  }
};
</script>