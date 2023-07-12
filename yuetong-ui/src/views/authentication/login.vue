<template>
  <div class="container">
    <div class="main-frame">
      <div class="left">
        <label class="title1">微信账号</label>
        <label class="title2">扫码完成微信账号绑定并登录</label>
        <label class="title3"
          ><img
            src="../../assets/images/weixin.jpg"
            alt="微信二维码"
            class="weixin"
        /></label>
        <label class="title4">---------其他登录方式---------</label>
        <div class="login-methods">
          <div class="method-item">
            <i class="fa fa-solid fa-mobile-screen"></i>
            <label>短信登录</label>
          </div>
        </div>
      </div>
      <div class="right">
        <label class="title1">管理员登录</label>
        <label class="title2"
          >------------物流管理系统欢迎您的登录------------</label
        >
        <div label-width="70px" class="userForm">
          <div class="form-item">
            <label>用户名</label>
            <input
              type="text"
              v-model="user.account"
              autocomplete="off"
              class="usernameInput"
              @blur="validateUsername"
            />
          </div>
          <label
            class="inputMsg usernameMsg"
            v-text="inputMsg.accountMsg"
            v-if="inputMsg.accountMsg !== ''"
          ></label>
          <div class="form-item">
            <label>密码</label>
            <input
              type="password"
              v-model="user.password"
              autocomplete="off"
              class="passwordInput"
              @blur="validatePassword"
            />
          </div>
          <!-- <label class="inputMsg passwordMsg" v-text="inputMsg.passwordMsg" v-if="inputMsg.passwordMsg!==''"></label>
          <div class="form-item">
            <label>邮箱</label>
            <input type="text" v-model="user.email" class="emailInput" @blur="validateEmail">
          </div> -->
          <!-- <label
            class="inputMsg emailMsg"
            v-text="inputMsg.emailMsg"
            v-if="inputMsg.emailMsg !== ''"
          ></label> -->
          <div class="form-item check-item">
            <label>验证码</label>
            <input v-model="user.code" class="checkCodeInput" />
            <a class="checkCodeBtn"
              ><img
                :src="codeUrl"
                alt="验证码"
                class="code_img"
                id="verificationCode"
                @click="newVertification()"
            /></a>
          </div>
          <label
            class="inputMsg checkCodeMsg"
            v-text="inputMsg.codeMsg"
            v-if="inputMsg.codeMsg !== ''"
          ></label>
          <div class="buttons-item">
            <el-button type="primary" @click="submitForm()" class="loginBtn"
              >登录</el-button
            >
            <el-button @click="superSubmitForm()" class="registerBtn"
              >系统管理员登录</el-button
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import "font-awesome/css/font-awesome.min.css";
import { login, vertify } from "../../api/authentication/login";

export default {
  name: "login",
  data() {
    return {
      codeUrl: "",
      user: {
        account: "",
        password: "",
        code: "",
        uuid: "",
      },
      //表单input输入值格式判断
      inputMsg: {
        accountMsg: "",
        passwordMsg: "",
        codeMsg: "",
      },
    };
  },
  mounted() {
    this.newVertification();
    
  },
  methods: {
    newVertification() {
      let that = this;
      vertify()
        .then((res: any) => {
          console.log(res);
          that.user.uuid = res.uuid;
          that.codeUrl = "data:image/gif;base64," + res.img;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },

    //判断用户名、密码、邮箱的输入格式
    validateUsername() {
      const usernameStr = this.user.account;
      if (usernameStr == "") {
        this.inputMsg.accountMsg = "请输入用户名";
      } else {
        this.inputMsg.accountMsg = "";
      }
    },
    validatePassword() {
      const passwordStr = this.user.password;
      if (passwordStr == "") {
        this.inputMsg.passwordMsg = "请输入密码";
      } else {
        this.inputMsg.passwordMsg = "";
      }
    },

    //点击登录按钮
    submitForm() {
      //普通管理员登录系统
      login(this.user)
        .then((res: any) => {
          console.log("login success");
          sessionStorage.setItem("user", JSON.stringify(res.data));
          this.$router.push("/authentication/main");
        })
        .catch((err: any) => {
          console.log(err);
        });
      //调用登录接口
    },
    //点击系统管理员登录按钮
    superSubmitForm() {
      //系统管理员登录系统
      this.$router.push("/authentication/main");
    },
  },
};
</script>

<style scoped lang="scss">
@mixin font-right {
  font-family: "Microsoft YaHei", sans-serif;
  color: $theme_color;
}

@mixin font-left {
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

    .title1,
    .title2,
    .title3,
    .title4 {
      display: block;
      @include font-left;
    }

    .title1 {
      margin-top: 100px;
      font-size: 30px;
      color: #ffffff;
    }

    .title2,
    .title4 {
      margin-top: 30px;
      font-size: 15px;
      color: #e7e6e6;
    }

    .weixin {
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

    .userForm {
      width: 350px;
      margin: 60px auto;

      .form-item {
        width: 350px;
        display: flex;
        margin-top: 28px;

        label {
          width: 45px;
          text-align: right;
          margin-right: 20px;
        }

        input {
          width: 280px;
          height: 30px;
          border: #c3c3c3;
          border-radius: 5px;
          padding-left: 5px;

          &:focus {
            outline: none;
            box-shadow: 0 0 1px 1px $theme_color;
          }
        }
      }

      .inputMsg {
        display: inherit;
        padding-right: 10px;
        width: 350px;
        height: 0;
        text-align: right;
        font-size: 13px;
        color: #c00101;
        font-family: "Microsoft YaHei", sans-serif;
      }

      .check-item {
        display: flex;

        .checkCodeInput {
          width: 158px;
          margin-right: 20px;
        }

        .checkCodeBtn {
          background-color: $theme_color;
        }
      }

      .buttons-item {
        margin-left: 60px;
        margin-top: 20px;

        .loginBtn {
          width: 280px;
          margin: 0;
          background-color: $theme_color;
        }

        .registerBtn {
          margin-top: 10px;
          margin-left: 0;
          width: 280px;
          background-color: #ffffff;
        }
      }
    }
  }
}
</style>
