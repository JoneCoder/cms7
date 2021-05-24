<template>
  <div class="form-row col-4">
    <div class="col-5 pl-3 no-padding">
      <select v-model="$parent.search_data.field_name" class="form-control form-control-sm">
        <option
          v-for="(value, name, index) in fields_name"
          :key="index"
          v-bind:value="name"
        >{{ value }}</option>
      </select>
    </div>
    <div class="col-6 no-padding">
      <input
        type="text"
        v-model="$parent.search_data.value"
        class="form-control form-control-sm"
        placeholder="Type your text"
      />
    </div>
    <div class="col-1 no-padding">
      <button type="submit" class="btn btn-sm btn-success">
        <i class="fa fa-search"></i>
      </button>
    </div>
  </div>
</template>

<script>
export default {
  props: ["fields_name"]
};
</script>

<style>
</style>