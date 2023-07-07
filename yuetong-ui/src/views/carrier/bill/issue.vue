<template></template>

<script lang="ts">
import { defineComponent } from "vue";
import navigationBar from "../../../components/navigationBar.vue";
import welcomeHeader from "../../../components/header.vue";

export default defineComponent({
  name: "issue",
  data() {
    return {
      data: "",
    };
  },
  components: { welcomeHeader, navigationBar },
  mounted() {},
  methods: {
    goBack() {},
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../../assets/style/css/issue.scss";
</style>
