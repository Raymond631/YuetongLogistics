<template>
  <div class="container">
    <navigationBar />
    <div class="content">
      <welcomeHeader />
      <el-tabs v-model="logName" class="logTabs">
        <el-tab-pane label="操作日志" name="operateLog">
          <ytTable
            class="table"
            :tableInfo="operateLog"
            :tableContent="operateLog_data"
            :tableHeight="700"
          />
        </el-tab-pane>
        <el-tab-pane label="登录日志" name="loginLog">
          <ytTable
            class="table"
            :tableInfo="loginLog"
            :tableContent="loginLog_data"
            :tableHeight="700"
          />
        </el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import navigationBar from "../../components/navigationBar.vue";
import welcomeHeader from "../../components/header.vue";
import ytTable from "../../components/yt-table.vue";
import { operateLog, loginlog } from "../../api/system/log";

export default defineComponent({
  name: "log",
  data() {
    return {
      data: "",
      logName: "operateLog",
      operateLog: {
        number: 11,
        select: false,
        action: false,
        tag: true,
        columns: [
          { label: "操作序号", content: "operId" },
          { label: "操作时间", content: "operTime" },
          { label: "操作人员", content: "operName" },
          { label: "操作地址", content: "operIp" },
          { label: "操作模块", content: "title" },
          { label: "业务类型", content: "businessType" },
          { label: "请求方法", content: "requestMethod" },
          { label: "请求地址", content: "operUrl" },
          { label: "消耗时间", content: "costTime" },
          { label: "错误消息", content: "errorMsg" },
        ],
        actions: {
          specific: false,
          edit: true,
          delete: true,
        },
      },
      loginLog: {
        number: 4,
        select: false,
        action: false,
        tag: true,
        columns: [
          { label: "序号", content: "infoId" },
          { label: "用户账号", content: "account" },
          { label: "描述", content: "msg" },
          { label: "IP地址", content: "ipaddr" },
          { label: "访问时间", content: "accessTime" },
        ],
        actions: {
          specific: false,
          edit: true,
          delete: true,
        },
      },
      operateLog_data: [],
      loginLog_data: [],
    };
  },
  components: { welcomeHeader, navigationBar, ytTable },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      operateLog()
        .then((res: any) => {
          this.operateLog_data = res.data.list;
        })
        .catch((err: any) => {
          console.log(err);
        });
      loginlog()
        .then((res: any) => {
          this.loginLog_data = res.data.list;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },

    goBack() {},
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../assets/style/css/log.scss";
</style>
