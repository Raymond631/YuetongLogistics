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
        <div class="bill-block" v-for="(carrier,index) in schedulingCarriersList">
          <div class="driver">
            <label class="main-font">驾驶员</label>
            <div class="driver-info">
              <el-button type="primary" size="large" class="choDriBtn" @click="schedulingCarrier(index)">调度任务</el-button>
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
            <label class="main-font manager-id" v-text="'承运业务员编号: #'+carrier.fkUserID"></label>
            <div class="actions">
              <el-button type="primary" class="infoBtn" @click="forDetails(index)">查看详情</el-button>
              <el-button type="danger" class="infoBtn">删除</el-button>
            </div>
          </div>
          <div class="state">
            <el-tag size="large">未调度</el-tag>
            <label v-text="carrier.checkInTime"></label>
          </div>

        </div>
      </div>
      <div class="mask" v-if="showMask"></div>
      <div class="chooseDriverForm" v-if="showScheForm">
        <div class="form">
          <div class="form-title">
            <label>调度承运任务</label>
            <el-button type="danger" class="closeBtn" @click="closeForm">关闭</el-button>
          </div>
          <div class="form-info">
            <div class="flex-item">
              <div class="form-item">
                <label>出发时间</label>
                <el-date-picker v-model="insertItem.startTime" type="date" style="width: 250px;" placeholder="选择日期" class="form-input">
                </el-date-picker>
              </div>
              <div class="form-item">
                <label>油费</label>
                <el-input class="form-input"></el-input>
              </div>
            </div>
            <div class="flex-item">
              <div class="form-item">
                <label>罚款</label>
                <el-input class="form-input"></el-input>
              </div>
              <div class="form-item">
                <label>其他消费</label>
                <el-input class="form-input"></el-input>
              </div>
            </div>
            <div class="flex-item">
              <div class="form-item">
                <label>总费用</label>
                <el-input class="form-input"></el-input>
              </div>
              <div class="form-item">
                <label>备注</label>
                <el-input class="form-input"></el-input>
              </div>
            </div>
            <div class="alreadyChosenForm">
              <el-descriptions class="descriptions" title="已选驾驶员&车辆" :column="3" size="large" border>
                <el-descriptions-item label="驾驶员" width="100px">{{ chosenDriverTruck.driver[0].name }}</el-descriptions-item>
                <el-descriptions-item label="联系方式" width="100px">{{ chosenDriverTruck.driver[0].phone }}</el-descriptions-item>
                <el-descriptions-item label="生日" width="100px">{{ chosenDriverTruck.driver[0].birth }}</el-descriptions-item>
                <el-descriptions-item label="车型">{{ chosenDriverTruck.truck.type }}</el-descriptions-item>
                <el-descriptions-item label="车牌号"><el-tag size="small">{{ chosenDriverTruck.truck.number }}</el-tag></el-descriptions-item>
                <el-descriptions-item label="登记时间">{{ chosenDriverTruck.truck.checkInTime }}</el-descriptions-item>
              </el-descriptions>
            </div>
            <div class="actions">
              <el-button type="primary">提交</el-button>
              <el-button type="info">重置</el-button>
            </div>
          </div>
          <el-table :data="freeTrucksDriverList" :style="'font-size: '+font_size">
            <el-table-column prop="driver[0].name" label="驾驶员姓名"></el-table-column>
            <el-table-column prop="driver[0].phone" label="驾驶员联系方式" width="150px"></el-table-column>
            <el-table-column prop="truck.number" label="车牌号"></el-table-column>
            <el-table-column prop="truck.type" label="车辆类型"></el-table-column>
            <el-table-column prop="truck.teamID" label="所属车队"></el-table-column>
            <el-table-column prop="truck.checkInTime" label="登记时间"></el-table-column>
              <el-table-column label="操作">
                <template v-slot:default="scope">
                <el-button type="primary" @click="chooseDriver(scope.row)">选择</el-button>
                </template>
              </el-table-column>
          </el-table>

        </div>
      </div>
      <div class="details" v-if="showDetailsForm">
        <div class="form-title">
          <label>承运任务详情</label>
          <el-button type="danger" class="closeBtn" @click="closeForm">关闭</el-button>
        </div>
        <template class="form-info">
          <el-descriptions :title="'承运单列表 编号：#'+currentItem.carriersID" direction="vertical" size="large" :column="5" border>
            <el-descriptions-item label="发货单位" >{{currentItem.sendCompany}}</el-descriptions-item>
            <el-descriptions-item label="发货地址">{{currentItem.sendAddress}}</el-descriptions-item>
            <el-descriptions-item label="发货人">{{currentItem.sendLinkman}}</el-descriptions-item>
            <el-descriptions-item label="联系电话">{{currentItem.sendPhone}}</el-descriptions-item>
            <el-descriptions-item label="收货单位">{{currentItem.receiveCompany}}</el-descriptions-item>
            <el-descriptions-item label="收获地址">{{currentItem.receiveAddress}}</el-descriptions-item>
            <el-descriptions-item label="收货人">{{currentItem.receiveLinkman}}</el-descriptions-item>
            <el-descriptions-item label="联系方式">{{currentItem.receivePhone}}</el-descriptions-item>
            <el-descriptions-item label="出发时间">{{currentItem.leaverDate}}</el-descriptions-item>
            <el-descriptions-item label="送达时间">{{currentItem.receiveDate}}</el-descriptions-item>
            <el-descriptions-item label="保险费用">{{currentItem.insuranceCost}}</el-descriptions-item>
            <el-descriptions-item label="运输费用">{{currentItem.transportCost}}</el-descriptions-item>
            <el-descriptions-item label="总费用">{{currentItem.totalCost}}</el-descriptions-item>
            <el-descriptions-item label="备注">
              <el-tag size="small">{{currentItem.remark}}</el-tag>
            </el-descriptions-item>
          </el-descriptions>
        </template>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import {defineComponent} from "vue";
import navigationBar from "../../../components/navigationBar.vue";
import welcomeHeader from "../../../components/header.vue";
import ytTable from "../../../components/yt-table.vue";
import {allFreeTrucks, allSchedulingCarriers} from "@/api/carrier/task/dispatch";

export default defineComponent({
  name: "dispatch",
  data() {
    return {
      data: "",
      font_size:"16px",
      search: '',
      currentItem: {},
      chosenDriverTruck: {
        driver:[{"driverID": 1,
          "name": "",
          "sex": 0,
          "birth": null,
          "phone": "",
          "idCard": "",
          "fkTeamID": null,
          "state": 0,
          "remark": null,
          "checkInTime": "",
          "isDelete": 0,
          "alterTime": ""}],
        truck:{
          "truckID": 0,
          "number": "车牌号",
          "buyDate": null,
          "type": null,
          "tonnage": 0,
          "teamID": 0,
          "state": 0,
          "remark": null,
          "checkInTime": null,
          "isDelete": 0,
          "alterTime": ""},
      },
      schedulingCarriersList: [
        {
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
        }
      ],
      freeTrucksDriverList: [{
        "driver": [
          {
            "driverID": 0,
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
          }
        ],
        "truck": {
          "truckID": 1,
          "number": "湘A·12345",
          "buyDate": null,
          "type": null,
          "tonnage": 0,
          "teamID": 0,
          "state": 2,
          "remark": null,
          "checkInTime": null,
          "isDelete": 0,
          "alterTime": "2023-06-26T08:05:08.000+00:00"
        }
      }],
      showMask: false,
      showScheForm: false,
      showDetailsForm:false,
      insertItem: {
        "startTime": "2007-02-09",
        "fkCarriersID": 0,
        "fkTruckID": 0,
        "oilCost": 0,
        "toll": 0,
        "fine": 0,
        "otherCost": 0,
        "totalCost": 0,
        "fkUserID": 0,
        "remark": ""
      }
    };
  },
  components: {welcomeHeader, navigationBar, ytTable},
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      //获取所有待调度的承运单
      allSchedulingCarriers(0).then((res: any) => {
        this.schedulingCarriersList = res.data;
        console.log(res.data);
      })
    },
    //点击调度承运任务按钮
    schedulingCarrier(index: number) {
      this.currentItem = this.schedulingCarriersList[index];
      allFreeTrucks().then((res: any) => {
        console.log(res.data);
        this.freeTrucksDriverList = res.data;
      })
      this.showMask = true;
      this.showScheForm = true;
    },
    //点击承运任务详情按钮
    forDetails(index: number) {
      this.currentItem = this.schedulingCarriersList[index];
      console.log(this.currentItem)
      this.showMask = true;
      this.showDetailsForm = true;
    },
    //点击调度表单中的选择按钮
    chooseDriver(row:any){
      console.log(row);
      this.chosenDriverTruck = row;
    },
    //关闭调度页面表单
    closeForm() {
      console.log('关闭form')
      this.showMask = false;
      this.showScheForm = false;
      this.showDetailsForm = false;
    },
    goBack() {
    },
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../../assets/style/css/dispatch.scss";
</style>
