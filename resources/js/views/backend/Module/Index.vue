<template>
  <div>
    <div class="row justify-content-center">
      <div class="col-md-7">
        <div class="box box-success">
          <p class="text-center p-2">
            A description of all the files in the
            <span class="text-red font-weight-bold">module</span> is given below
            <span class="text-maroon font-weight-bold">(Please Read and Do)</span>
          </p>
        </div>
        <!-- /.box -->
      </div>
    </div>

    <!-- ==================== File Create ==================== -->
    <section class="content" v-if="!$root.spinner">
      <!-- row -->
      <div class="row">
        <div class="col-md-12">
          <!-- The time line -->
          <ul class="timeline">
            <!-- Laravel Route item -->
            <li>
              <i class="fa fa-folder bg-navy"></i>
              <div class="timeline-item">
                <h3 class="timeline-header no-border">
                  <b>Laravel Route:</b>
                  <span class="text-success font-weight-bold">routes/backend.php</span>
                  (
                  <span>I have already done this</span> )
                </h3>
              </div>
            </li>
            <!-- END Laravel Route item -->
            <!-- Vue Route item -->
            <li>
              <i class="fa fa-plus bg-maroon"></i>
              <div class="timeline-item">
                <h3 class="timeline-header no-border">
                  <b>Vue Route:</b>
                  <span class="text-maroon font-weight-bold">resources/js/Router/router.js</span>
                </h3>
                <div class="timeline-body">
                  Please add all the lines to the router.js file
                  <br />
                  // ------------------{{ data.name }} portion------------------
                  <br />
                  <span class="text-maroon">
                    { path: '/{{ data.route }}', name: '{{ data.route }}.index', meta: { title: '{{ data.name }}', nav: true }, component: () => import('./../views/backend/{{ data.name }}/Index'), beforeEnter: authGuard },
                    <br />
                    { path: '/{{ data.route }}/create', name: '{{ data.route }}.create', component: () => import('./../views/backend/{{ data.name }}/Create'), beforeEnter: authGuard },
                    <br />
                    { path: '/{{ data.route }}/:id', name: '{{ data.route }}.show', component: () => import('./../views/backend/{{ data.name }}/View'), beforeEnter: authGuard },
                    <br />
                    { path: '/{{ data.route }}/:id/edit', name: '{{ data.route }}.edit', component: () => import('./../views/backend/{{ data.name }}/Create'), beforeEnter: authGuard },
                    <br />
                  </span>
                </div>
              </div>
            </li>
            <!-- END Vue Route item -->
            <!-- Database item -->
            <li>
              <i class="fa fa-folder bg-purple"></i>
              <div class="timeline-item">
                <h3 class="timeline-header no-border">
                  <b>Database:</b>
                  <span class="text-success font-weight-bold">{{ data.database }}</span>
                </h3>
                <div class="timeline-body">
                  add your needed field in
                  <span class="text-maroon font-weight-bold">migration</span> file,
                  and run this command
                  <span
                    class="text-maroon font-weight-bold"
                  >php artisan migrate</span>
                </div>
              </div>
            </li>
            <!-- END Database item -->
            <!-- view File item -->
            <li>
              <i class="fa fa-folder bg-success text-white"></i>
              <div class="timeline-item">
                <h3 class="timeline-header no-border">
                  <b>Vue File:</b>
                  <span class="text-success font-weight-bold">{{ data.vue_file }}</span>
                </h3>
                <div class="timeline-body">
                  Customize your
                  <b class="text-maroon">Create.vue</b> form as you wish
                  <br />
                  <span class="text-maroon">
                    please provide validation rule each and every field,
                    validation rules are given at the bottom of the page
                  </span>
                </div>
              </div>
            </li>
            <!-- END Vue File item -->
            <!-- Controller item -->
            <li>
              <i class="fa fa-folder bg-blue"></i>
              <div class="timeline-item">
                <h3 class="timeline-header no-border">
                  <b>Controller:</b>
                  <span class="text-success font-weight-bold">{{ data.controller }}</span>
                </h3>
                <!-- <div class="timeline-body">
                  If this line does not exist :
                  <span
                    class="text-maroon font-weight-bold"
                  >use App\Http\Controllers\Controller;</span>
                  You just comment out of this line or
                  <b
                    class="text-maroon"
                  >remove this</b>
                </div>-->
              </div>
            </li>
            <!-- END Controller item -->
            <!-- model item -->
            <li>
              <i class="fa fa-folder bg-primary text-white"></i>
              <div class="timeline-item">
                <h3 class="timeline-header no-border">
                  <b>Model:</b>
                  <span class="text-success font-weight-bold">{{ data.model }}</span>
                </h3>
              </div>
            </li>
            <!-- END model item -->
            <!-- Resource item -->
            <li>
              <i class="fa fa-folder bg-teal"></i>
              <div class="timeline-item">
                <h3 class="timeline-header no-border">
                  <b>Resource:</b>
                  <span class="text-success font-weight-bold">{{ data.resource }}</span>
                </h3>
              </div>
            </li>
            <!-- END Resource item -->
            <!-- Setting item -->
            <li>
              <i class="fa fa-cogs bg-purple text-white"></i>
              <div class="timeline-item">
                <h3 class="timeline-header no-border">
                  I have already created
                  (
                  <b class="text-success">Dominion</b> ),
                  (
                  <b class="text-success">Process</b> ),
                  (
                  <b class="text-success">Authorized Menu</b> ) and
                  (
                  <b class="text-success">Permission to the Process</b> ).
                </h3>
                <div class="timeline-body">
                  Your menu has been created and the
                  <b class="text-success">{{ data.name }}</b> menu is at the top of the
                  <b class="text-success">Dashboard</b> menu. You will see after reloading.
                  <br />Finally reload the browser
                  <b class="text-maroon">( ctrl + f5 )</b>.
                </div>
              </div>
            </li>

            <!-- END Setting item -->
            <!-- Setting item -->
            <li>
              <i class="fa fa-thumbs-up bg-blue text-white"></i>
              <div class="timeline-item">
                <h3 class="timeline-header no-border">
                  If you complete all the processes then your module is ready to work
                  <br />
                  <br />
                  <b class="text-success">Congrats !!</b>
                  Go ahead
                </h3>
              </div>
            </li>
            <!-- END Setting item -->
            <li>
              <i class="fa fa-circle-o-notch bg-red"></i>
            </li>
          </ul>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
  </div>
</template>

<script>
// define model name
const model = "module";
// set breadcrumb
const breadcrumb = [
  { route: "module.create", title: "Module Create" },
  { route: "module.index", title: "Module Created File" },
];

export default {
  data() {
    return {
      model: model,
      data: {},
    };
  },
  methods: {
    getRules: function () {
      this.$root.spinner = true;
      axios
        .get("/module/create", {
          params: { model_name: this.$route.params.model },
        })
        .then((res) => (this.data = res.data))
        .catch((error) => console.log(error))
        .then((alw) => setTimeout(() => (this.$root.spinner = false), 300));
    },
  },
  created() {
    this.getRules(); // get rules
    breadcrumbs.dispatch("setBreadcrumbs", breadcrumb); // Set Breadcrumbs
  },
};
</script>

<style>
</style>