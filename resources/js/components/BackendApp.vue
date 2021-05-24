<template>
  <div>
    <FlashMessage></FlashMessage>
    <keep-alive>
      <router-view></router-view>
    </keep-alive>
  </div>
</template>


<script>
export default {
  methods: {
    loginCheck() {
      axios
        .get("/login-check")
        .then(res => {
          if (res.status == 200) {
            Admin.login(res.data);
          } else {
            if (Admin.loggedIn()) {
              Admin.logout();
            }
          }
        })
        .catch(error => console.log(error));
    }
  },
  mounted() {
    this.loginCheck();
  }
};
</script>

<style>
._vue-flash-msg-body {
  width: 25% !important;
  z-index: 9999999;
}
._vue-flash-msg-body__content h3 {
  margin-top: 0.5rem;
  margin-bottom: 0.1rem;
  font-size: 1.1rem;
}
._vue-flash-msg-body ._vue-flash-msg-body__icon {
  background-color: #fff0 !important;
}
</style>