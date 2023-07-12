<template>
  <div class="container">
    <navigationBar />
    <div class="content">
      <welcomeHeader />
      <div class="block-list">
        <div class="search">
          <el-input
            type="text"
            class="search-input"
            v-model="search"
            placeholder="请搜索用户"
          ></el-input>
        </div>
      <div class="actions">
        <div class="action1">
          <label @click="handleAll()">查看所有</label>
        </div>
        <el-popconfirm
          title="选择筛选项"
          confirm-button-text="空闲"
          cancel-button-text="运输中"
          @confirm="handleFree()"
          @cancel="handleWork()"
        >
          <template #reference>
            <div class="action2">
              <label>筛选</label>
            </div>
          </template>
        </el-popconfirm>
      </div>
      </div>
      <div class="card" v-for="(truck, index) in truckList" :key="index">
        <div class="car_id">
          {{ truck.truckId }}
          <span style="margin-left: 20px">
            <el-tag size="small">{{ truck.state }}</el-tag></span
          >
        </div>
        <el-popconfirm
          title="这是一段内容确定删除吗？"
          @confirm="handleDelete(truck.truckId)"
        >
          <template #reference>
            <el-button type="danger" class="car_delete">删除</el-button>
          </template>
        </el-popconfirm>
        <div class="car_number">车牌号：{{ truck.number }}</div>
        <div class="car_type">车型：{{ truck.truckType }}</div>
        <div class="car_ton">吨位：{{ truck.tonnage }}</div>
        <div class="car_remark">备注：{{ truck.remark }}</div>
        <div class="car_time_buy">
          购车时间：<span style="margin-left: 30px">{{ truck.buyDate }}</span>
        </div>
        <div class="car_time_check">
          登入时间：<span style="margin-left: 30px">{{
            truck.checkInTime
          }}</span>
        </div>
        <div class="car_time_update">
          更新时间：<span style="margin-left: 30px">{{ truck.alterTime }}</span>
        </div>
      </div>
    </div>
    <div class="page">
      <el-pagination
        v-model:currentPage="paginationConfig.currentPage"
        layout="total, prev, pager, next"
        small
        :page-size="paginationConfig.pageSize"
        :total="paginationConfig.total"
        @current-change="handleCurrentChange"
      />
    </div>
  </div>
</template>

<script lang="ts">
import navigationBar from "../../components/navigationBar.vue";
import welcomeHeader from "../../components/header.vue";
import { defineComponent } from "vue";
import { searchTruck, deleteTruck, uploadTruck } from "../../api/fleet/truck";

export default defineComponent({
  name: "truck",
  components: { welcomeHeader, navigationBar },
  data() {
    return {
      search:'',
      selectType:0,
      paginationConfig: {
        currentPage: 1, // 当前页码
        pageSize: 10, // 每页显示的条数
        pageCount: 1, //总共有多少页
        total: 1, // 总条数
      },
      truckList: [
        {
          truckId: 1,
          number: "湘A12345",
          buyDate: "2022-10-01",
          truckType: "大货车",
          tonnage: 20,
          fkTeamId: 1,
          state: "空闲",
          remark: "无",
          checkInTime: "2023-07-11 09:17:32",
          alterTime: "2023-07-11 09:17:32",
        },
      ],
      //编辑页面
    };
  },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      searchTruck(
        this.paginationConfig.currentPage,
        this.paginationConfig.pageSize,
        this.selectType
      ).then((res: any) => {
        console.log(res);
        this.truckList = res.data.list;
        this.paginationConfig.total = Number(res.data.total);
        this.paginationConfig.pageCount = Number(res.data.pageNum);
      });
    },
    //删除用户
    handleDelete(truckId: number) {
      let that = this;
      deleteTruck(truckId)
        .then((res: any) => {
          console.log("delete success");
          //重新请求该页面数据
          that.ready();
          console.log(res);
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    handleCurrentChange(val: number) {
      this.paginationConfig.currentPage = val;
      this.ready();
    },
    handleFree() {
      this.selectType = 2;
      this.ready()
    },
    handleWork() {
      this.selectType = 1;
      this.ready()
    },
    handleAll() {
      this.selectType = 0;
      this.ready()
    },
  },
});
</script>

<style scoped lang="scss">
@import "../../assets/style/css/truck.scss";
</style>
