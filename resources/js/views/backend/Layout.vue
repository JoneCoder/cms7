<template>
    <div class="wrapper">
        <!--============ Header start ============-->
        <Header />

        <!--============ Leftside start ============-->
        <LeftSide />

        <div class="content-wrapper">
            <!--============ Breadcrumbs ============-->
            <Breadcrumbs />
            <!--============ /Breadcrumbs ============-->

            <!--============ Main content ============-->
            <section class="content">
                <router-view></router-view>
                <div class="box box-success p-5" v-if="$root.spinner">
                    <div class="row d-flex align-items-center justify-content-center" style="height:350px;">
                        <spinner />
                    </div>
                </div>
            </section>
            <!--============ /Main content ============-->
        </div>

        <!--============ footer start ============-->
        <Footer />
        <!--============ footer end ============-->
    </div>
</template>

<script>
    import Header from "./../../components/backend/Header";
    import LeftSide from "./../../components/backend/Leftside";
    import Footer from "./../../components/backend/Footer";
    import Breadcrumbs from "./../../components/backend/Breadcrumbs";
    export default {
        components: {
            Breadcrumbs,
            Header,
            LeftSide,
            Footer
        },
        beforeCreate() {
            if (!Admin.id()) {
                Admin.logout();
            }
        },
        created() {
            $(document).ready(function() {
                $(".sidebar-menu").tree();
            });
        }
    };
</script>
