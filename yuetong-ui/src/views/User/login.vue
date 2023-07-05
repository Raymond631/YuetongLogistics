<template>
  login
  <el-button type="primary" @click="send">tijiao</el-button>
  <el-button type="info" @click="localStorage">tijiao</el-button>
</template>

<script lang="ts">
import { login } from "../../api/User/login";
import storage from "../../utils/storage";

export default {
  name: "login",
  data() {
    return {
      user: {
        account: 1,
        password: 1,
      },
    };
  },
  methods: {
    send() {
      login(this.user)
        .then((res) => {
          console.log(res);
          storage.set("token", res.data.token);
        })
        .catch((err) => {
          //请求失败，做相应处理
          console.log("请求错误");
        });
    },
    localStorage() {
      let token: any = [
        { name: 1, pass: 2 },
        { name: 2, pass: 2 },
      ];
      storage.set("token", token);
    },
  },
};
</script>
