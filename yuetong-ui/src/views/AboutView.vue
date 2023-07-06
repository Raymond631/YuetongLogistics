<template>
  <div class="container">
    <navigationBar />
    <div class="content">
      <welcomeHeader />
      <el-button type="primary" @click="ready">login</el-button>
    </div>
  </div>
</template>
<script lang="ts">
import navigationBar from "../components/navigationBar.vue";
import welcomeHeader from "../components/header.vue";
import { defineComponent } from "vue";
import {test1} from  '../api/test'

export default defineComponent({
  name: "header",
  data() {
    return {
      data: "",
      user:{
        account :1,
        password:1,
      }
    };
  },
  components: { welcomeHeader, navigationBar },
  mounted() {},
  methods: {
    ready(){
      test1().then(res=>{
        //请求成功，做相应处理
        console.log("success");
      }).catch(err=>{
        //请求失败，做相应处理
        console.log("defeat");
      })
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
    background-color:$back_color;
  }
}
</style>

../api/test