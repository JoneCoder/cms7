<template>
  <div class="box-tools pull-right">
    <router-link
      v-if="$root.checkPermission(route)"
      :to="{ name: route }"
      class="btn btn-xs btn-success pull-left text-white"
      title="Add New"
    >
      <i :class="'fa fa-'+icon"></i>
      <span v-if="icon == 'plus'" class="text-capitalize">Add {{ portion }}</span>
      <span v-else>Back</span>
    </router-link>

    <!-- custom route -->
    <slot v-if="extraButtons">
      <slot v-for="(rt, index) in extraButtons">
        <router-link
          :key="index"
          v-if="$root.checkPermission(rt.route)"
          :to="{ name:rt.route, params: { id: rt.slug?rt.slug:'' }}"
          :class="'btn btn-xs btn-'+rt.btnColor"
          class="pull-left text-white top-button"
        >
          <i :class="'fa fa-'+rt.icon"></i>
          <span class="text-capitalize">{{ rt.name }}</span>
        </router-link>
      </slot>
    </slot>
  </div>
</template>

<script>
export default {
  props: ["route", "icon", "portion", "extraButtons"]
};
</script>
