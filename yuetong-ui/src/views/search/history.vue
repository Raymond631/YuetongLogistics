<template>
  <div class="container">
    <navigationBar/>
    <div class="content">
      <welcomeHeader/>
      <div class="title">
        <div class="search">
          <el-input type="text" class="search-input" v-model="search" placeholder="请搜索用户"></el-input>
        </div>
        <div class="actions">
          <div class="action1">
            <label>筛选</label>
          </div>
        </div>


      </div>
      <div class="main-form">
        <div class="bill-block" v-for="capacity in capacityList">
          <label class="carrierId" v-text="capacity.carriersID"></label>
          <div class="user">
            <el-avatar type="image" class="image" src="https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg"></el-avatar>
            <div class="user-info">
              <label class="main-font" v-text="'管理员:#'+capacity.fkUserID"></label>
              <label class="third-font" v-text="capacity.phone"></label>
            </div>
          </div>
          <div class="carrier-info">
            <div class="send-info">
              <label v-text="capacity.sendCompany" class="title-font"></label>
              <label v-text="capacity.sendAddress" class="third-font"></label>
              <label v-text="capacity.sendLinkman" class="second-font"></label>
              <label v-text="capacity.sendPhone" class="fourth-font"></label>
            </div>
            <div class="time">
              <label class="third-font">配送时间</label>
              <label v-text="'起: '+capacity.leaverDate" class="third-font"></label>
              <label v-text="'终: '+capacity.receiveDate" class="third-font"></label>
            </div>
            <div class="receive-info">
              <label v-text="capacity.receiveCompany" class="title-font"></label>
              <label v-text="capacity.receiveAddress" class="third-font"></label>
              <label v-text="capacity.receiveLinkman" class="second-font"></label>
              <label v-text="capacity.receivePhone" class="fourth-font"></label>
            </div>
          </div>
          <div class="actions">
            <el-button type="primary" class="infoBtn">查看详情</el-button>
            <el-button type="danger" class="infoBtn">删除</el-button>
          </div>
          <label class="checkInTime" v-text="capacity.checkInTime"></label>
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
import {allData} from "@/api/search/history";

export default defineComponent({
  name: "history",
  data() {
    return {
      "code": 0,
      "capacityList": [
        {
          "carriersID": 0,
          "sendCompany": "",
          "sendAddress": "",
          "sendLinkman": "",
          "sendPhone": "",
          "receiveCompany": "",
          "receiveAddress": 0,
          "receiveLinkman": "",
          "receivePhone": "",
          "leaverDate": "",
          "receiveDate": "",
          "finishedState": 0,
          "insuranceCost": 0,
          "transportCost": 0,
          "otherCost": 0,
          "totalCost": 0,
          "remark": "",
          "fkUserID": 0,
          "checkInTime": "",
          "isDelete": 0,
          "alterTime": ""
        },
      ],
      search: '',
    };
  },
  components: {welcomeHeader, navigationBar, ytTable},
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      //获取所有状态为待调度的数据
      console.log("获取所有状态为待调度的数据")
      allData(0).then((res: any) => {
        console.log(res.rows)
        this.capacityList = res.rows;
      })
    },
    goBack() {
    },
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../assets/style/css/history.scss";
</style>
