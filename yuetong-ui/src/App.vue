<template>

  <RouterView v-if="isRouterShow" />
</template>
<script lang="ts">
import { RouterLink, RouterView } from "vue-router";
import welcomeHeader from "@/components/header.vue";
import navigationBar from "@/components/navigationBar.vue";
export default {
  data(){
    return{
      naviBarShow:false,
      isRouterShow:true
    }
  },
  components: {welcomeHeader, navigationBar},
  methods: {

  },
  // 对路由监听，获取当前页面地址
  watch: {
    '$route':function (){
      //若为index页面则不显示侧边导航栏
      if (this.$route.path === "/" || this.$route.path === "/authentication/login" || this.$route.path === "/about") {
        this.naviBarShow = false;
      } else {
        this.naviBarShow = true;
      }
    },
  },
}
</script>

<style scoped>
@import "src/assets/main.css";
</style>
