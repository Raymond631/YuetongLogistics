<template>
  <div class="container">
    <navigationBar/>
    <div class="content">
      <welcomeHeader/>
      <div class="main-form">
        <div class="main-form-left">
          <div class="form">
            <div class="sender">
              <label class="title">发货信息</label>
              <div class="item">
                <label>发货单位</label>
                <el-input type="text"></el-input>
              </div>
              <div class="item">
                <label>发货地址</label>
                <el-input type="text"></el-input>
              </div>
              <div class="item">
                <label>联系人</label>
                <el-input type="text"></el-input>
              </div>
              <div class="item">
                <label>联系电话</label>
                <el-input type="text"></el-input>
              </div>
            </div>
            <div class="receiver">
              <label class="title">收货信息</label>

              <div class="item">
                <label>收货单位</label>
                <el-input type="text"></el-input>
              </div>
              <div class="item">
                <label>收货地址</label>
                <el-input type="text"></el-input>
              </div>
              <div class="item">
                <label>收货人</label>
                <el-input type="text"></el-input>
              </div>
              <div class="item">
                <label>联系电话</label>
                <el-input type="text"></el-input>
              </div>

            </div>
          </div>
          <div class="details">
            <label class="title">承运单信息</label>
            <div class="detail">
              <div class="item">
                <label>发货时间</label>
                <el-input type="text"></el-input>
              </div>
              <div class="item">
                <label>收货时间</label>
                <el-input type="text"></el-input>
              </div>
              <div class="item">
                <label>备注</label>
                <el-input type="text"></el-input>
              </div>
              <div class="item">
                <label>开票时间</label>
                <el-input type="text"></el-input>
              </div>
            </div>
            <div class="actions">
              <el-button type="primary">提交</el-button>
              <el-button type="info">关闭</el-button>
            </div>
          </div>
        </div>
        <div class="main-right">
        </div>
      </div>

    </div>
  </div>
</template>

<script lang="ts">
import {defineComponent} from "vue";
import navigationBar from "../../../components/navigationBar.vue";
import welcomeHeader from "../../../components/header.vue";

export default defineComponent({
  name: "issue",
  data() {
    return {
      carrier: {
        "sendCompany": "发货单位",
        "sendAddress": "湖南省长沙市",
        "sendLinkman": "联系人",
        "sendPhone": "18698893618",
        "receiveCompany": "收货单位",
        "fkReceiveAddress": "浙江省铜川市东乌珠穆沁旗",
        "receiveLinkman": "收货人",
        "receivePhone": "18611798277",
        "leaverDate": "2014-10-17",
        "receiveDate": "2005-05-24",
        "insuranceCost": 1,
        "transportCost": 1,
        "otherCost": 1,
        "totalCost": 3,
        "remark": "这是备注",
        "fkUserID": 2,
        "checkInTime": "2023-06-23 02:41:33"
      },
    };
  },
  components: {welcomeHeader, navigationBar},
  mounted() {
  },
  methods: {
    goBack() {
    },
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../../assets/style/css/issue.scss";
</style>
