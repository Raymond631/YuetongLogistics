<template>
  <div class="container">
    <navigationBar/>
    <div class="content">
      <welcomeHeader />
        <div class="main-form">
          <div class="form">
            <div class="sender">
              <label>发货单位</label>

            </div>
            <div class="receiver">

            </div>

            <div class="actions">

            </div>
          </div>
        </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
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
  components: { welcomeHeader, navigationBar },
  mounted() {},
  methods: {
    goBack() {},
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../../assets/style/css/issue.scss";
</style>
