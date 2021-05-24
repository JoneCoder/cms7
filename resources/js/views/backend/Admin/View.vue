<template>
  <section class="content" v-if="!$root.spinner">
    <div class="row">
      <div class="col-md-3">
        <!-- Profile Image -->
        <div class="box box-primary">
          <div class="box-body box-profile" v-if="data">
            <img
              class="profile-user-img img-responsive rounded-circle d-flex align-item-center"
              :src="data.profile?data.profile:$root.userimage"
              alt="User profile picture"
            />

            <h3 class="profile-username text-center">{{ data.name }}</h3>

            <p class="text-muted text-center">{{ data.rolename.name }}</p>
          </div>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->

        <!-- About Me Box -->
        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">Contact Information</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body" v-if="data">
            <strong>
              <i class="fa fa-envelope-o margin-r-5"></i>
            </strong>
            {{ data.email }}
            <hr />
            <strong>
              <i class="fa fa-phone margin-r-5"></i>
            </strong>
            {{ data.mobile }}
            <hr />
            <strong>
              <i class="fa fa-map margin-r-5"></i>
            </strong>
            {{ data.address }}
          </div>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->
      </div>
      <!-- /.col -->
      <div class="col-md-9">
        <div class="nav-tabs-custom">
          <div class="card-header tab-card-header">
            <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
              <li class="nav-item">
                <a
                  href="#settings"
                  @click="passwordOption(false)"
                  class="nav-link active text-black"
                  data-toggle="tab"
                >Settings</a>
              </li>
              <li class="nav-item">
                <a
                  href="#change-password"
                  @click="passwordOption(true)"
                  class="nav-link text-black"
                  data-toggle="tab"
                >Change Password</a>
              </li>
            </ul>
          </div>
          <div class="tab-content">
            <div class="active tab-pane" id="settings">
              <form
                v-on:submit.prevent="updateInformation"
                enctype="multipart/form-data"
                id="updateInfoForm"
                class="row border rounded border-default m-1 p-2"
              >
                <div
                  class="form-group mb-2 col-6"
                  :class="{ 'has-error': validation.hasError('data.name'), '': data.name }"
                >
                  <label class="control-label">Name</label>
                  <input
                    type="text"
                    name="name"
                    v-model="data.name"
                    class="form-control form-control-sm"
                    placeholder="Name"
                  />
                  <span class="help-block">{{ validation.firstError('data.name') }}</span>
                </div>
                <!------------ Single Input ------------>
                <div
                  class="form-group mb-2 col-6"
                  :class="{ 'has-error': validation.hasError('data.mobile'), '': data.mobile }"
                >
                  <label class="control-label">Mobile</label>
                  <input
                    type="text"
                    name="mobile"
                    v-model="data.mobile"
                    class="form-control form-control-sm"
                    placeholder="Mobile"
                  />
                  <span class="help-block">{{ validation.firstError('data.mobile') }}</span>
                </div>
                <!------------ Single Input ------------>
                <div class="form-group mb-2 col-6" :class="{'': data.profile }">
                  <label class="control-label">Profile</label>
                  <b-form-file
                    v-model="image.profile"
                    accept="image/*"
                    id="file-small"
                    size="sm"
                    class="file1"
                    v-on:change="onFileChange($event,'profile','file1')"
                    drop-placeholder="Drop file here"
                  ></b-form-file>
                </div>
                <!------------ Single Input ------------>
                <div class="form-group mb-2 col-6" :class="{'': data.address }">
                  <label class="control-label">Address</label>
                  <textarea
                    name="address"
                    v-model="data.address"
                    class="form-control form-control-sm"
                    placeholder="Address"
                  ></textarea>
                </div>
                <!------------ Single Input ------------>
                <div class="row col-12 justify-content-center p-3">
                  <button type="submit" class="btn btn-sm btn-success">Update Information</button>
                </div>
              </form>
            </div>
            <!-- /.tab-pane -->
            <div class="tab-pane" id="change-password">
              <form
                v-on:submit.prevent="changePassword"
                class="row border rounded border-default m-1 p-2"
              >
                <!------------ Single Input ------------>
                <div
                  class="form-group mb-2 col-6"
                  :class="{ 'has-error': validation.hasError('change_pass.old_password'), 'has-success': change_pass.old_password }"
                >
                  <label class="control-label">Old Password</label>
                  <input
                    v-model="change_pass.old_password"
                    type="password"
                    class="form-control form-control-sm"
                    placeholder="Old Password"
                  />
                  <span class="help-block">{{ validation.firstError('change_pass.old_password') }}</span>
                </div>
                <div class="col-6 pt-4">
                  <small class="text-danger">Please type your password slowly</small>
                </div>
                <div class="w-100"></div>
                <slot v-if="pass_verify">
                  <!------------ Single Input ------------>
                  <div
                    class="form-group mb-2 col-6"
                    :class="{ 'has-error': validation.hasError('change_pass.new_password'), 'has-success': change_pass.new_password }"
                    v-if="pass_verify"
                  >
                    <label class="control-label">New Password</label>
                    <input
                      v-model="change_pass.new_password"
                      type="password"
                      class="form-control form-control-sm"
                      placeholder="New Password"
                    />
                    <span class="help-block">{{ validation.firstError('change_pass.new_password') }}</span>
                  </div>
                  <!------------ Single Input ------------>
                  <div
                    class="form-group mb-2 col-6"
                    :class="{ 'has-error': validation.hasError('change_pass.confirm_password'), 'has-success': change_pass.confirm_password }"
                    v-if="pass_verify"
                  >
                    <label class="control-label">Confirm Password</label>
                    <input
                      v-model="change_pass.confirm_password"
                      type="password"
                      class="form-control form-control-sm"
                      placeholder="Confirm Password"
                    />
                    <span
                      class="help-block"
                    >{{ validation.firstError('change_pass.confirm_password') }}</span>
                  </div>
                </slot>
                <!------------ Single Input ------------>
                <div class="row col-12 justify-content-center p-3">
                  <button type="submit" class="btn btn-sm btn-success">Change Password</button>
                </div>
              </form>
            </div>
            <!-- /.tab-pane -->
          </div>
          <!-- /.tab-content -->
        </div>
        <!-- /.nav-tabs-custom -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>
</template>

<script>
// ===============Promise===============
import Promise from "bluebird";
// define model name
const model = "admin";

export default {
  data() {
    return {
      model: model,
      role_name: "",
      image: {},
      data: [],
      password_option: false,
      pass_verify: false,
      change_pass: {}
    };
  },
  methods: {
    updateInformation() {
      const error = this.validation.countErrors();
      this.$validate().then(res => {
        if (res) {
          this.$root.spinner = true;
          var form = document.getElementById("updateInfoForm");
          var formData = new FormData(form);
          formData.append("_method", "put");
          if (this.image.profile) {
            formData.append("profile", this.image.profile);
          } else {
            formData.append("profile", "");
          }
          axios
            .post("/admin/" + this.$route.params.id, formData)
            .then(res => {
              this.notification(res.data.message, "success");
              this.get_data(this.model, this.$route.params.id, "data");

              setTimeout(() => {
                profile.dispatch("setProfile", this.data.profile);
              }, 400);
            })
            .catch(error => console.log(error))
            .then(alw => setTimeout(() => (this.$root.spinner = false), 200));
        }
      });
    },
    onFileChange(e, model, fileClass, pdf = null) {
      this.showImage(e, model, model, fileClass, pdf); // 1st profile image, second show image
    },
    passwordOption(type) {
      this.password_option = type;
    },
    changePassword() {
      const error = this.validation.countErrors();
      this.$validate().then(res => {
        if (res) {
          this.$root.spinner = true;
          axios
            .post("/change-password", this.change_pass)
            .then(res => {
              this.password_option = false;
              this.pass_verify = false;
              this.change_pass = {};
              this.notification(res.data.message, "success");
            })
            .catch(error => console.log(error))
            .then(alw => setTimeout(() => (this.$root.spinner = false), 200));
        }
      });
    }
  },
  created() {
    this.role_name = Admin.role();
    this.change_pass.id = this.$route.params.id;
    this.get_data(this.model, this.$route.params.id, "data"); // get data
    this.setBreadcrumbs(this.model, "view"); // Set Breadcrumbs
  },

  // ================== validation rule for form ==================
  validators: {
    "data.name": function(value = null) {
      if (!this.password_option) {
        return Validator.value(value).required("Name is required");
      }
    },
    "data.mobile": function(value = null) {
      if (!this.password_option) {
        return Validator.value(value)
          .digit()
          .regex("01+[0-9+-]*$", "Must start with 01.")
          .minLength(11)
          .maxLength(15);
      }
    },
    "change_pass.old_password": function(value = null) {
      var app = this;
      if (this.password_option) {
        return Validator.value(value)
          .required("Old password is required")
          .minLength(6)
          .custom(function() {
            if (!Validator.isEmpty(value)) {
              axios.post("/check-old-password", app.change_pass).then(res => {
                if (res.data) {
                  app.pass_verify = true;
                } else {
                  app.pass_verify = false;
                  return "Old password do not match our records!!";
                }
              });
              return Promise.delay(2000).then(function() {
                if (!app.pass_verify) {
                  return "Old password do not match our records!!";
                }
              });
            }
          });
      }
    },
    "change_pass.new_password": function(value = null) {
      if (this.password_option && this.pass_verify) {
        return Validator.value(value)
          .required("New password is required")
          .minLength(6);
      }
    },
    "change_pass.confirm_password, change_pass.new_password": function(
      confirm_password = null,
      new_password = null
    ) {
      if (this.password_option && this.pass_verify) {
        return Validator.value(confirm_password)
          .required("Password confirmation is required")
          .match(new_password);
      }
    }
  }
};
</script>