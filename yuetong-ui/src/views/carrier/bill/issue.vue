<template>
  <div class="container">
    <navigationBar />
    <div class="content">
      <welcomeHeader />
      <div class="issueBtn" @click="issueBtnClick">
        <label>开出承运单</label>
      </div>
      <label class="myCarriersLabel">我开出的承运单</label>

      <div class="main-form">
        <div class="bill-block" v-for="(carrier, index) in myCarrierList">
          <div class="driver">
            <label class="main-font">驾驶员</label>
            <div class="driver-info">
              <el-button type="info" size="large" class="choDriBtn"
                >未接收</el-button
              >
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
              <label
                v-text="'起: ' + carrier.leaverDate"
                class="third-font"
              ></label>
              <label
                v-text="'终: ' + carrier.receiveDate"
                class="third-font"
              ></label>
            </div>
            <div class="receive-info">
              <label v-text="carrier.receiveCompany" class="title-font"></label>
              <label v-text="carrier.receiveAddress" class="third-font"></label>
              <label
                v-text="carrier.receiveLinkman"
                class="second-font"
              ></label>
              <label v-text="carrier.receivePhone" class="fourth-font"></label>
            </div>
          </div>
          <div class="manager-info">
            <label
              class="main-font manager-id"
              v-text="'承运业务员编号: #' + carrier.fkUserID"
            ></label>
            <div class="actions">
              <el-button
                type="primary"
                class="infoBtn"
                @click="forDetails(index)"
                >查看详情</el-button
              >
              <el-button type="danger" class="infoBtn">删除</el-button>
            </div>
          </div>
          <div class="state">
            <el-tag size="large" type="warning">未调度</el-tag>
            <label v-text="carrier.checkInTime"></label>
          </div>
        </div>
      </div>
      <div class="mask" v-if="showMask"></div>
      <div class="issueCarrierForm" v-if="showIssueCarrierForm">
        <div class="form">
          <div class="form-title">
            <label>开出承运单</label>
            <el-button class="closeBtn" type="danger" @click="closeForm"
              >关闭</el-button
            >
          </div>
          <div class="form-info">
            <label class="flex-item-title">发货信息</label>
            <div class="flex-item sender">
              <div class="form-item">
                <label>发货单位</label>
                <el-input type="text"></el-input>
              </div>
              <div class="form-item">
                <label>发货地址</label>
                <el-input type="text"></el-input>
              </div>
              <div class="form-item">
                <label>联系人</label>
                <el-input type="text"></el-input>
              </div>
              <div class="form-item">
                <label>联系电话</label>
                <el-input type="text"></el-input>
              </div>
            </div>
            <label class="flex-item-title">收货信息</label>
            <div class="flex-item receiver">
              <div class="form-item">
                <label>收货单位</label>
                <el-input type="text"></el-input>
              </div>
              <div class="form-item">
                <label>收货地址</label>
                <el-input type="text"></el-input>
              </div>
              <div class="form-item">
                <label>收货人</label>
                <el-input type="text"></el-input>
              </div>
              <div class="form-item">
                <label>联系电话</label>
                <el-input type="text"></el-input>
              </div>
            </div>
            <label class="flex-item-title">承运单信息</label>
            <div class="flex-item details">
              <div class="form-item">
                <label>发货时间</label>
                <el-input type="text"></el-input>
              </div>
              <div class="form-item">
                <label>收货时间</label>
                <el-input type="text"></el-input>
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
            <el-button
              type="primary"
              class="addGoodsBtn"
              @click="addGoodsBtnClick"
              >+</el-button
            >
            <div class="flex-item goods">
              <div
                class="form-item"
                v-for="(goods, index) in goodsList"
                :key="index"
              >
                <label>货物名</label>
                <el-input
                  type="text"
                  v-model="goodsList[index].goodsName"
                ></el-input>
                <label>数量</label>
                <el-input
                  type="text"
                  v-model="goodsList[index].amount"
                ></el-input>
                <label>重量</label>
                <el-input
                  type="text"
                  v-model="goodsList[index].weight"
                ></el-input>
                <label>体积</label>
                <el-input
                  type="text"
                  v-model="goodsList[index].volume"
                ></el-input>
                <el-button
                  type="danger"
                  class="deleteGoodsBtn"
                  @click="deleteGoodsBtnClick(index)"
                  >删除</el-button
                >
              </div>
            </div>
            <div class="actions">
              <el-button type="primary">提交</el-button>
              <el-button type="info">重置</el-button>
            </div>
          </div>
        </div>
      </div>
      <div class="main-right"></div>
    </div>
    <div class="page">
      <el-pagination
        v-model:currentPage="paginationConfig.currentPage"
        layout="total, prev, pager, next"
        :page-size="paginationConfig.pageSize"
        :total="paginationConfig.total"
        @current-change="handlePageChange"
      />
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import navigationBar from "../../../components/navigationBar.vue";
import welcomeHeader from "../../../components/header.vue";
import { allMyCarrierList } from "../../../api/carrier/bill/issue";

export default defineComponent({
  name: "issue",
  data() {
    return {
      myCarrierList: [
        {
          carriersId: 3,
          sendCompany: "qui",
          sendAddress: "云南省佳木斯市雁江区",
          sendLinkman: "elit ut sunt",
          sendPhone: "19840510269",
          receiveCompany: "ad Ut",
          receiveAddress: "四川省三沙市景谷傣族彝族自治县",
          receiveLinkman: "ut",
          receivePhone: "13138768380",
          leaverDate: "1988-01-06",
          receiveDate: null,
          finishedState: 1,
          insuranceCost: 9.0,
          transportCost: 81.0,
          otherCost: 23.0,
          totalCost: 113.0,
          remark: "labore tempor exercitation pariatur deserunt",
          account: "abc",
          checkInTime: "2023-07-12 06:11:28",
          alterTime: "2023-07-12 06:11:28",
          goodsList: null,
        },
      ],
      issueCarrier: {
        sendCompany: "mollit amet minim",
        sendAddress: "山东省玉林市南区",
        sendLinkman: "non labore in",
        sendPhone: "19848185972",
        receiveCompany: "dolor exercitation commodo sit aute",
        receiveAddress: "海南省运城市铁东区",
        receiveLinkman: "irure aliquip ut enim",
        receivePhone: "13277832224",
        leaverDate: "2016-11-04",
        insuranceCost: 10,
        transportCost: 40,
        otherCost: 53,
        remark: "aliquip incididunt amet consequat nulla",
        goodsList: [
          {
            goodsName: "当叫八存并",
            amount: 38,
            weight: 24.12,
            volume: 11.34,
          },
          {
            goodsName: "者家头达",
            amount: 24,
            weight: 92.12,
            volume: 53.34,
          },
        ],
      },
      paginationConfig: {
        currentPage: 1, // 当前页码
        pageSize: 4, // 每页显示的条数
        pageCount: 1, //总共有多少页
        total: 0, // 总条数
      },
      goodsList: [
        {
          goodsName: "",
          amount: 0,
          weight: 0,
          volume: 0,
        },
      ],
      //分页参数
      pageNum: 1, //当前页面number
      pageSize: 5, //一页能显示的最多数据的数量
      showMask: false,
      showIssueCarrierForm: false,
    };
  },
  components: { welcomeHeader, navigationBar },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      allMyCarrierList(
        this.paginationConfig.currentPage,
        this.paginationConfig.pageSize
      ).then((res: any) => {
        console.log(res.data.list);
        this.myCarrierList = res.data.list;
        this.paginationConfig.total = res.data.total;
      });
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
    },
    //添加货物
    addGoodsBtnClick() {
      this.goodsList.push({
        goodsName: "",
        amount: 0,
        weight: 0,
        volume: 0,
      });
    },
    //删除货物表单中的某一行
    deleteGoodsBtnClick(index: number) {
      this.goodsList.splice(index, 1);
    },
    handlePageChange(val: number) {
      this.paginationConfig.currentPage = val;
      console.log("当前页面数为：" + val);
      this.ready();
    },
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../../assets/style/css/issue.scss";
</style>
