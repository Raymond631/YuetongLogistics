<template>
  <div class="container">
    <navigationBar />
    <div class="content">
      <welcomeHeader />
      <!-- <el-button type="primary" @click="ready">login</el-button> -->
      <ytTable :cl1data="data1" />
    </div>
  </div>
</template>
<script lang="ts">
import navigationBar from "../components/navigationBar.vue";
import welcomeHeader from "../components/header.vue";
import ytTable from "../components/yt-table.vue";
import { defineComponent } from "vue";
import { test1 } from "../api/test";

export default defineComponent({
  name: "about",
  data() {
    return {
      data1: {
        number: 5,
        columns: [
          { column: "name1" },
          { column: "name2" },
          { column: "name3" },
          { column: "name4" },
          { column: "name5" },
        ],
      },
      user: {
        account: 1,
        password: 1,
      },
    };
  },

  components: { welcomeHeader, navigationBar, ytTable },
  mounted() {},
  methods: {
    ready() {
      test1()
        .then((res) => {
          console.log("success");
        })
        .catch((err) => {
          console.log("defeat");
        });
    },
    menuSelect(index: string) {},
  },
});
</script>

<style lang="scss">
.container {
  .content {
    margin-left: $Mleft;
    height: $max_height;
    background-color: $back_color;
  }
}
</style>

../api/test
