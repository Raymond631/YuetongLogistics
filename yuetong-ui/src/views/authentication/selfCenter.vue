<template>
  <div class="container">
    <navigationBar/>
    <div class="content">
      <welcomeHeader/>
      <el-carousel :interval="4000" type="card" height="200px">
        <el-carousel-item v-for="item in 6" :key="item">
          <h3 class="medium">{{ item }}</h3>
        </el-carousel-item>
      </el-carousel>
      <div class="self-info">
        <div class="basic-info">
          <div class="head">
            <el-avatar :src="loginUser.image" class="image"></el-avatar>
          </div>
          <div class="info">
            <el-descriptions :title="'个人详细信息 编号：#'+loginUser.userId" direction="vertical" size="large"
                             :column="3" border style="font-size: 26px">
              <el-descriptions-item label="姓名">{{ loginUser.username }}</el-descriptions-item>
              <el-descriptions-item label="性别">{{ loginUser.sex }}</el-descriptions-item>
              <el-descriptions-item label="权限角色">{{ loginUser.roleId }}</el-descriptions-item>
              <el-descriptions-item label="联系方式">{{ loginUser.phone }}</el-descriptions-item>
              <el-descriptions-item label="邮箱">{{ loginUser.email }}</el-descriptions-item>
              <el-descriptions-item label="登记时间">{{ loginUser.checkInTime }}</el-descriptions-item>
              <el-descriptions-item label="更新时间">{{ loginUser.alterTime }}</el-descriptions-item>
              <el-descriptions-item label="昵称">{{ loginUser.username }}</el-descriptions-item>
              <el-descriptions-item label="密码">{{ loginUser.password }}</el-descriptions-item>
              <el-descriptions-item label="备注">
                <el-tag size="small">{{ loginUser.remark }}</el-tag>
              </el-descriptions-item>
            </el-descriptions>
          </div>
        </div>
        <div class="actionBtns">
          <el-button type="primary" size="large" class="actionBtn">编辑信息</el-button>
          <el-button type="danger" size="large" class="actionBtn">修改密码</el-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import {defineComponent} from "vue";
import navigationBar from "../../components/navigationBar.vue";
import welcomeHeader from "../../components/header.vue";
import ytTable from "../../components/yt-table.vue";

export default defineComponent({
  name: "selfCenter",
  data() {
    return {
      data: "",
      "loginUser": {
        "role": "系统管理员",
        "image": "https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png",
        "roleId": 1,
        "userId": 1,
        "account": "abc",
        "password": "123",
        "username": "hahah",
        "sex": "男",
        "phone": "123",
        "email": "123@qq.com",
        "checkInTime": "2023-07-06 03:13:01",
        "alterTime": "2023-07-06 03:13:11"
      },
    };
  },
  components: {welcomeHeader, navigationBar, ytTable},
  mounted() {
  },
  methods: {
    goBack() {
    },
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../assets/style/css/selfcenter.scss";
.el-carousel {
  --el-carousel-arrow-background: black;
  --el-carousel-arrow-hover-background: black;
}

.el-carousel__item:nth-child(3) {
  border-radius: 20px;
  background-image: url("../../assets/images/item1.jpg");
  background-size: 100% 100%;
}

.el-carousel__item:nth-child(4) {
  border-radius: 20px;
  background-image: url("../../assets/images/item2.jpg");
  background-size: 100% 100%;
}

.el-carousel__item:nth-child(5) {
  border-radius: 20px;
  background-image: url("../../assets/images/item3.jpg");
  background-size: 100% 100%;
}

.el-carousel__item:nth-child(6) {
  border-radius: 20px;
  background-image: url("../../assets/images/truck.jpg");
  background-size: 100% 100%;
}

.el-carousel__item:nth-child(7) {
  border-radius: 20px;
  background-image: url("../../assets/images/item4.jpg");
  background-size: 100% 100%;
}

.el-carousel__item:nth-child(8) {
  border-radius: 20px;
  background-image: url("../../assets/images/item5.jpg");
  background-size: 100% 100%;
}

</style>
