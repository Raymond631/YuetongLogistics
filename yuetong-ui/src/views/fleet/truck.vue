<template>

  <div class="container">
    <navigationBar/>
    <div class="content">
      <welcomeHeader />
      <el-descriptions title="用户信息">
        <el-descriptions-item label="车辆编号">#350918</el-descriptions-item>
        <el-descriptions-item label="车牌号">CSU999999</el-descriptions-item>
        <el-descriptions-item label="车型">18100000000</el-descriptions-item>
        <el-descriptions-item label="购买时间">2019/08/19</el-descriptions-item>
        <el-descriptions-item label="备注">
          <el-tag size="small">学校</el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="联系地址">江苏省苏州市吴中区吴中大道 1188 号</el-descriptions-item>
      </el-descriptions>
    </div>
  </div>
</template>

<script>
import navigationBar from "../../components/navigationBar.vue";
import welcomeHeader from "../../components/header.vue";
import ytTable from "../../components/yt-table.vue";

export default {
  name: "truck",
  components: {welcomeHeader, navigationBar, ytTable},



}
</script>

<style scoped lang="scss">
.container {
  .content {
    margin-left: $Mleft;
    height: $max_height;
    //background-color: $back_color;
    background-color: #f6f6f6;
  }
}
</style>
