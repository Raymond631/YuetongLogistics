<template>
  <div class="header">
    <div class="header_name">
      {{ page_name }}
    </div>
    <div class="header_content">欢迎您，{{ user.username }}</div>
    <el-avatar
      :size="80"
      class="header_photo"
      src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
    />
    <el-tag size="large" class="header_profile">{{ user.roleName }}</el-tag>
    <el-button type="danger" plain class="header_log" @click="userLogout"
      >退出登录</el-button
    >
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { logout } from "../api/authentication/login";

export default defineComponent({
  name: "header",
  data() {
    return {
      data: "",
      user: {
        username: "yueyue",
        roleId: 2,
        roleName: "系统管理员",
      },
      page_name: "首页",
    };
  },
  mounted() {
    this.ready();
  },

  methods: {
    userLogout() {
      //普通管理员登录系统
      logout()
        .then((res: any) => {
          console.log("logout success");
          sessionStorage.removeItem("user");
          this.$router.push("/authentication/login");
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    ready() {
      //刷新页面更新顶部页面标题
      this.user = JSON.parse(sessionStorage.getItem("user") || "{}");
      if (this.user.roleId&&this.user.roleName&&this.user.username) {
        //已登录
      }
      let route = this.$route.path;
      switch (route) {
        case "/authentication/main":
          this.page_name = "首页";
          break;
        case "/fleet/team":
          this.page_name = "车队管理";
          break;
        case "/fleet/truck":
          this.page_name = "车辆管理";
          break;
        case "/fleet/driver":
          this.page_name = "驾驶员管理";
          break;
        case "/carrier/task/dispatch":
          this.page_name = "调度承运任务";
          break;
        case "/carrier/bill/issue":
          this.page_name = "承运单开出";
          break;
        case "/carrier/bill/reception":
          this.page_name = "承运单接收";
          break;
        case "/cost/maintenance":
          this.page_name = "成本维护";
          break;
        case "/cost/accounting":
          this.page_name = "成本核算";
          break;
        case "/search/capacity":
          this.page_name = "运力综合";
          break;
        case "/search/history":
          this.page_name = "历史承运任务";
          break;
        case "/system/user":
          this.page_name = "用户维护";
          break;
        case "/system/system":
          this.page_name = "系统维护";
          break;
        case "/system/log":
          this.page_name = "日志维护";
          break;
        default:
          this.page_name = "0";
          break;
      }
    },
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../assets/style/components/header.scss";
</style>
