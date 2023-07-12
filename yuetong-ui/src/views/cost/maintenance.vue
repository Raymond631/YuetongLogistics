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
        <div class="bill-block" v-for="(carrier,index) in maintainCarrierList">
          <label class="carrierId" v-text="carrier.carriersID"></label>
          <div class="driver">
            <label class="main-font">承运单</label>
            <div class="driver-info">
              <el-button type="primary" size="large" class="putCostBtn" @click="putCostBtnClick(index)">成本录入</el-button>
            </div>
          </div>
          <div class="carrier-info">
            <div class="send-info">
              <label v-text="carrier.sendCompany" class="title-font"></label>
              <label v-text="carrier.sendAddress" class="third-font"></label>
              <label v-text="carrier.sendLinkman" class="second-font"></label>
              <label v-text="carrier.sendPhone" class="fourth-font"></label>
            </div>
            <div class="time">
              <label class="third-font">配送时间</label>
              <label v-text="'起: '+carrier.leaverDate" class="third-font"></label>
              <label v-text="'终: '+carrier.receiveDate" class="third-font"></label>
            </div>
            <div class="receive-info">
              <label v-text="carrier.receiveCompany" class="title-font"></label>
              <label v-text="carrier.receiveAddress" class="third-font"></label>
              <label v-text="carrier.receiveLinkman" class="second-font"></label>
              <label v-text="carrier.receivePhone" class="fourth-font"></label>
            </div>
          </div>
          <div class="manager-info">
            <label class="main-font manager-id" v-text="'处理管理员编号: #'+carrier.fkUserID"></label>
            <div class="actions">
              <el-button type="primary" class="infoBtn" @click="detailsBtnClick(index)">详细信息</el-button>
              <el-button type="danger" class="infoBtn">删除</el-button>
            </div>
          </div>
          <div class="state">
            <el-tag size="large">待录入</el-tag>
            <label v-text="carrier.checkInTime"></label>
          </div>
        </div>
      </div>
      <div class="mask" v-if="showMask"></div>
      <div class="putCostForm" v-if="showMaintainForm">
        <div class="form-title">
          <label>录入成本</label>
          <el-button class="closeBtn" type="danger" @click="closeForm">关闭</el-button>
        </div>
        <el-descriptions title="承运单信息" size="large" column="3" border>
          <el-descriptions-item label="承运单编号">{{ currentCarrier.carriersID }}</el-descriptions-item>
          <el-descriptions-item label="登记时间">{{ currentCarrier.checkInTime }}</el-descriptions-item>
          <el-descriptions-item label="发货公司">{{ currentCarrier.sendCompany }}</el-descriptions-item>
          <el-descriptions-item label="发货地址">{{ currentCarrier.sendAddress }}</el-descriptions-item>
          <el-descriptions-item label="收货公司">{{ currentCarrier.receiveCompany }}</el-descriptions-item>
          <el-descriptions-item label="收货地址">{{ currentCarrier.receiveAddress }}</el-descriptions-item>
        </el-descriptions>
        <div class="form">
          <div class="form-item">
            <label></label>
            <el-input class="form-input"></el-input>
          </div>
          <div class="form-item">
            <label></label>
            <el-input class="form-input"></el-input>
          </div>
          <div class="form-item">
            <label></label>
            <el-input class="form-input"></el-input>
          </div>
          <div class="form-item">
            <label></label>
            <el-input class="form-input"></el-input>
          </div>

        </div>
        <div class="actions">
          <el-button type="primary" size="large">接收</el-button>
          <el-button type="info" size="large">取消</el-button>
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
import {allMaintainCarriers} from "@/api/cost/maintenance";

export default defineComponent({
  name: "maintenance",
  data() {
    return {
      data: "",
      search: '',
      showMask: false,
      showMaintainForm: false,
      showDetailsForm: false,
      "maintainCarrierList": [{
        "carriersID": 0,
        "sendCompany": "",
        "sendAddress": "",
        "sendLinkman": "",
        "sendPhone": "",
        "receiveCompany": "",
        "receiveAddress": null,
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
      }],
      currentCarrier: {},
      putItem:{
        "carriersID": 13,
        "truckID": 1,
        "number": "湘A·12345",
        "teamID": 1,
        "teamName": "测试",
        "driverID": 1,
        "name": "李",
        "salesmanID": 2,
        "username": "zhangsan",
        "income": 999,
        "expenditure": 99,
        "insuranceCost": 9,
        "transportCost": 9,
        "otherIncomeCost": 9,
        "oilCost": 9,
        "fine": 9,
        "toll": 9,
        "otherExpenditureCost": 0,
        "receiveDate": "2005-05-28T16:00:00.000+00:00"
      },
    };
  },
  components: {welcomeHeader, navigationBar, ytTable},
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      //获取所有已签收、待结算的承运单
      allMaintainCarriers(3).then((res: any) => {
        console.log(res.data);
        this.maintainCarrierList = res.data;
      })
    },
    //点击录入成本按钮
    putCostBtnClick(index: any) {
      this.currentCarrier = this.maintainCarrierList[index];
      this.showMask = true;
      this.showMaintainForm = true;
    },
    //点击详细信息按钮
    detailsBtnClick(index: any) {

    },
    closeForm() {
      this.showMask = false;
      this.showMaintainForm = false;
      this.showDetailsForm = false;
    },
    goBack() {
    },
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../assets/style/css/maintence.scss";
</style>
