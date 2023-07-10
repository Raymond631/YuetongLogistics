<template>
  <div class="container">
    <navigationBar />
    <div class="content">
      <welcomeHeader />
      <el-button type="primary" @click="userLogin">login</el-button>
      <ytTable class="table" :tableInfo="data1" :tableContent="data2" :tableHeight="700" />
    </div>
  </div>
</template>
<script lang="ts">
import navigationBar from "../components/navigationBar.vue";
import welcomeHeader from "../components/header.vue";
import ytTable from "../components/yt-table.vue";
import { defineComponent } from "vue";
import { test1 } from "../api/test";
import { login } from "../api/authentication/login";

export default defineComponent({
  name: "about",
  data() {
    return {
      data1: {
        number: 4,
        select:true,
        action: true,
        tag:false,
        columns: [
          { label: "姓名", content: "name" },
          { label: "联系方式", content: "qq" },
          { label: "爱好", content: "hobby" },
          { label: "对象", content: "lover" },
        ],
        actions: {
          specific:false,
          edit: true,
          delete: true,
        },
      },
      data2: [
        {
          id: 1,
          name: "yueyue",
          qq: "1213131231",
          hobby: "yundong",
          lover: "null",
        },
      ],
      user: {
        account: 'abc',
        password: '123',
      },
    };
  },

  components: { welcomeHeader, navigationBar, ytTable },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      this.data2.push(
        {
          id: 2,
          name: "ll",
          qq: "54647erew",
          hobby: "dagong",
          lover: "null",
        },
        {
          id: 3,
          name: "ningning",
          qq: "4355hrdxfge",
          hobby: "qwq",
          lover: "nudefine",
        },
        {
          id: 4,
          name: "pengcheng",
          qq: "1213131231",
          hobby: "yundong",
          lover: "null",
        },
      );
    },
    confirm() {
      test1()
        .then((res) => {
          console.log("success");
          console.log(res)
        })
        .catch((err) => {
          console.log("defeat");
        });
    },
    userLogin() {
      login(this.user)
        .then((res:any) => {
          console.log("success");
          console.log(res)
        })
        .catch((err:any) => {
          console.log(err);
        });
    },
    menuSelect(index: string) {},
  },
});
</script>

<style lang="scss" scoped="scoped">
.container {
  .content {
    margin-left: $Mleft;
    height: $max_height;
    background-color: $back_color;
    .table {
      border-radius: 20px;
      width: 1500px;
      margin-top: 20px;
      margin-left: 40px;
    }
  }
}
</style>

../api/test
