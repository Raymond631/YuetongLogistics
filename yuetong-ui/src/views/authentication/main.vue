<template>
  <div class="container">
    <navigationBar/>
    <div class="content">
      <welcomeHeader />
    </div>
  </div>

</template>

<script lang="ts">
import {defineComponent} from "vue";
import navigationBar from "../../components/navigationBar.vue";
import welcomeHeader from "../../components/header.vue";
import ytTable from "../../components/yt-table.vue";

export default defineComponent({
  name: "main",
  data() {
    return {
      data: "",
      components: { welcomeHeader, navigationBar, ytTable },
    };
  },
  components: {welcomeHeader, navigationBar, ytTable},
  mounted() {
  },
  methods: {
    goBack() {
    },
  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/selfcenter.scss";
.container {
  .content {
    margin-left: $Mleft;
    height: $max_height;
    //background-color: $back_color;
    background-color: #f6f6f6;
  }
}
</style>
