<template>
  <el-menu :default-active="activeIndex" class="menu" @select="menuSelect">
    <div class="title">
      <div class="title_icon">
        <el-icon>
          <Ship />
          <Van />
        </el-icon>
      </div>
      <div class="title_name">粤通物流</div>
      <div class="title_groupName">木子石石石</div>
    </div>
    <h4 class="menu_title">Main Menu</h4>
    <el-menu-item index="0" class="menu_item">
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">首页</span>
    </el-menu-item>
    <el-menu-item
      index="1"
      class="menu_item"
      v-if="userType === 2 || userType === 0"
    >
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">车队信息管理</span>
    </el-menu-item>
    <el-menu-item
      index="2"
      class="menu_item"
      v-if="userType === 2 || userType === 0"
    >
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">车辆信息维护</span>
    </el-menu-item>
    <el-menu-item
      index="3"
      class="menu_item"
      v-if="userType === 2 || userType === 0"
    >
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">驾驶员信息维护</span>
    </el-menu-item>
    <el-menu-item
      index="4"
      class="menu_item"
      v-if="userType === 4 || userType === 0"
    >
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">调度承运任务</span>
    </el-menu-item>
    <el-menu-item
      index="5"
      class="menu_item"
      v-if="userType === 3 || userType === 0"
    >
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">承运单开出</span>
    </el-menu-item>
    <el-menu-item
      index="6"
      class="menu_item"
      v-if="userType === 3 || userType === 0"
    >
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">承运单接收</span>
    </el-menu-item>
    <el-menu-item
      index="7"
      class="menu_item"
      v-if="userType === 5 || userType === 0"
    >
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">成本维护</span>
    </el-menu-item>
<!--    <el-menu-item-->
<!--      index="8"-->
<!--      class="menu_item"-->
<!--      v-if="userType === 5 || userType === 0"-->
<!--    >-->
<!--      <el-icon class="menu_item_icon">-->
<!--        <Reading />-->
<!--      </el-icon>-->
<!--      <span class="menu_item_content">成本核算</span>-->
<!--    </el-menu-item>-->
    <el-menu-item
      index="10"
      class="menu_item"
      v-if="userType === 5 || userType === 4 || userType === 0"
    >
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">历史承运任务</span>
    </el-menu-item>
    <el-menu-item
      index="11"
      class="menu_item"
      v-if="userType === 1 || userType === 0"
    >
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">用户维护</span>
    </el-menu-item>

    <el-menu-item
      index="13"
      class="menu_item"
      v-if="userType === 1 || userType === 0"
    >
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">日志维护</span>
    </el-menu-item>
    <el-menu-item
        index="14"
        class="menu_item"
    >
      <el-icon class="menu_item_icon">
        <Reading />
      </el-icon>
      <span class="menu_item_content">个人中心</span>
    </el-menu-item>
<!--    <div class="bottom" v-if="userType !== 0"></div>-->
  </el-menu>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "navigationBar",
  data() {
    return {
      activeIndex: "",
      user: {
        username: "yueyue",
        roleId: 1,
        roleName: "系统管理员",
      },
      userType: 1,
    };
  },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      //刷新页面保持侧边栏选中值
      // sessionStorage.setItem("user", JSON.stringify(this.user));
      console.log(this.user.roleId)
      this.user = JSON.parse(sessionStorage.getItem("user") || "{}");
      if (this.user.roleId && this.user.roleName && this.user.username) {
        //已登录
        this.userType = this.user.roleId;
      }
      let route = this.$route.path;
      switch (route) {
        case "/authentication/main":
          this.activeIndex = "0";
          break;
        case "/fleet/team":
          this.activeIndex = "1";
          break;
        case "/fleet/truck":
          this.activeIndex = "2";
          break;
        case "/fleet/driver":
          this.activeIndex = "3";
          break;
        case "/carrier/task/dispatch":
          this.activeIndex = "4";
          break;
        case "/carrier/bill/issue":
          this.activeIndex = "5";
          break;
        case "/carrier/bill/reception":
          this.activeIndex = "6";
          break;
        case "/cost/maintenance":
          this.activeIndex = "7";
          break;
        case "/cost/accounting":
          this.activeIndex = "8";
          break;
        case "/search/capacity":
          this.activeIndex = "9";
          break;
        case "/search/history":
          this.activeIndex = "10";
          break;
        case "/system/user":
          this.activeIndex = "11";
          break;
        case "/system/system":
          this.activeIndex = "12";
          break;
        case "/system/log":
          this.activeIndex = "13";
          break;
        case "/authentication/selfCenter":
          this.activeIndex = "14";
          break;
        default:
          this.activeIndex = "0";
          break;
      }
    },
    menuSelect(index: string) {
      //选中侧边栏后跳转到相应界面
      switch (index) {
        case "0":
          this.$router.push("/authentication/main");
          this.activeIndex = "0";
          break;
        case "1":
          this.$router.push("/fleet/team");
          this.activeIndex = "1";
          break;
        case "2":
          this.$router.push("/fleet/truck");
          this.activeIndex = "2";
          break;
        case "3":
          this.$router.push("/fleet/driver");
          this.activeIndex = "3";
          break;
        case "4":
          this.$router.push("/carrier/task/dispatch");
          this.activeIndex = "4";
          break;
        case "5":
          this.$router.push("/carrier/bill/issue");
          this.activeIndex = "5";
          break;
        case "6":
          this.$router.push("/carrier/bill/reception");
          this.activeIndex = "6";
          break;
        case "7":
          this.$router.push("/cost/maintenance");
          this.activeIndex = "7";
          break;
        case "8":
          this.$router.push("/cost/accounting");
          this.activeIndex = "8";
          break;
        case "9":
          this.$router.push("/search/capacity");
          this.activeIndex = "9";
          break;
        case "10":
          this.$router.push("/search/history");
          this.activeIndex = "10";
          break;
        case "11":
          this.$router.push("/system/user");
          this.activeIndex = "11";
          break;
        case "12":
          this.$router.push("/system/system");
          this.activeIndex = "12";
          break;
        case "13":
          this.$router.push("/system/log");
          this.activeIndex = "13";
          break;
        case "14":
          this.$router.push("/authentication/selfCenter");
          this.activeIndex = "14";
          break;
        default:
          this.$router.push("/authentication/main");
          this.activeIndex = "0";
          break;
      }
    },
  },

});
</script>

<style lang="scss" scoped="scoped">
@import "../assets/style/components/navigationBar.scss";
</style>
