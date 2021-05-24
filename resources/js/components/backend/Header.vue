<template>
    <header class="main-header">
        <!-- Logo -->
        <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"> <b>{{ shortName }}</b> </span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"> {{ username }} </span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <!-- <nav class="navbar navbar-expand-md navbar-light bg-light"> -->
        <nav class="navbar navbar-expand-md" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <div id="navbarCollapse" class="collapse navbar-collapse">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item dropdown messages-menu">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-envelope-o"></i>
                            <span class="label label-success">4</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li class="header">You have 4 messages</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li>
                                        <!-- start message -->
                                        <a href="#">
                                            <div class="pull-left">
                                                <img
                                                    :src="$root.userimage"
                                                    class="img-circle"
                                                    alt="User Image"
                                                />
                                            </div>
                                            <h4>
                                                Support Team
                                                <small> <i class="fa fa-clock-o"></i> 5 mins </small>
                                            </h4>
                                            <p>Why not buy a new awesome theme?</p>
                                        </a>
                                    </li>
                                    <!-- end message -->
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="#">See All Messages</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown notifications-menu">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
                            <span class="label label-warning">10</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li class="header">You have 10 notifications</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users text-aqua"></i> 5 new members joined
                                            today
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="#">View all</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown tasks-menu">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-flag-o"></i>
                            <span class="label label-danger">9</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li class="header">You have 9 tasks</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li>
                                        <!-- Task item -->
                                        <a href="#">
                                            <h3>
                                                Design some buttons
                                                <small class="pull-right">20%</small>
                                            </h3>
                                            <div class="progress xs">
                                                <div
                                                    class="progress-bar progress-bar-aqua"
                                                    style="width: 20%"
                                                    role="progressbar"
                                                    aria-valuenow="20"
                                                    aria-valuemin="0"
                                                    aria-valuemax="100"
                                                >
                                                    <span class="sr-only">20% Complete</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <!-- end task item -->
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="#">View all tasks</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown user user-menu">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                            <img
                                :src="profileImage ? profileImage : $root.userimage"
                                class="user-image"
                                alt="User Image"
                            />
                            <span class="hidden-xs">{{ logged_name }}</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <!-- User image -->
                            <li class="user-header">
                                <img
                                    :src="profileImage ? profileImage : $root.userimage"
                                    class="img-circle"
                                    alt="User Image"
                                />
                                <p>
                                    {{ logged_name }}
                                    <small>{{ role_name }}</small>
                                </p>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <router-link
                                        :to="{ name: 'admin.show', params: { id: logged_id } }"
                                        class="btn btn-sm btn-success border border-success"
                                    >
                                        <i class="fa fa-user"></i> Profile
                                    </router-link>
                                </div>
                                <div class="pull-right">
                                    <a
                                        href="javascript:void(0)"
                                        @click="Logout()"
                                        class="btn btn-sm btn-danger border border-danger"
                                    >
                                        <i class="fa fa-sign-out"></i> Sign out
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
</template>

<script>
    export default {
        data() {
            return {
                role_name: "",
                logged_id: "",
                logged_name: "",
                username: "",
                shortName: ""
            };
        },
        computed: {
            profileImage() {
                return profile.state.image;
            },
        },
        methods: {
            Logout() {
                this.$root.spinner = true;
                Admin.logout();
            },
            CreateShortName(username){
                let len = username.length, i = 0, shortName = '';
                while (i <= len){
                    let character = username.charAt(i);
                    if(character == character.toUpperCase()){shortName += character;}
                    i++;
                }
                return shortName;
            }
        },
        created() {
            this.logged_id      = Admin.id();
            this.role_name      = Admin.role();
            this.logged_name    = Admin.name();
            this.username       = Admin.username();
            this.shortName      = this.CreateShortName(Admin.username());
        },
    };
</script>

<style>
    .navbar {
        height: 50px !important;
    }
</style>
