<template>
  register
  <el-button type="primary" @click="send">register</el-button>
  <el-button type="danger" @click="tokenDelete">delete</el-button>
</template>

<script lang="ts">
import { register } from "../../api/User/register";
import storage from "../../utils/storage";

export default {
  name: "register",
  data() {
    return {
      user: {
        account: 1,
        password: 1,
        confirmPassword: 1,
      },
    };
  },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      let token: { name: string; pass: string } = storage.get("token");
      console.log(token);
    },
    send() {
      register(this.user)
        .then((res) => {
          console.log(res);
          storage.set("token", res.data.token);
        })
        .catch((err) => {
          console.log("请求错误");
        });
    },
    tokenDelete() {
      storage.remove("token");
    },
  },
  beforeRouteEnter(to, from, next) {
    //仅作为例子
    if (storage.get("token")) {
      //本地存储取到用户名，表示已登录
      next(true);
    } else {
      // 未登录
      next((vm) => {
        vm.$router.push("/index"); // 返回首页
        alert("请登录");
      });
    }
  },
};
</script>
