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
        <div class="bill-block" v-for="(history,index) in historyList">
          <label class="carrierId" v-text="history.carrier.carriersId"></label>
          <div class="user">
            <el-avatar type="image" class="image"
                       src="https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg"></el-avatar>
            <div class="driver-info">
              <el-tag class="main-font driver-tag"
                      v-text="'驾驶员#'+history.driver.driverId +' '+history.driver.name"></el-tag>
              <label class="third-font" v-text="history.driver.phone"></label>
            </div>
          </div>
          <div class="carrier-info">
            <div class="send-info">
              <label v-text="history.carrier.sendCompany" class="title-font"></label>
              <label v-text="history.carrier.sendAddress" class="third-font"></label>
              <label v-text="history.carrier.sendLinkman" class="second-font"></label>
              <label v-text="history.carrier.sendPhone" class="fourth-font"></label>
            </div>
            <div class="time">
              <label class="third-font">配送时间</label>
              <label v-text="'起: '+history.carrier.leaverDate" class="third-font"></label>
              <label v-text="'终: '+history.carrier.receiveDate" class="third-font"></label>
            </div>
            <div class="receive-info">
              <label v-text="history.carrier.receiveCompany" class="title-font"></label>
              <label v-text="history.carrier.receiveAddress" class="third-font"></label>
              <label v-text="history.carrier.receiveLinkman" class="second-font"></label>
              <label v-text="history.carrier.receivePhone" class="fourth-font"></label>
            </div>
          </div>
          <div class="manager-info">
            <label class="main-font manager-id" v-text="'处理管理员编号: #'+history.carrier.account"></label>
            <div class="actions">
              <el-button type="primary" class="infoBtn" @click="forDetails(index)">查看详情</el-button>
              <el-button type="danger" class="infoBtn">删除</el-button>
            </div>
          </div>
          <div class="state">
            <el-tag size="large" style="font-size: 18px;" type="success">已结算</el-tag>
            <label v-text="history.carrier.checkInTime"></label>
          </div>
        </div>
      </div>

      <div class="mask" v-if="showMask"></div>
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
<!--            <el-table-column prop="goodsName" label="货物名称" width="180px"></el-table-column>-->
<!--            <el-table-column prop="amount" label="货物数量" width="100px"></el-table-column>-->
<!--            <el-table-column prop="weight" label="货物重量"></el-table-column>-->
<!--            <el-table-column prop="volume" label="货物体积"></el-table-column>-->
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
          <el-descriptions :title="'承运任务信息 编号：#'+currentItem.scheduling.schedulingId" direction="vertical"
                           size="large" :column="5" border>
            <el-descriptions-item label="出发时间">{{ currentItem.scheduling.startTime }}</el-descriptions-item>
            <el-descriptions-item label="油费">{{ currentItem.scheduling.oilCost }}</el-descriptions-item>
            <el-descriptions-item label="过路费">{{ currentItem.scheduling.toll }}</el-descriptions-item>
            <el-descriptions-item label="罚款">{{ currentItem.scheduling.fine }}</el-descriptions-item>
            <el-descriptions-item label="其他费用">{{ currentItem.scheduling.otherCost }}</el-descriptions-item>
            <el-descriptions-item label="总费用">{{ currentItem.scheduling.totalCost }}</el-descriptions-item>
            <el-descriptions-item label="登记时间">{{ currentItem.scheduling.checkInTime }}</el-descriptions-item>
            <el-descriptions-item label="是否删除">{{ currentItem.scheduling.isDelete }}</el-descriptions-item>
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
import {allHistoryCarriers} from "@/api/search/history";

export default defineComponent({
  name: "history",
  data() {
    return {
      "code": 0,
      size: '',
      "historyList": [
        {
          "carrier": {
            "carriersId": 0,
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
            "account": 0,
            "checkInTime": "",
            "isDelete": 0,
            "alterTime": "",
            "goodsList": [
              {
                "goodsName": "当叫八存并",
                "amount": 38,
                "weight": 24.12,
                "volume": 11.34
              },
              {
                "goodsName": "者家头达",
                "amount": 24,
                "weight": 92.12,
                "volume": 53.34
              }
            ]
          },
          "driver":
              {
                "driverId": 0,
                "name": "",
                "sex": 0,
                "birth": null,
                "phone": "",
                "idCard": "",
                "fkTeamID": 0,
                "state": 0,
                "remark": null,
                "checkInTime": "",
                "isDelete": 0,
                "alterTime": ""
              },
          "scheduling":
              {
                "schedulingId": 0,
                "startTime": null,
                "fkCarriersID": 0,
                "fkTruckID": 0,
                "oilCost": 0.0,
                "toll": 0.0,
                "fine": 0.0,
                "otherCost": 0.0,
                "totalCost": 0.0,
                "fkUserID": 0,
                "remark": 0.0,
                "checkInTime": null,
                "isDelete": 0,
                "alterTime": ""
              }
        },
      ],
      currentItemIndex: 0,
      currentItem: {},
      showMask: false,
      showDetailsForm: false,
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
      console.log("获取所有历史承运任务数据")
      allHistoryCarriers(1, 10).then((res: any) => {
        this.historyList = res.data.list;
        console.log("historyList:", this.historyList)
      })
    },
    forDetails(index: number) {
      this.showMask = true;
      this.showDetailsForm = true;
      this.currentItemIndex = index;
      this.currentItem = this.historyList[index];
      console.log("currentItem:", this.currentItem)
    },
    closeForm() {
      this.showMask = false;
      this.showDetailsForm = false;
    },
    goBack() {
    },
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../assets/style/css/history.scss";
</style>
