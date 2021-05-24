<template>
  <ul class="treeview-menu">
    <li v-for="(child_menu,index) in all_children_menus" :key="index" class="treeview">
      <a href="javascript:void(0)" v-if="Object.keys(child_menu.all_children_menus).length > 0">
        <em v-if="child_menu.icon" v-html="child_menu.icon"></em>
        <i v-else class="fa fa-circle-o text-aqua"></i>
        <span>{{child_menu.name}}</span>
        <span
          class="pull-right-container"
          v-if="Object.keys(child_menu.all_children_menus).length > 0"
        >
          <i class="fa fa-angle-left pull-right"></i>
        </span>
      </a>
      <slot v-else>
        <router-link
          v-if="$root.checkPermission(child_menu.route_name)"
          :to="{name:child_menu.route_name, params: { slug:child_menu.params }}"
        >
          <em v-if="child_menu.icon" v-html="child_menu.icon"></em>
          <i v-else class="fa fa-circle-o text-aqua"></i>
          <span>{{child_menu.name}}</span>
          <span
            class="pull-right-container"
            v-if="Object.keys(child_menu.all_children_menus).length > 0"
          >
            <i class="fa fa-angle-left pull-right"></i>
          </span>
        </router-link>
      </slot>

      <!-- ===================Children Menu=================== -->
      <slot v-if="Object.keys(child_menu.all_children_menus).length > 0">
        <RecursiveMenu
          :key="index+'A'"
          :root_menu="child_menu.name"
          :all_children_menus="child_menu.all_children_menus"
        />
      </slot>
    </li>
  </ul>
</template>

<script>
import RecursiveMenu from "./RecursiveMenu";
export default {
  name: "RecursiveMenu",
  components: {
    RecursiveMenu
  },
  props: ["all_children_menus", "root_menu"]
};
</script>