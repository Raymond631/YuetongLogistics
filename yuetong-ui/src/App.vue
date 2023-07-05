
<template>
  <div v-if="headerShow">
    <PageHeader />
  </div>
  <RouterView v-if="isRouterShow" />
</template>
<script lang="ts">
import { RouterLink, RouterView } from "vue-router";
import PageHeader from "@/components/PageHeader.vue";
export default {
  components: {PageHeader},
  data(){
    return{
      headerShow:false,
      isRouterShow:true
    }
  },
  methods: {

  },
  // 对路由监听，获取当前页面地址
  watch: {
    '$route':function (){
      console.log("路由为：" + this.$route.path)
      //若为index页面则不显示顶部导航栏
      if (this.$route.path === "/" || this.$route.path === "/login" || this.$route.path === "/register") {
        this.headerShow = false;
      } else {
        this.headerShow = true;
      }
    },
  },
}
</script>

<style scoped>

</style>
