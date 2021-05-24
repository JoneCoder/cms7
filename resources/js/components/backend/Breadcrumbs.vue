<template>
  <div>
    <section class="content-header" v-if="Object.keys(breadcrumbLevels).length>0">
      <h1>{{ breadcrumbLevels[0]? breadcrumbLevels[0][Object.keys(breadcrumbLevels[0]).length-1]['title']:'' }}</h1>
      <ol class="breadcrumb">
        <li>
          <router-link :to="{name:'admin.dashboard'}">Dashboard</router-link>
        </li>
        <li v-for="(menu, index1) in breadcrumbLevels[0]" :key="index1">
          <router-link
            :to="{name:menu.route, params:{slug: menu.slug?menu.slug:''}}"
          >{{ menu.title }}</router-link>
        </li>
      </ol>
    </section>

    <!-- ==========Menu tags============= -->
    <section class="menu-tags" v-if="Object.keys(menuTags).length>0">
      <ul class="tags">
        <slot v-for="(menuName, index) in menuTags">
          <li :key="index" :class="(menuName.route==$route.name)?'active':''">
            <router-link
              v-if="$root.checkPermission(menuName.route)"
              :to="{name:menuName.route, params:{slug: menuName.slug?menuName.slug:''}}"
            >
              {{ menuName.title }}
              <i
                v-if="index !=0 "
                @click="removeMenu(index)"
                class="fa fa-times"
              ></i>
            </router-link>
          </li>
        </slot>
        <!-- <li class="router-link-active">
          <a href="#">Dashboard</a>
        </li>-->
      </ul>
    </section>
  </div>
</template>

<script>
export default {
  methods: {
    removeMenu(index) {
      breadcrumbs.dispatch("removeMenu", index);
    }
  },
  computed: {
    breadcrumbLevels() {
      return breadcrumbs.state.breadcrumbLevels;
    },
    menuTags() {
      return breadcrumbs.state.menuTags;
    }
  }
};
</script>