<template>
  <div class="header">
    <div class="header_name">
      {{ page_name }}
    </div>
    <div class="header_content">欢迎您，{{ user_name }}</div>
    <el-avatar
      :size="80"
      class="header_photo"
      src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
    />
    <el-tag size="large" class="header_profile">{{ profile }}</el-tag>
    <el-link :underline="false" type="danger" class="header_log">退出登录</el-link>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "header",
  data() {
    return {
      data: "",
      page_name: "首页",
      user_name: "yueyue",
      profile: "系统管理员",
    };
  },
  mounted() {},
  methods: {
    goBack() {},
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../assets/style/components/header.scss";
</style>
