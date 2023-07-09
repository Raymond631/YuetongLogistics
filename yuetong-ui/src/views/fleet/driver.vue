<template>
  <div class="container">
    <navigationBar/>
    <div class="content">
      <welcomeHeader />
    </div>
  </div>
</template>

<script>
import welcomeHeader from "../../components/header.vue";
import navigationBar from "../../components/navigationBar.vue";
import ytTable from "../../components/yt-table.vue";

export default {
  name: "driver",
  components: { welcomeHeader, navigationBar, ytTable },
}
</script>

<style scoped lang="scss">
.container {
.content {
  margin-left: $Mleft;
  height: $max_height;
//background-color: $back_color;
  background-color: #f6f6f6;
}
}
</style>
