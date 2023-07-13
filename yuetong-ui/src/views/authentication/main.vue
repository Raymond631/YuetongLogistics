<template>
  <div class="container">
    <navigationBar />
    <div class="content">
      <welcomeHeader />
      <div class="main">
        <div class="top_pic">
          <el-carousel trigger="click" height="450px">
            <el-carousel-item v-for="item in 6" :key="item"> </el-carousel-item>
          </el-carousel>
        </div>
        <div class="left_info">
          <div class="boss_pic"></div>
          <div class="boss_name">李磊</div>
          <div class="boss_tag">创建者</div>
          <div class="boss_info">软件工程2102班，2023年7月13日</div>
        </div>
        <div class="right_info">
          <div class="company_title">粤通物流系统</div>
          <div class="company_info">
            <span style="margin-left: 30px"
              ><el-icon><UserFilled /></el-icon>
              <span class="company_info_word">5种管理</span></span
            >
            <span style="margin-left: 10%"
              ><el-icon><StarFilled /></el-icon
              ><span class="company_info_word">做大做强</span></span
            >
            <span style="margin-left: 10%"
              ><el-icon><Coffee /></el-icon
              ><span class="company_info_word">咖啡免费</span></span
            >
          </div>
          <div class="company_description">
            <div class="company_description_title">系统描述</div>
            <div class="company_description_content">
              这是一个很有趣的系统，很有趣很有趣qwq,这是一个很有趣的系统，很有趣很有趣qwq这是一个很有趣的系统，很有趣很有趣qwq,这是一个很有趣的系统，很有趣很有趣qwq,这是一个很有趣的系统，很有趣很有趣qwq,这是一个很有趣的系统，很有趣很有趣qwq
            </div>
          </div>
          <div class="company_manange">
            <div class="company_manange_title">pictures</div>
            <div class="company_manange_images">
              <el-scrollbar>
                <div class="scrollbar-flex-content">
                  <el-image
                    class="company_manange_image"
                    :src="url1"
                    fit="fill"
                  />
                  <el-image
                    class="company_manange_image"
                    :src="url1"
                    fit="fill"
                  />
                  <el-image
                    class="company_manange_image"
                    :src="url1"
                    fit="fill"
                  />
                  <el-image
                    class="company_manange_image"
                    :src="url1"
                    fit="fill"
                  />
                  <el-image
                    class="company_manange_image"
                    :src="url1"
                    fit="fill"
                  />
                  <el-image
                    class="company_manange_image"
                    :src="url1"
                    fit="fill"
                  />
                  <el-image
                    class="company_manange_image"
                    :src="url1"
                    fit="fill"
                  />
                </div>
              </el-scrollbar>
            </div>
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
import image1 from "../../assets/images/mainBgi.jpg";

export default defineComponent({
  name: "main",
  data() {
    return {
      data: "",
      url1: image1,
      components: { welcomeHeader, navigationBar, ytTable },
    };
  },
  components: { welcomeHeader, navigationBar, ytTable },
  mounted() {},
  methods: {
    goBack() {},
  },
});
</script>

<style lang="scss" scoped>
@import "../../assets/style/css/main.scss";
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
