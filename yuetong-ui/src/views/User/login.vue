<template>
  <div class="container">
    <div class="main-frame">
      <div class="left">
        <label class="title1">微信账号</label>
        <label class="title2">扫码完成微信账号绑定并登录</label>
        <label class="title3"><img src="../../assets/images/weixin.jpg" alt="微信二维码" class="weixin"></label>
        <label class="title4">---------其他登录方式---------</label>
        <div class="login-methods">
          <i class="fa fa-solid fa-mobile-screen"></i>
          <label>短信登录</label>

        </div>

      </div>
      <div class="right">
        <label class="title1">管理员登录</label>
        <label class="title2">------------物流管理系统欢迎您的登录------------</label>
        <el-form :model="user" status-icon :rules="rules" ref="userForm" label-width="70px" class="userForm">
          <el-form-item label="用户名" prop="username">
            <el-input type="text" v-model="user.username" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="password">
            <el-input type="password" v-model="user.password" autocomplete="off"></el-input>
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
import 'font-awesome/css/font-awesome.min.css';
export default {
  name: "login",
  data() {
    const validateUsername = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入用户名'));
      } else {
        if (this.user.username !== '') {
          this.$refs.ruleForm.validateField('username');
        }
        callback();
      }
    };
    const validatePassword = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'));
      } else {
        if (this.user.password !== '') {
          this.$refs.ruleForm.validateField('password');
        }
        callback();
      }
    };
    const validateEmail = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入邮箱'));
      } else {
        if (this.user.email !== '') {
          this.$refs.ruleForm.validateField('email');
        }
        callback();
      }
    };
    return {
      user: {
        username: '',
        password: '',
        email:'',
        checkCode: ''
      },
      rules: {
        username: [
          {validator: validateUsername, trigger: 'blur'}
        ],
        password: [
          {validator: validatePassword, trigger: 'blur'}
        ],
        email: [
          {validator: validateEmail, trigger: 'blur'}
        ]
      }
    }
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          alert('submit!');
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  }
}

</script>

<style scoped lang="scss">
@mixin font-right {
  font-family: "Microsoft YaHei", sans-serif;
  color: $theme_color;
}
@mixin font-left{
  font-family: "仿宋", sans-serif;
}

.container {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  /*背景图片*/
  background-image: url("../../assets/images/truck.jpg");
  background-repeat: no-repeat;
  background-size: cover;
  overflow: hidden;
}

.main-frame {
  width: 900px;
  height: 600px;
  position: relative;
  background-color: rgba(255, 255, 255, 0.9);
  border-radius: 20px;
  margin: 130px auto;
  display: flex;

  .left {
    width: 400px;
    height: 600px;
    background-image: url("../../assets/images/loginBgi.png");
    background-size: cover;
    background-repeat: no-repeat;
    overflow: hidden;
    border-radius: 20px 0 0 20px;
    text-align: center;
    .title1,.title2,.title3,.title4{
      display: block;
      @include font-left;
    }
    .title1{
      margin-top: 100px;
      font-size: 30px;
      color: #ffffff;
    }
    .title2,.title4{
      margin-top: 30px;
      font-size: 15px;
      color: #e7e6e6;
    }
    .weixin{
      width: 200px;
    }

  }

  .right {
    width: 500px;
    height: 600px;
    position: relative;
    @include font-right;

    .title1 {
      display: block;
      font-size: 30px;
      font-weight: bold;
      margin-top: 70px;
      margin-left: 175px;
    }
    .title2 {
      margin-top: 20px;
      margin-left: 100px;
      display: block;
    }
    .userForm{
      width: 350px;
      margin: 60px auto;
      .check-item{
        display: flex;
        .checkCodeInput{
          width: 158px;
          margin-right: 20px;
        }
        .checkCodeBtn{
          background-color: $theme_color;
        }
      }
      .buttons-item{
        display: flex;
        .loginBtn{
          width: 280px;
          margin: 0;
          background-color: $theme_color;
        }
        .registerBtn{
          margin-top: 10px;
          width: 280px;
          background-color: #ffffff;
        }
      }
    }
  }
}
</style>