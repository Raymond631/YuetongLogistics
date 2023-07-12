<template>
  <div class="container">
    <navigationBar />
    <div class="content">
      <welcomeHeader />
      <el-tabs v-model="logName" class="logTabs">
        <el-tab-pane label="操作日志" name="operateLog">
          <div class="upload">
            <!-- <el-link
              href="http://192.168.3.107:10000/system/log/exportOperateLog"
              type="primary"
              :underline="false"
              class="link"
              target="_blank"
              ><el-icon><Download /></el-icon>导出操作日志</el-link
            > -->
            <el-button type="primary" @click="getOperationData"
              >导出操作日志</el-button
            >
          </div>
          <ytTable
            class="table"
            :tableInfo="operateLog"
            :tableContent="operateLog_data"
            :paginationConfig="paginationConfig_operate"
            :handlePageChange="handlePageChange_operate"
            :tableHeight="670"
          />
          <!-- 分页 -->
          <div class="page">
            <el-pagination
              v-model:currentPage="paginationConfig_operate.currentPage"
              layout="total, prev, pager, next"
              :page-size="paginationConfig_operate.pageSize"
              :total="paginationConfig_operate.total"
              @current-change="handlePageChange_operate"
            />
          </div>
        </el-tab-pane>
        <el-tab-pane label="登录日志" name="loginLog">
          <div class="upload">
            <!-- <el-link
              href="http://192.168.3.107:10000/system/log/exportLoginLog"
              type="primary"
              :underline="false"
              class="link"
              target="_blank"
              ><el-icon><Download /></el-icon>导出登录日志</el-link
            > -->
            <el-button type="primary" @click="getLoginData"
              >导出登录日志</el-button
            >
          </div>
          <ytTable
            class="table"
            :tableInfo="loginLog"
            :tableContent="loginLog_data"
            :tableHeight="678"
          />
          <!-- 分页 -->
          <div class="page">
            <el-pagination
              v-model:currentPage="paginationConfig_login.currentPage"
              layout="total, prev, pager, next"
              :page-size="paginationConfig_login.pageSize"
              :total="paginationConfig_login.total"
              @current-change="handlePageChange_login"
            />
          </div>
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
import {
  operateLog,
  loginLog,
  loginLogExport,
  operateLogExport,
} from "../../api/system/log";
// import { saveAs } from "file-saver";

export default defineComponent({
  name: "log",
  data() {
    return {
      data: "",
      paginationConfig_operate: {
        currentPage: 1, // 当前页码
        pageSize: 10, // 每页显示的条数
        pageCount: 1, //总共有多少页
        total: 0, // 总条数
      },
      paginationConfig_login:{
        currentPage: 1, // 当前页码
        pageSize: 15, // 每页显示的条数
        pageCount: 1, //总共有多少页
        total: 0, // 总条数
      },
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
      this.getOperateLog();
      this.getLoginLog();
    },
    getOperateLog(){
      operateLog(
        this.paginationConfig_operate.currentPage,
        this.paginationConfig_operate.pageSize
      )
        .then((res: any) => {
          this.operateLog_data = res.data.list;
          // this.paginationConfig.pageSize = res.data.pageSize;
          this.paginationConfig_operate.pageCount = res.data.pages;
          // this.paginationConfig.total = res.data.size;
          this.paginationConfig_operate.total = res.data.total;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    getLoginLog(){
      loginLog(
      this.paginationConfig_login.currentPage,
        this.paginationConfig_login.pageSize
      )
        .then((res: any) => {
          console.log(res)
          this.loginLog_data = res.data.list;
          this.paginationConfig_login.pageCount = res.data.pages;
          // this.paginationConfig.total = res.data.size;
          this.paginationConfig_login.total = res.data.total;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    handlePageChange_operate(val: number) {
      this.paginationConfig_operate.currentPage = val;
      console.log("当前页面数为：" + val);
      this.getOperateLog();
    },

    handlePageChange_login(val: number) {
      this.paginationConfig_login.currentPage = val;
      console.log("当前页面数为：" + val);
      this.getLoginLog();
    },
    getOperationData() {
      operateLogExport()
        .then((res: any) => {
          console.log(res);
          const filename = "operationLog.xlsx"; // 设置文件名
          let blob = new Blob([res], { type: "application/vnd.ms-excel;charset=UTF-8" });
          // saveAs(new Blob([res], { type: 'application/vnd.ms-excel' }), filename);
          let objectUrl = URL.createObjectURL(blob);
          window.location.href = objectUrl;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },

    getLoginData() {
      loginLogExport()
        .then((res: any) => {
          console.log(res);
          const filename = "loginLog.xlsx"; // 设置文件名
          // saveAs(res, filename); 
          let blob = new Blob([res], { type: "application/vnd.ms-excel;charset=UTF-8" });
          // saveAs(new Blob([res], { type: 'application/vnd.ms-excel' }), filename);
          let objectUrl = URL.createObjectURL(blob);
          window.location.href = objectUrl;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../assets/style/css/log.scss";
</style>
