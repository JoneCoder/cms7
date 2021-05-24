<template>
  <div class="box box-success" v-if="!$root.spinner">
    <div class="box-header with-border">
      <h3 class="box-title">{{ model + " View" }}</h3>

      <!--============ Add or Back Button Start ============-->
      <AddOrBackButton :route="model+'.index'" :portion="model" :icon="'arrow-left'" />
      <!--============ Add or Back Button End ============-->
    </div>

    <div class="box-body box-min-height">
      <!--============ View Base Table Start ============-->
      <ViewBaseTable :data="data" />
      <!--============ View Base Table End ============-->
    </div>
  </div>
</template>

<script>
// define model name
const model = "process";

export default {
  data() {
    return {
      model: model,
      data: [],
    };
  },
  async created() {
    await this.get_data(this.model, this.$route.params.id, "data"); // get data
    this.setBreadcrumbs(this.model, "view"); // Set Breadcrumbs
  },
};
</script>