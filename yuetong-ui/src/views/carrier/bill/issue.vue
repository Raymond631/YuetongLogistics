<template>
  <div class="container">
    <navigationBar/>
    <div class="content">
      <welcomeHeader/>
      <div class="issueBtn" @click="issueBtnClick">
        <label>开出承运单</label>
      </div>
      <label class="myCarriersLabel">我开出的承运单</label>

      <div class="main-form">
        <div class="bill-block" v-for="(item,index) in myCarrierList">
          <div class="driver">
            <label class="main-font">驾驶员</label>
            <div class="driver-info">
              <el-button type="info" size="large" class="choDriBtn">未接收</el-button>
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
            <label class="main-font manager-id" v-text="'承运业务员编号: #'+item.carrier.account"></label>
            <div class="actions">
              <el-button type="primary" class="infoBtn" @click="forDetails(index)">查看详情</el-button>
              <el-button type="danger" class="infoBtn">删除</el-button>
            </div>
          </div>
          <div class="state">
            <el-tag size="large" type="warning">未调度</el-tag>
            <label v-text="item.carrier.checkInTime"></label>
          </div>
        </div>
      </div>
      <div class="mask" v-if="showMask"></div>
      <div class="issueCarrierForm" v-if="showIssueCarrierForm">
        <div class="form">
          <div class="form-title">
            <label>开出承运单</label>
            <el-button class="closeBtn" type="danger" @click="closeForm">关闭</el-button>
          </div>
          <div class="form-info">
            <label class="flex-item-title">发货信息</label>
            <div class="flex-item sender">
              <div class="form-item">
                <label>发货单位</label>
                <el-input type="text" v-model="issueCarrier.sendCompany"></el-input>
              </div>
              <div class="form-item">
                <label>发货地址</label>
                <el-input type="text" v-model="issueCarrier.sendAddress"></el-input>
              </div>
              <div class="form-item">
                <label>联系人</label>
                <el-input type="text" v-model="issueCarrier.sendLinkman"></el-input>
              </div>
              <div class="form-item">
                <label>联系电话</label>
                <el-input type="text" v-model="issueCarrier.sendPhone"></el-input>
              </div>
            </div>
            <label class="flex-item-title">收货信息</label>
            <div class="flex-item receiver">
              <div class="form-item">
                <label>收货单位</label>
                <el-input type="text" v-model="issueCarrier.receiveCompany"></el-input>
              </div>
              <div class="form-item">
                <label>收货地址</label>
                <el-input type="text" v-model="issueCarrier.receiveAddress"></el-input>
              </div>
              <div class="form-item">
                <label>收货人</label>
                <el-input type="text" v-model="issueCarrier.receiveLinkman"></el-input>
              </div>
              <div class="form-item">
                <label>联系电话</label>
                <el-input type="text"  v-model="issueCarrier.receivePhone"></el-input>
              </div>
            </div>
            <label class="flex-item-title">承运单信息</label>
            <div class="flex-item details">
              <div class="form-item">
                <label>发货时间</label>
                <el-input type="text" v-model="issueCarrier.leaverDate"></el-input>
              </div>
              <div class="form-item">
                <label>备注</label>
                <el-input type="text"></el-input>
              </div>
              <div class="form-item">
                <label>开票时间</label>
                <el-input type="text"></el-input>
              </div>
            </div>
            <label class="flex-item-title goods">货物信息</label>
            <el-button type="primary" class="addGoodsBtn" @click="addGoodsBtnClick">+</el-button>
            <div class="flex-item goods">
              <div class="form-item" v-for="(goods,index) in goodsList" :key="index">
                <label>货物名</label>
                <el-input type="text" v-model="goodsList[index].goodsName"></el-input>
                <label>数量</label>
                <el-input type="text" v-model="goodsList[index].amount"></el-input>
                <label>重量</label>
                <el-input type="text" v-model="goodsList[index].weight"></el-input>
                <label>体积</label>
                <el-input type="text" v-model="goodsList[index].volume"></el-input>
                <el-button type="danger" class="deleteGoodsBtn" @click="deleteGoodsBtnClick(index)">删除</el-button>
              </div>
            </div>
            <div class="actions">
              <el-button type="primary">提交</el-button>
              <el-button type="info">重置</el-button>
            </div>
          </div>

        </div>

      </div>
      <div class="detailsForm" v-if="showDetailsForm">
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
          <label class="goods-title">货物信息</label>
          <el-table :data="currentItem.carrier.goodsList" style="font-size:16px;">
            <el-table-column prop="goodsName" label="货物名称" width="180px"></el-table-column>
            <el-table-column prop="amount" label="货物数量" width="180px"></el-table-column>
            <el-table-column prop="weight" label="货物重量" width="180px"></el-table-column>
            <el-table-column prop="volume" label="货物体积"></el-table-column>
          </el-table>
        </template>
      </div>
    </div>

  </div>

</template>

<script lang="ts">
import {defineComponent} from "vue";
import navigationBar from "../../../components/navigationBar.vue";
import welcomeHeader from "../../../components/header.vue";
import {allMyCarrierList} from "@/api/carrier/bill/issue";

export default defineComponent({
  name: "issue",
  data() {
    return {
      myCarrierList: [{
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
          "receiveDate": null,
          "finishedState": 1,
          "insuranceCost": 9.0,
          "transportCost": 81.0,
          "otherCost": 23.0,
          "totalCost": 113.0,
          "remark": "labore tempor exercitation pariatur deserunt",
          "account": "abc",
          "checkInTime": "2023-07-12 06:11:28",
          "alterTime": "2023-07-12 06:11:28",
          "goodsList": null
        },
        "driver": {}
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
          "receiveDate": null,
          "finishedState": 1,
          "insuranceCost": 9.0,
          "transportCost": 81.0,
          "otherCost": 23.0,
          "totalCost": 113.0,
          "remark": "labore tempor exercitation pariatur deserunt",
          "account": "abc",
          "checkInTime": "2023-07-12 06:11:28",
          "alterTime": "2023-07-12 06:11:28",
          "goodsList": null
        },
        "driver": {}
      },
      issueCarrier: {
        "sendCompany": "mollit amet minim",
        "sendAddress": "山东省玉林市南区",
        "sendLinkman": "non labore in",
        "sendPhone": "19848185972",
        "receiveCompany": "dolor exercitation commodo sit aute",
        "receiveAddress": "海南省运城市铁东区",
        "receiveLinkman": "irure aliquip ut enim",
        "receivePhone": "13277832224",
        "leaverDate": "2016-11-04",
        "insuranceCost": 10,
        "transportCost": 40,
        "otherCost": 53,
        "remark": "aliquip incididunt amet consequat nulla",
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
      goodsList: [{
        "goodsName": "",
        "amount": 0,
        "weight": 0,
        "volume": 0
      }],
      //分页参数
      pageNum: 1,//当前页面number
      pageSize: 5,//一页能显示的最多数据的数量
      showMask: false,
      showDetailsForm: false,
      showIssueCarrierForm: false,
    };
  },
  components: {welcomeHeader, navigationBar},
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      //获取未调度的本人的承运单
      allMyCarrierList(1, 10, 0).then((res: any) => {
        console.log(res.data.list);
        this.myCarrierList = res.data.list;
      })
    },
    //点击开出承运单
    issueBtnClick() {
      this.showMask = true;
      this.showIssueCarrierForm = true;
    },
    //关闭添加承运单
    closeForm() {
      this.showMask = false;
      this.showIssueCarrierForm = false;
      this.showDetailsForm = false;
    },
    //添加货物
    addGoodsBtnClick() {
      this.goodsList.push({
        "goodsName": "",
        "amount": 0,
        "weight": 0,
        "volume": 0
      });
    },
    forDetails(index: number) {
      this.currentItem = this.myCarrierList[index];
      this.showMask = true;
      this.showDetailsForm = true;
    },
    //删除货物表单中的某一行
    deleteGoodsBtnClick(index: number) {
      this.goodsList.splice(index, 1);
    },
    goBack() {
    },
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../../assets/style/css/issue.scss";
</style>
