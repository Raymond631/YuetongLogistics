<template>
  <div class="container">
    <div class="main-frame">
      <div class="left">

      </div>
      <div class="right">
        <label class="title1">管理员注册</label>
        <label class="title2">------------物流管理系统欢迎您的注册------------</label>
        <el-form :model="account" status-icon :rules="rules" ref="userForm" label-width="70px" class="userForm">
          <el-form-item label="用户名" prop="username">
            <el-input type="text" v-model="account.username" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="password">
            <el-input type="password" v-model="account.password" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="确认密码" prop="password">
            <el-input type="password" v-model="user.passwordRepeat" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="邮箱" prop="email">
            <el-input v-model="user.email"></el-input>
          </el-form-item>
          <el-form-item label="验证码" prop="checkCode" class="check-item">
            <el-input v-model="user.checkCode" class="checkCodeInput"></el-input>
            <el-button type="primary" class="checkCodeBtn">获取验证码</el-button>
          </el-form-item>
          <el-form-item class="buttons-item">
            <el-button type="primary" @click="submitForm('ruleForm')" class="loginBtn">登录</el-button>
            <el-button @click="resetForm('ruleForm')" class="registerBtn">注册</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </div>
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
