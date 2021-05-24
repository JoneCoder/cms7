<template>
  <div>
    <Header />
    <Breadcrumbs/>
    <router-view></router-view>
    <div class="box box-success p-5" v-if="$root.spinner">
      <div class="row d-flex align-items-center justify-content-center" style="height:350px;">
        <spinner />
      </div>
    </div>
    <Footer />
  </div>
</template>

<script>
import Header from "./../../components/frontend/Header";
import Footer from "./../../components/frontend/Footer";
import Breadcrumbs from "./../../components/frontend/Breadcrumbs";
export default {
  components: {
    Header,
    Footer,
    Breadcrumbs
  }
};
</script>
