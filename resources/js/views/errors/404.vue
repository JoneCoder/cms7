<template>
  <section class="content pt-5">
    <div class="error-page mt-5">
      <h2 class="headline text-yellow">404</h2>

      <div class="error-content">
        <h3>
          <i class="fa fa-warning text-yellow"></i> Oops! Page not found.
        </h3>

        <p>
          We could not find the page you were looking for.
          <br />You may
          <router-link :to="{name:'admin.dashboard'}">return to dashboard</router-link>
        </p>
      </div>
      <!-- /.error-content -->
    </div>
    <!-- /.error-page -->
  </section>
</template>