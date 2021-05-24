<template>
  <div class="wrapper">
    <div class="content-wrapper">
      <!--============ Main content ============-->
      <section class="content">
        <router-view></router-view>
        <div class="box box-success p-5" v-if="$root.spinner">
          <div
            class="row d-flex align-items-center justify-content-center"
            style="height: 350px"
          >
            <spinner />
          </div>
        </div>
      </section>
      <!--============ /Main content ============-->
    </div>

    <!--============ footer start ============-->
    <Footer />
    <!--============ footer end ============-->
  </div>
</template>

<script>
import Footer from "./../../components/backend/Footer";
export default {
  components: {
    Footer,
  },
  beforeCreate() {
    if (!Admin.id()) {
      Admin.logout();
    }
  },
  created() {
    $(document).ready(function () {
      $(".sidebar-menu").tree();
    });
  },
};
</script>
