<template>
  <div
    class="pt-3 pb-3 page-banner"
    v-if="Object.keys(breadcrumbLevels).length>0 && $route.name != 'home.page' && $route.name != 'dashboard'"
  >
    <span class="shape"></span>
    <span class="shape2"></span>
    <span class="shape3"></span>
    <section class="content-header container-wrapper" v-if="Object.keys(breadcrumbLevels).length>0">
      <div class="clearfix justify-content-center text-white">
        <span class="float-left">
          <ol class="breadcrumb pl-0">
            <li class="breadcrumb-item">
              <h5
                class="text-uppercase"
              >{{ breadcrumbLevels[0]? breadcrumbLevels[0][Object.keys(breadcrumbLevels[0]).length-1]['title']:'' }}</h5>
            </li>
          </ol>
        </span>
        <span class="float-right">
          <ol class="breadcrumb pr-0">
            <li class="breadcrumb-item">
              <router-link class="text-white" :to="{name:'home.page'}">Home</router-link>
            </li>
            <li class="breadcrumb-item" v-for="(menu, index1) in breadcrumbLevels[0]" :key="index1">
              <router-link
                class="text-white"
                :to="{name:menu.route, params:{slug: menu.slug?menu.slug:''}}"
              >{{ menu.title }}</router-link>
            </li>
          </ol>
        </span>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  methods: {},
  computed: {
    breadcrumbLevels() {
      return frontBreadcrumbs.state.breadcrumbLevels;
    },
  },
};
</script>
<style>
.breadcrumb {
  background: transparent;
  margin-bottom: 0;
}
</style>
