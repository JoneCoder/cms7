import Vue from 'vue';

// ===============Login helpers=============
import Admin from "./../Helpers/Login/Admin";
window.Admin = Admin;

// ===============Breadcrumbs from vuex===============
import breadcrumbs from "../vuex/breadcrumbs";
window.breadcrumbs = breadcrumbs;

// ===============profile from vuex===============
import profile from "../vuex/profile";
window.profile = profile;

// ===============AddOrBackButton===============
import AddOrBackButton from './../components/elements/index/AddOrBackButton'
Vue.component('AddOrBackButton', AddOrBackButton)

// ===============Search===============
import Search from './../components/elements/index/Search'
Vue.component('Search', Search)

// ===============ViewBaseTable===============
import ViewBaseTable from './../components/elements/ViewBaseTable'
Vue.component('ViewBaseTable', ViewBaseTable)

// ===============Pagination===============
import Pagination from './../components/elements/Pagination'
Vue.component('Pagination', Pagination)

// ===============BaseTable===============
import BaseTable from './../components/elements/BaseTable'
Vue.component('BaseTable', BaseTable)

// ===============Spinner===============
import Spinner from './../components/elements/Spinner'
Vue.component('Spinner', Spinner)

// ===============Flash Message===============
import FlashMessage from '@smartweb/vue-flash-message';
Vue.use(FlashMessage);

// ===============js pdf===============
import jsPDF from 'jspdf';
window.jsPDF = jsPDF;
import autoTable from 'jspdf-autotable'
window.autoTable = autoTable;

// ===============Json Excel===============
import JsonExcel from 'vue-json-excel'
Vue.component('downloadExcel', JsonExcel)

// ===============Simple Vue Validator===============
import SimpleVueValidation from "simple-vue-validator";
const Validator = SimpleVueValidation.Validator;
window.Validator = Validator;
Vue.use(SimpleVueValidation);

// ===============CKEditor===============
import CKEditor from 'ckeditor4-vue';
Vue.use(CKEditor);
import CKEditorComponent from './../components/backend/CKEditor'
Vue.component('editor', CKEditorComponent)

// ===============Bootstrap Vue===============
import BootstrapVue from 'bootstrap-vue'
Vue.use(BootstrapVue);
