<template>
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img :src="profileImage?profileImage:$root.userimage" class="img-circle" alt="User Image" />
        </div>
        <div class="pull-left info">
          <p>{{ logged_name }}</p>
          <a href="javascript:void(0)">
            <i class="fa fa-circle text-success"></i> Online
          </a>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>

        <!-- =================Dynamic Menu Start============= -->
        <slot v-for="(root_menu,index) in  $root.menu_datas">
          <li v-if="root_menu.route_name" class="treeview" :key="index">
            <router-link
              v-if="$root.checkPermission(root_menu.route_name)"
              :to="{name:root_menu.route_name}"
            >
              <em v-if="root_menu.icon" v-html="root_menu.icon"></em>
              <i v-else class="fa fa-circle-o text-aqua"></i>
              <span>{{root_menu.name}}</span>
            </router-link>
          </li>

          <!-- ===================Children Menu=================== -->
          <slot v-else-if="Object.keys(root_menu.all_children_menus).length > 0">
            <li :key="index" class="treeview">
              <a href="javascript:void(0)">
                <em v-if="root_menu.icon" v-html="root_menu.icon"></em>
                <i v-else class="fa fa-circle-o text-aqua"></i>
                <span>{{root_menu.name}}</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>

              <!-- ----------Children Menu---------- -->
              <RecursiveMenu
                :root_menu="root_menu.name"
                :all_children_menus="root_menu.all_children_menus"
              />
              <!-- ----------Children Menu---------- -->
            </li>
          </slot>
        </slot>
        <!-- =================Dynamic Menu End============= -->

        <!-- <li class="treeview">
          <router-link :to="{name:'document.index'}">
            <i class="fa fa-list"></i>
            <span>Documents</span>
          </router-link>
        </li>-->

        <!-- <li class="treeview">
          <router-link :to="{name:'user.index'}">
            <i class="fa fa-users"></i>
            <span>User</span>
          </router-link>
        </li>-->
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
</template>

<script>
import RecursiveMenu from "./RecursiveMenu";
export default {
  components: {
    RecursiveMenu
  },
  data() {
    return {
      logged_name: ""
    };
  },
  computed: {
    profileImage() {
      return profile.state.image;
    }
  },
  created() {
    this.logged_name = Admin.name();
  }
};
</script>

<style>
</style>