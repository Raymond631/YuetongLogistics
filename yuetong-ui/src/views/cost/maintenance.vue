<template>
  <div class="container">
    <navigationBar/>
    <div class="content">
      <welcomeHeader />
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import navigationBar from "../../components/navigationBar.vue";
import welcomeHeader from "../../components/header.vue";
import ytTable from "../../components/yt-table.vue";

export default defineComponent({
  name: "maintenance",
  data() {
    return {
      data: "",
    };
  },
  components: { welcomeHeader, navigationBar, ytTable },
  mounted() {},
  methods: {
    goBack() {},
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../assets/style/css/maintence.scss";
</style>
