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
        <div class="bill-block" v-for="(reception,index) in receptionList">
          <label class="carrierId" v-text="reception.carrier.carriersId"></label>
          <div class="driver">
            <el-avatar type="image" class="image"
                       src="https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg"></el-avatar>
            <div class="driver-info">
              <el-tag class="main-font driver-tag"
                      v-text="'驾驶员#'+reception.driver.driverId +' '+reception.driver.name"></el-tag>
              <label class="third-font" v-text="reception.driver.phone"></label>
            </div>
          </div>
          <div class="carrier-info">
            <div class="send-info">
              <label v-text="reception.carrier.sendCompany" class="title-font"></label>
              <label v-text="reception.carrier.sendAddress" class="third-font"></label>
              <label v-text="reception.carrier.sendLinkman" class="second-font"></label>
              <label v-text="reception.carrier.sendPhone" class="fourth-font"></label>
            </div>
            <div class="time">
              <label class="third-font">配送时间</label>
              <label v-text="'起: '+reception.carrier.leaverDate" class="third-font"></label>
              <label v-text="'终: '+reception.carrier.receiveDate" class="third-font"></label>
            </div>
            <div class="receive-info">
              <label v-text="reception.carrier.receiveCompany" class="title-font"></label>
              <label v-text="reception.carrier.receiveAddress" class="third-font"></label>
              <label v-text="reception.carrier.receiveLinkman" class="second-font"></label>
              <label v-text="reception.carrier.receivePhone" class="fourth-font"></label>
            </div>
          </div>
          <div class="manager-info">
            <label class="main-font manager-id" v-text="'处理管理员: '+reception.carrier.account"></label>
            <div class="actions">
              <el-button type="primary" class="infoBtn" @click="receptCarrierBtnClick(index)">接收</el-button>
              <el-button type="danger" class="infoBtn">删除</el-button>
            </div>
          </div>
          <div class="state">
            <el-tag size="large" type="warning">未接收</el-tag>
            <label v-text="reception.carrier.checkInTime"></label>
          </div>
        </div>
      </div>
      <div class="mask" v-if="showMask"></div>
      <div class="receptDialog" v-if="showReceptDialog">
        <div class="form-title">
          <label>接收承运单</label>
          <el-button class="closeBtn" type="danger" @click="closeForm">关闭</el-button>
        </div>
        <div class="form">
          <el-descriptions title="承运单信息" size="large" column="3" border>
            <el-descriptions-item label="承运单编号">{{ receptCarrier.carriersId }}</el-descriptions-item>
            <el-descriptions-item label="登记时间">{{ receptCarrier.checkInTime }}</el-descriptions-item>
            <el-descriptions-item label="发货公司">{{ receptCarrier.sendCompany }}</el-descriptions-item>
            <el-descriptions-item label="发货地址">{{ receptCarrier.sendAddress }}</el-descriptions-item>
            <el-descriptions-item label="收货公司">{{ receptCarrier.receiveCompany }}</el-descriptions-item>
            <el-descriptions-item label="收货地址">{{ receptCarrier.receiveAddress }}</el-descriptions-item>
          </el-descriptions>
        </div>
        <div class="actions">
          <el-button type="primary" size="large" @click="confirmReceptedBtnClick">接收</el-button>
          <el-button type="info" size="large" @click="closeForm">取消</el-button>
        </div>
      </div>

    </div>
  </div>
</template>

<script lang="ts">
import {defineComponent} from "vue";
import navigationBar from "../../../components/navigationBar.vue";
import welcomeHeader from "../../../components/header.vue";
import ytTable from "../../../components/yt-table.vue";
import {allReceptionCarriers, confirmReceptedCarriers} from "@/api/carrier/bill/reception";

export default defineComponent({
  name: "reception",
  data() {
    return {
      search: '',
      "receptionList": [{
        "carrier": {
          "carriersId": 0,
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
          "account": 0,
          "checkInTime": "",
          "alterTime": ""
        },
        "driver": {
          "driverId": 1,
          "name": "张三",
          "sex": "男",
          "birth": "1988-10-01",
          "phone": "12345678900",
          "idCard": "123456789123456789",
          "fkTeamId": 1,
          "state": "Working",
          "remark": "labore tempor exercitation pariatur deserunt",
          "checkInTime": "2023-07-12 14:53:23",
          "alterTime": "2023-07-12 14:53:23"
        }
      }],
      showMask: false,
      showReceptDialog: false,
      receptCarrier: {
        "carriersId": 0,
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
        "account": 0,
        "checkInTime": "",
        "alterTime": ""
      },
    };
  },
  components: {welcomeHeader, navigationBar, ytTable},
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      allReceptionCarriers(1, 10).then((res: any) => {
        this.receptionList = res.data.list;
        console.log(this.receptionList)
      })
    },
    //点击接受按钮
    receptCarrierBtnClick(index: number) {
      this.receptCarrier = this.receptionList[index].carrier;
      this.showMask = true;
      this.showReceptDialog = true;
    },
    confirmReceptedBtnClick() {
      confirmReceptedCarriers(this.receptCarrier.carriersId).then((res: any) => {
        console.log("接收成功",res)
        this.closeForm();
      })
    },
    //关闭接收对话框的遮罩层
    closeForm() {
      this.showMask = false;
      this.showReceptDialog = false;
    },
    goBack() {
    },
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../../assets/style/css/reception.scss";
</style>
