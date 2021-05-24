<template>
  <div v-if="!$root.spinner">
    <div class="row">
      <div v-for="(menu, index) in menus" :key="index" class="col-md-3 col-sm-6 col-xs-12">
        <router-link :to="{name:menu.route_name, params:{slug:menu.params}}">
          <div class="info-box d-flex align-items-center">
            <span class="info-box-icon" :class="'bg-color-'+(index+1)">
              <em v-if="menu.icon" v-html="menu.icon" class="fa-icon"></em>
            </span>

            <div class="info-box-content row ml-1">
              <span class="info-box-text">{{ menu.name }}</span>
            </div>
            <!-- /.info-box-content -->
          </div>
        </router-link>
        <!-- /.info-box -->
      </div>
    </div>
    <div class="row">
      <div class="col-md-8">
        <div class="box box-info">
          <div class="box-header with-border">
            <h3 class="box-title">Latest Progress</h3>

            <div class="box-tools pull-right">
              <a href="javascript:void(0)" class="btn btn-xs btn-success pull-left text-white">
                <i class="fa fa-plus"></i> Add New
              </a>
              <a href="javascript:void(0)" class="btn btn-xs pull-left" data-widget="collapse">
                <i class="fa fa-minus"></i>
              </a>
              <a href="javascript:void(0)" class="btn btn-xs pull-left" data-widget="remove">
                <i class="fa fa-times"></i>
              </a>
            </div>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <table class="table table-bordered">
              <tbody>
                <tr>
                  <th style="width: 10px">#</th>
                  <th>Task</th>
                  <th>Progress</th>
                  <th style="width: 40px">Label</th>
                </tr>
                <tr>
                  <td>1.</td>
                  <td>Update software</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                    </div>
                  </td>
                  <td>
                    <span class="badge bg-red">55%</span>
                  </td>
                </tr>
                <tr>
                  <td>2.</td>
                  <td>Clean database</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
                    </div>
                  </td>
                  <td>
                    <span class="badge bg-yellow">70%</span>
                  </td>
                </tr>
                <tr>
                  <td>3.</td>
                  <td>Cron job running</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-primary" style="width: 30%"></div>
                    </div>
                  </td>
                  <td>
                    <span class="badge bg-light-blue">30%</span>
                  </td>
                </tr>
              </tbody>
            </table>
            <!-- /.table-responsive -->
          </div>
          <!-- /.box-body -->
          <div class="box-footer clearfix">
            <a
              href="javascript:void(0)"
              class="btn btn-sm btn-success pull-left text-white"
            >Place New Order</a>
            <a href="javascript:void(0)" class="btn btn-sm btn-default pull-right">View All Orders</a>
          </div>
          <!-- /.box-footer -->
        </div>
      </div>

      <div class="col-md-4">
        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">Recently Added Products</h3>

            <div class="box-tools pull-right">
              <a href="javascript:void(0)" class="btn btn-xs pull-left" data-widget="collapse">
                <i class="fa fa-minus"></i>
              </a>
              <a href="javascript:void(0)" class="btn btn-xs pull-left" data-widget="remove">
                <i class="fa fa-times"></i>
              </a>
            </div>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <ul class="products-list product-list-in-box">
              <li class="item">
                <div class="product-img">
                  <img :src="$root.baseurl+'/public/images/default-50x50.gif'" alt="Product Image" />
                </div>
                <div class="product-info">
                  <a href="javascript:void(0)" class="product-title">
                    Samsung TV
                    <span class="badge bg-warning pull-right text-white">$1800</span>
                  </a>
                  <span class="product-description">Samsung 32" 1080p 60Hz LED Smart HDTV.</span>
                </div>
              </li>
              <!-- /.item -->
              <li class="item">
                <div class="product-img">
                  <img :src="$root.baseurl+'/public/images/default-50x50.gif'" alt="Product Image" />
                </div>
                <div class="product-info">
                  <a href="javascript:void(0)" class="product-title">
                    Bicycle
                    <span class="badge bg-info pull-right text-white">$700</span>
                  </a>
                  <span class="product-description">26" Mongoose Dolomite Men's 7-speed, Navy Blue.</span>
                </div>
              </li>
            </ul>
          </div>
          <!-- /.box-body -->
          <div class="box-footer text-center">
            <a href="javascript:void(0)" class="uppercase">View All Products</a>
          </div>
          <!-- /.box-footer -->
        </div>
      </div>
    </div>
  </div>
</template>

<script>
const breadcrumb = [{ route: "admin.dashboard", title: "Dashboard" }];
export default {
  data() {
    return {
      menus: []
    };
  },
  methods: {
    getMenus() {
      this.$root.spinner = true;
      axios
        .get("/get-dashboard-menus")
        .then(res => (this.menus = res.data))
        .catch(error => console.log())
        .then(alw => setTimeout(() => (this.$root.spinner = false), 200));
    }
  },
  created() {
    this.getMenus();
    breadcrumbs.dispatch("setBreadcrumbs", breadcrumb);
  }
};
</script>