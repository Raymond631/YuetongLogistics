<template>
  <div class="container">
    <navigationBar />
    <div class="content">
      <welcomeHeader />
      <el-tabs v-model="logName" class="logTabs">
        <el-tab-pane label="操作日志" name="operateLog">
          <div class="upload">
            <el-link
              href="http://127.0.0.1:4523/m1/2962122-0-default/system/log/exportOperateLog"
              type="primary"
              :underline="false"
              class="link"
              target="_blank"
              ><el-icon><Download /></el-icon>导出操作日志</el-link
            >
          </div>
          <ytTable
            class="table"
            :tableInfo="operateLog"
            :tableContent="operateLog_data"
            :paginationConfig="paginationConfig"
            :handlePageChange="handlePageChange"
            :tableHeight="700"
          />
          <!-- 分页 -->
          <div class="page">
            <el-pagination
              v-model:currentPage="paginationConfig.currentPage"
              layout="total, prev, pager, next"
              :page-size="paginationConfig.pageSize"
              :total="paginationConfig.total"
              @current-change="handlePageChange"
            />
          </div>
        </el-tab-pane>
        <el-tab-pane label="登录日志" name="loginLog">
          <div class="upload">
            <el-link
              href="http://127.0.0.1:4523/m1/2962122-0-default/system/log/exportLoginLog"
              type="primary"
              :underline="false"
              class="link"
              target = '_blank'
              ><el-icon><Download /></el-icon>导出登录日志</el-link
            >
          </div>
          <ytTable
            class="table"
            :tableInfo="loginLog"
            :tableContent="loginLog_data"
            :tableHeight="700"
          />
          <!-- 分页 -->
          <div class="page">
            <el-pagination
              v-model:currentPage="paginationConfig.currentPage"
              layout="total, prev, pager, next"
              :page-size="paginationConfig.pageSize"
              :total="paginationConfig.total"
              :page-count="paginationConfig.pageCount"
              @current-change="handlePageChange"
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
import { operateLog, loginlog } from "../../api/system/log";

export default defineComponent({
  name: "log",
  data() {
    return {
      data: "",
      paginationConfig: {
        currentPage: 1, // 当前页码
        pageSize: 2, // 每页显示的条数
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
      operateLog(
        this.paginationConfig.currentPage,
        this.paginationConfig.pageSize
      )
        .then((res: any) => {
          this.operateLog_data = res.data.list;
          // this.paginationConfig.pageSize = res.data.pageSize;
          this.paginationConfig.pageCount = res.data.pages;
          // this.paginationConfig.total = res.data.size;
          this.paginationConfig.total = res.data.list.length;
        })
        .catch((err: any) => {
          console.log(err);
        });
      loginlog(
        this.paginationConfig.pageSize,
        this.paginationConfig.currentPage
      )
        .then((res: any) => {
          this.loginLog_data = res.data.list;
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    handlePageChange(val: number) {
      this.paginationConfig.currentPage = val;
      console.log("当前页面数为：" + val);
      this.ready();
    },

    goBack() {},
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../assets/style/css/log.scss";
</style>
