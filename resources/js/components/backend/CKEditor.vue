<template>
  <ckeditor :name="editorModel" v-model="$parent.data[editorModel]" :editorUrl="editorUrl"></ckeditor>
</template>

<script>
export default {
  name: "CKEditor",
  props: ["editorModel"],
  data() {
    return {
      editorUrl: this.$root.baseurl + "/public/ckeditor/ckeditor.js"
    };
  }
};
</script>