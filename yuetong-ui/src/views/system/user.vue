<template>
  <div class="container">
    <navigationBar />
    <div class="content">
      <welcomeHeader />
      <div class="block-list">
        <div class="search">
          <el-input
            type="text"
            class="search-input"
            v-model="search"
            placeholder="请搜索用户"
          ></el-input>
        </div>
        <div class="actions">
          <div class="action1">
            <label>筛选</label>
          </div>
          <div class="action2">
            <label>添加用户</label>
          </div>
        </div>
      </div>

      <div class="user-main">
        <div class="user-block" v-for="user in userList" :key="user.id">
          <div class="basic-info">
            <el-avatar type="image" :src="user.image" class="image"></el-avatar>
            <div class="right-info">
              <label v-text="user.username" class="username"></label>
              <label v-text="'#' + user.role" class="role"></label>
              <div class="icons">
                <el-icon :size="30" :color="'#0e6f64'" class="icon">
                  <Avatar />
                </el-icon>
                <el-icon :size="30" :color="'#0e6f64'" class="icon">
                  <PhoneFilled />
                </el-icon>
                <el-icon :size="30" :color="'#0e6f64'" class="icon">
                  <ChatLineRound />
                </el-icon>
              </div>
            </div>
            <div class="dot"></div>
            <!-- <el-icon :size="30" class="more">
              <More />
            </el-icon> -->
          </div>
          <div class="extra-info">
            <label class="title">Email</label>
            <label class="email" v-text="user.email"></label>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import navigationBar from "../../components/navigationBar.vue";
import welcomeHeader from "../../components/header.vue";
import ytTable from "../../components/yt-table.vue";

export default defineComponent({
  name: "user",
  data() {
    return {
      search: "",
      userList: [
        {
          id: 1,
          image:
            "https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg",
          username: "彭狗",
          role: "调度员",
          sex: "男",
          phone: "19573135235",
          email: "1139040315@qq.com",
        },
        {
          id: 2,
          image:
            "https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg",
          username: "彭狗",
          role: "调度员",
          sex: "男",
          phone: "19573135235",
          email: "1139040315@qq.com",
        },
        {
          image:
            "https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg",
          username: "彭狗",
          role: "调度员",
          sex: "男",
          phone: "19573135235",
          email: "1139040315@qq.com",
        },
        {
          image:
            "https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg",
          username: "彭狗",
          role: "调度员",
          sex: "男",
          phone: "19573135235",
          email: "1139040315@qq.com",
        },
        {
          image:
            "https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg",
          username: "彭狗",
          role: "调度员",
          sex: "男",
          phone: "19573135235",
          email: "1139040315@qq.com",
        },
        {
          image:
            "https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg",
          username: "彭狗",
          role: "调度员",
          sex: "男",
          phone: "19573135235",
          email: "1139040315@qq.com",
        },
        {
          image:
            "https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg",
          username: "彭狗",
          role: "调度员",
          sex: "男",
          phone: "19573135235",
          email: "1139040315@qq.com",
        },
        {
          image:
            "https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg",
          username: "彭狗",
          role: "调度员",
          sex: "男",
          phone: "19573135235",
          email: "1139040315@qq.com",
        },
        {
          image:
            "https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg",
          username: "彭狗",
          role: "调度员",
          sex: "男",
          phone: "19573135235",
          email: "1139040315@qq.com",
        },
      ],
    };
  },
  components: { welcomeHeader, navigationBar, ytTable },
  mounted() {},
  methods: {
    goBack() {},
  },
});
</script>

<style scoped lang="scss">
@import "../../assets/style/css/user.scss";
</style>
