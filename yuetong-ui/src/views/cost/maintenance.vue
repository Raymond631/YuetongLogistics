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
        <div class="bill-block" v-for="(item,index) in maintainItemList">
          <label class="carrierId" v-text="item.carrier.carriersId"></label>
          <div class="driver">
            <label class="main-font">承运单</label>
            <div class="driver-info">
              <el-button type="primary" size="large" class="putCostBtn" @click="putCostBtnClick(index)">成本录入</el-button>
            </div>
          </div>
          <div class="carrier-info">
            <div class="send-info">
              <label v-text="item.carrier.sendCompany" class="title-font"></label>
              <label v-text="item.carrier.sendAddress" class="third-font"></label>
              <label v-text="item.carrier.sendLinkman" class="second-font"></label>
              <label v-text="item.carrier.sendPhone" class="fourth-font"></label>
            </div>
            <div class="time">
              <label class="third-font">配送时间</label>
              <label v-text="'起: '+item.carrier.leaverDate" class="third-font"></label>
              <label v-text="'终: '+item.carrier.receiveDate" class="third-font"></label>
            </div>
            <div class="receive-info">
              <label v-text="item.carrier.receiveCompany" class="title-font"></label>
              <label v-text="item.carrier.receiveAddress" class="third-font"></label>
              <label v-text="item.carrier.receiveLinkman" class="second-font"></label>
              <label v-text="item.carrier.receivePhone" class="fourth-font"></label>
            </div>
          </div>
          <div class="manager-info">
            <label class="main-font manager-id" v-text="'处理管理员编号: #'+item.carrier.account"></label>
            <div class="actions">
              <el-button type="primary" class="infoBtn" @click="detailsBtnClick(index)">详细信息</el-button>
              <el-button type="danger" class="infoBtn">删除</el-button>
            </div>
          </div>
          <div class="state">
            <el-tag size="large">待录入</el-tag>
            <label v-text="item.carrier.checkInTime"></label>
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
          <el-descriptions-item label="承运单编号">{{ currentItem.carrier.carriersId }}</el-descriptions-item>
          <el-descriptions-item label="登记时间">{{ currentItem.carrier.checkInTime }}</el-descriptions-item>
          <el-descriptions-item label="发货公司">{{ currentItem.carrier.sendCompany }}</el-descriptions-item>
          <el-descriptions-item label="发货地址">{{ currentItem.carrier.sendAddress }}</el-descriptions-item>
          <el-descriptions-item label="收货公司">{{ currentItem.carrier.receiveCompany }}</el-descriptions-item>
          <el-descriptions-item label="收货地址">{{ currentItem.carrier.receiveAddress }}</el-descriptions-item>
        </el-descriptions>
        <div class="form">
          <div class="flex-item">
            <div class="form-item">
              <label>油费</label>
              <el-input type="text" class="form-input" v-model="putItem.oilCost"></el-input>
            </div>
            <div class="form-item">
              <label>通行费</label>
              <el-input type="text" class="form-input" v-model="putItem.toll"></el-input>
            </div>
          </div>
          <div class="flex-item">
            <div class="form-item">
              <label>罚款</label>
              <el-input type="text" class="form-input" v-model="putItem.fine"></el-input>
            </div>
            <div class="form-item">
              <label>其他支出</label>
              <el-input type="text" class="form-input" v-model="putItem.otherCost"></el-input>
            </div>
          </div>
        </div>
        <div class="actionBtns">
          <el-button type="primary" class="actionBtn" size="large" @click="confirmBtnClick">录入</el-button>
          <el-button type="info" class="actionBtn" size="large" @click="resetBtnClick">重置</el-button>
        </div>
      </div>
      <div class="details" v-if="showDetailsForm">
        <div class="form-title">
          <label>承运任务详情</label>
          <el-button type="danger" class="closeBtn" @click="closeForm">关闭</el-button>
        </div>
        <template class="form-info">
          <el-descriptions :title="'承运单列表 编号：#'+currentItem.carrier.carriersId" direction="vertical" size="large"
                           :column="5" border>
            <el-descriptions-item label="发货单位">{{ currentItem.carrier.sendCompany }}</el-descriptions-item>
            <el-descriptions-item label="发货地址">{{ currentItem.carrier.sendAddress }}</el-descriptions-item>
            <el-descriptions-item label="发货人">{{ currentItem.carrier.sendLinkman }}</el-descriptions-item>
            <el-descriptions-item label="联系电话">{{ currentItem.carrier.sendPhone }}</el-descriptions-item>
            <el-descriptions-item label="收货单位">{{ currentItem.carrier.receiveCompany }}</el-descriptions-item>
            <el-descriptions-item label="收获地址">{{ currentItem.carrier.receiveAddress }}</el-descriptions-item>
            <el-descriptions-item label="收货人">{{ currentItem.carrier.receiveLinkman }}</el-descriptions-item>
            <el-descriptions-item label="联系方式">{{ currentItem.carrier.receivePhone }}</el-descriptions-item>
            <el-descriptions-item label="出发时间">{{ currentItem.carrier.leaverDate }}</el-descriptions-item>
            <el-descriptions-item label="送达时间">{{ currentItem.carrier.receiveDate }}</el-descriptions-item>
            <el-descriptions-item label="保险费用">{{ currentItem.carrier.insuranceCost }}</el-descriptions-item>
            <el-descriptions-item label="运输费用">{{ currentItem.carrier.transportCost }}</el-descriptions-item>
            <el-descriptions-item label="总费用">{{ currentItem.carrier.totalCost }}</el-descriptions-item>
            <el-descriptions-item label="备注">
              <el-tag size="small">{{ currentItem.carrier.remark }}</el-tag>
            </el-descriptions-item>
          </el-descriptions>
<!--          <label class="goods-title">货物信息</label>-->
<!--          <el-table :data="currentItem.carrier.goodsList" style="font-size:16px;">-->
<!--            <el-table-column prop="goodsName" label="编号" width="60px"></el-table-column>-->
<!--            <el-table-column prop="amount" label="车牌" width="150px"></el-table-column>-->
<!--            <el-table-column prop="weight" label="车型"></el-table-column>-->
<!--            <el-table-column prop="volume" label="吨位"></el-table-column>-->
<!--          </el-table>-->
          <el-descriptions :title="'驾驶员信息 编号：#'+currentItem.driver.driverId" direction="vertical" size="large"
                           :column="5" border>
            <el-descriptions-item label="姓名">{{ currentItem.driver.name }}</el-descriptions-item>
            <el-descriptions-item label="性别">{{ currentItem.driver.sex }}</el-descriptions-item>
            <el-descriptions-item label="生日">{{ currentItem.driver.birth }}</el-descriptions-item>
            <el-descriptions-item label="联系方式">{{ currentItem.driver.phone }}</el-descriptions-item>
            <el-descriptions-item label="身份证号">{{ currentItem.driver.idCard }}</el-descriptions-item>
            <el-descriptions-item label="所属车队编号">{{ currentItem.driver.fkTeamID }}</el-descriptions-item>
            <el-descriptions-item label="状态">{{ currentItem.driver.state }}</el-descriptions-item>
            <el-descriptions-item label="登记时间">{{ currentItem.driver.checkInTime }}</el-descriptions-item>
            <el-descriptions-item label="是否删除">{{ currentItem.driver.isDelete }}</el-descriptions-item>
            <el-descriptions-item label="备注">
              <el-tag size="small">{{ currentItem.driver.remark }}</el-tag>
            </el-descriptions-item>
          </el-descriptions>
        </template>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import {defineComponent} from "vue";
import navigationBar from "../../components/navigationBar.vue";
import welcomeHeader from "../../components/header.vue";
import ytTable from "../../components/yt-table.vue";
import {allMaintainCarriers, confirmPutCarrier} from "@/api/cost/maintenance";

export default defineComponent({
  name: "maintenance",
  data() {
    return {
      data: "",
      search: '',
      showMask: false,
      showMaintainForm: false,
      showDetailsForm: false,
      "maintainItemList": [{
        "carrier": {
          "carriersId": 3,
          "sendCompany": "qui",
          "sendAddress": "云南省佳木斯市雁江区",
          "sendLinkman": "elit ut sunt",
          "sendPhone": "19840510269",
          "receiveCompany": "ad Ut",
          "receiveAddress": "四川省三沙市景谷傣族彝族自治县",
          "receiveLinkman": "ut",
          "receivePhone": "13138768380",
          "leaverDate": "1988-01-06",
          "receiveDate": "2023-07-12 10:00:38",
          "finishedState": 2,
          "insuranceCost": 9.0,
          "transportCost": 81.0,
          "otherCost": null,
          "totalCost": null,
          "remark": "labore tempor exercitation pariatur deserunt",
          "account": "abc",
          "checkInTime": "2023-07-12 06:11:28",
          "alterTime": "2023-07-12 06:11:28",
          "goodsList": null
        },
        "scheduling": {
          "schedulingId": 1,
          "startTime": "2023-07-12 08:19:21",
          "fkCarriersId": 3,
          "fkTruckId": 1,
          "oilCost": 0.0,
          "toll": 0.0,
          "fine": 0.0,
          "otherCost": 0.0,
          "totalCost": 0.0,
          "account": "abc",
          "checkInTime": "2023-07-12 06:11:28",
          "alterTime": "2023-07-12 06:11:28"
        },
        "truck": {
          "truckId": 1,
          "number": "湘A12345",
          "buyDate": "2022-10-01",
          "truckType": "大货车",
          "tonnage": 20,
          "fkTeamId": 1,
          "state": "Free",
          "remark": "labore tempor exercitation pariatur deserunt",
          "checkInTime": "2023-07-12 06:11:28",
          "alterTime": "2023-07-12 06:11:28"
        },
        "driver": {
          "driverId": 1,
          "name": "张三",
          "sex": "男",
          "birth": "1988-10-01",
          "phone": "12345678900",
          "idCard": "123456789123456789",
          "fkTeamId": 1,
          "state": "Free",
          "remark": "labore tempor exercitation pariatur deserunt",
          "checkInTime": "2023-07-12 06:11:28",
          "alterTime": "2023-07-12 06:11:28"
        }
      }],
      currentItem: {
        "carrier": {
          "carriersId": 3,
          "sendCompany": "qui",
          "sendAddress": "云南省佳木斯市雁江区",
          "sendLinkman": "elit ut sunt",
          "sendPhone": "19840510269",
          "receiveCompany": "ad Ut",
          "receiveAddress": "四川省三沙市景谷傣族彝族自治县",
          "receiveLinkman": "ut",
          "receivePhone": "13138768380",
          "leaverDate": "1988-01-06",
          "receiveDate": "2023-07-12 10:00:38",
          "finishedState": 2,
          "insuranceCost": 9.0,
          "transportCost": 81.0,
          "otherCost": null,
          "totalCost": null,
          "remark": "labore tempor exercitation pariatur deserunt",
          "account": "abc",
          "checkInTime": "2023-07-12 06:11:28",
          "alterTime": "2023-07-12 06:11:28",
          "goodsList": null
        },
        "scheduling": {
          "schedulingId": 1,
          "startTime": "2023-07-12 08:19:21",
          "fkCarriersId": 3,
          "fkTruckId": 1,
          "oilCost": 0.0,
          "toll": 0.0,
          "fine": 0.0,
          "otherCost": 0.0,
          "totalCost": 0.0,
          "account": "abc",
          "checkInTime": "2023-07-12 06:11:28",
          "alterTime": "2023-07-12 06:11:28"
        },
        "truck": {
          "truckId": 1,
          "number": "湘A12345",
          "buyDate": "2022-10-01",
          "truckType": "大货车",
          "tonnage": 20,
          "fkTeamId": 1,
          "state": "Free",
          "remark": "labore tempor exercitation pariatur deserunt",
          "checkInTime": "2023-07-12 06:11:28",
          "alterTime": "2023-07-12 06:11:28"
        },
        "driver": {
          "driverId": 1,
          "name": "张三",
          "sex": "男",
          "birth": "1988-10-01",
          "phone": "12345678900",
          "idCard": "123456789123456789",
          "fkTeamId": 1,
          "state": "Free",
          "remark": "labore tempor exercitation pariatur deserunt",
          "checkInTime": "2023-07-12 06:11:28",
          "alterTime": "2023-07-12 06:11:28"
        }
      },
      putItem: {
        "carrierId": 1,
        "oilCost": 100.01,
        "toll": 100.01,
        "fine": 100.01,
        "otherCost": 100.01
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
      allMaintainCarriers(1, 10).then((res: any) => {
        console.log(res.data.list);
        this.maintainItemList = res.data.list;
      })
    },
    //点击录入成本按钮
    putCostBtnClick(index: any) {
      this.currentItem = this.maintainItemList[index];
      this.putItem.carrierId = this.currentItem.carrier.carriersId;
      this.showMask = true;
      this.showMaintainForm = true;
    },
    //点击详细信息按钮
    detailsBtnClick(index: any) {
      this.currentItem = this.maintainItemList[index];
      this.showMask = true;
      this.showDetailsForm = true;
    },
    closeForm() {
      this.showMask = false;
      this.showMaintainForm = false;
      this.showDetailsForm = false;
    },
    goBack() {
    },
    //点击form表单中的录入按钮
    confirmBtnClick() {
      confirmPutCarrier(this.putItem).then((res)=>{
        console.log("录入成功",res)
        alert("录入成功")
        this.closeForm();
        this.ready();
      })

      this.closeForm();
    },
    resetBtnClick() {

    }

  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../assets/style/css/maintence.scss";
</style>
