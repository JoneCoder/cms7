<template>
  <div class="login-box">
    <div class="login-logo">
      <a href="javascript:void(0)">
        <b>Admin</b>Panel
      </a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
      <p class="login-box-msg">Sign in to admin panel</p>

      <slot v-if="!$root.spinner">
        <form v-on:submit.prevent="submit" method="post">
          <div
            class="form-group has-feedback"
            :class="{ 'has-error': validation.hasError('data.email'), 'has-success': data.email }"
          >
            <input type="email" v-model="data.email" class="form-control" placeholder="Email" />
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            <span class="help-block">{{ validation.firstError('data.email') }}</span>
          </div>
          <div
            class="form-group has-feedback"
            :class="{ 'has-error': validation.hasError('data.password'), 'has-success': data.password }"
          >
            <input
              type="password"
              v-model="data.password"
              class="form-control"
              placeholder="Password"
            />
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            <span class="help-block">{{ validation.firstError('data.password') }}</span>
          </div>
          <div class="row flex justify-content-center">
            <!-- /.col -->
            <div class="col-xs-4 flex justify-content-center">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
            </div>
            <!-- /.col -->
          </div>
        </form>
      </slot>
      <spinner v-if="$root.spinner" />
    </div>
    <!-- /.login-box-body -->
  </div>
</template>

<script>
export default {
  data() {
    return {
      data: {
        email: "jonecoder@gmail.com",
        password: "12345678",
      },
    };
  },
  methods: {
    submit() {
      const error = this.validation.countErrors();
      this.$validate().then((res) => {
        if (res) {
          this.$root.spinner = true;
          axios
            .post("/loginme", this.data)
            .then((res) => {
              if (res.status == 200 && res.data.id) {
                Admin.login(res.data);
                this.notification(res.data.message, "success");
                window.location = this.$root.baseurl + "/admin/dashboard";
              } else {
                this.$root.spinner = false;
                this.notification(res.data.message, "error");
              }
            })
            .catch((error) => console.log(error));
        }
      });
    },
  },
  created() {
    $(".body").removeClass("hold-transition skin-blue sidebar-mini");
    $(".body").addClass("hold-transition login-page");
  },

  // ================== validation rule for form ==================
  validators: {
    "data.email": function (value = null) {
      return Validator.value(value).required("Email is required");
    },
    "data.password": function (value = null) {
      return Validator.value(value)
        .required("Password is required")
        .minLength(6);
    },
  },
};
</script>
