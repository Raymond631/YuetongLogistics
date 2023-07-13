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
            <label @click="contactDriver">绑定驾驶员</label>
          </div>
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

    <div class="mask" v-if="showMask"></div>
    <div class="contactForm" v-if="showContactForm">
      <div class="form-title">
        <label>绑定驾驶员</label>
        <el-button type="danger" class="closeBtn" @click="closeForm"
          >关闭</el-button
        >
      </div>
      <div class="alreadyChosenTruck">
        <el-descriptions
          class="descriptions"
          title="已选车辆"
          :column="4"
          size="large"
          border
        >
          <el-descriptions-item label="车牌" width="100px">
            <el-tag size="small">{{ chosenTruck.number }}</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="车型" width="140px">{{
            chosenTruck.truckType
          }}</el-descriptions-item>
          <el-descriptions-item label="吨位" width="100px">{{
            chosenTruck.tonnage
          }}</el-descriptions-item>
          <el-descriptions-item label="所属车队">{{
            chosenTruck.fkTeamId
          }}</el-descriptions-item>
        </el-descriptions>
      </div>
      <div class="alreadyChosenDriver">
        <el-descriptions
          class="descriptions"
          title="已选驾驶员"
          :column="4"
          size="large"
          border
        >
          <el-descriptions-item label="驾驶员" width="100px">{{
            chosenDriver.name
          }}</el-descriptions-item>
          <el-descriptions-item label="联系方式" width="140px">{{
            chosenDriver.phone
          }}</el-descriptions-item>
          <el-descriptions-item label="生日" width="140px">{{
            chosenDriver.birth
          }}</el-descriptions-item>
          <el-descriptions-item label="性别">{{
            chosenDriver.sex
          }}</el-descriptions-item>
        </el-descriptions>
      </div>
      <div class="actions">
        <el-button type="primary">绑定</el-button>
        <el-button type="info" @click="resetForm">重置</el-button>
      </div>
      <label class="free-title">空闲车辆信息</label>
      <el-table :data="freeTruckList" :style="'font-size: ' + font_size">
        <el-table-column
          prop="truckId"
          label="编号"
          width="60px"
        ></el-table-column>
        <el-table-column
          prop="number"
          label="车牌"
          width="150px"
        ></el-table-column>
        <el-table-column prop="truckType" label="车型"></el-table-column>
        <el-table-column prop="tonnage" label="吨位"></el-table-column>
        <el-table-column prop="checkInTime" label="登记时间"></el-table-column>
        <el-table-column prop="fkTeamId" label="所属车队"></el-table-column>
        <el-table-column label="操作">
          <template v-slot:default="scope">
            <el-button type="primary" @click="chooseTruck(scope.row)"
              >选择</el-button
            >
          </template>
        </el-table-column>
      </el-table>
      <div class="page2">
        <el-pagination
          v-model:currentPage="paginationConfig_truck.currentPage"
          layout="total, prev, pager, next"
          small
          :page-size="paginationConfig_truck.pageSize"
          :total="paginationConfig_truck.total"
          @current-change="handleCurrentChange_truck"
        />
      </div>
      <label class="free-title">空闲驾驶员信息</label>
      <el-table :data="freeDriverList" :style="'font-size: ' + font_size">
        <el-table-column prop="name" label="驾驶员"></el-table-column>
        <el-table-column
          prop="phone"
          label="联系方式"
          width="150px"
        ></el-table-column>
        <el-table-column prop="birth" label="生日"></el-table-column>
        <el-table-column prop="sex" label="性别"></el-table-column>
        <el-table-column prop="idCard" label="身份证号"></el-table-column>
        <el-table-column prop="remark" label="备注"></el-table-column>
        <el-table-column label="操作">
          <template v-slot:default="scope">
            <el-button type="primary" @click="chooseDriver(scope.row)"
              >选择</el-button
            >
          </template>
        </el-table-column>
      </el-table>
      <div class="page2">
        <el-pagination
          v-model:currentPage="paginationConfig_driver.currentPage"
          layout="total, prev, pager, next"
          small
          :page-size="paginationConfig_driver.pageSize"
          :total="paginationConfig_driver.total"
          @current-change="handleCurrentChange_driver"
        />
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import navigationBar from "../../components/navigationBar.vue";
import welcomeHeader from "../../components/header.vue";
import { defineComponent } from "vue";
import { searchTruck, deleteTruck, uploadTruck } from "../../api/fleet/truck";
import {searchDrivers} from "../../api/fleet/driver";

export default defineComponent({
  name: "truck",
  components: { welcomeHeader, navigationBar },
  data() {
    return {
      search: "",
      font_size: "16px",
      selectType: 0,
      paginationConfig: {
        currentPage: 1, // 当前页码
        pageSize: 10, // 每页显示的条数
        pageCount: 1, //总共有多少页
        total: 1, // 总条数
      },
      paginationConfig_truck: {
        currentPage: 1, // 当前页码
        pageSize: 3, // 每页显示的条数
        pageCount: 1, //总共有多少页
        total: 1, // 总条数
      },
      paginationConfig_driver: {
        currentPage: 1, // 当前页码
        pageSize: 3, // 每页显示的条数
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
      //绑定界面
      showMask: false,
      showContactForm: false,
      chosenTruck: {
        truckId: null,
        number: "",
        buyDate: "",
        truckType: "",
        tonnage: null,
        fkTeamId: null,
        state: "",
        remark: "",
        checkInTime: "",
        alterTime: "",
      },
      chosenDriver: {
        driverId: null,
        image: "",
        name: "",
        sex: "",
        birth: "",
        phone: "",
        idCard: "",
        fkTeamId: null,
        state: "",
        remark: "",
        checkInTime: "",
        alterTime: "",
      },
      freeTruckList: [
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
      freeDriverList: [
        {
          driverId: 1,
          image: "",
          name: "张三",
          sex: "男",
          birth: "1988-10-01",
          phone: "12345678900",
          idCard: "123456789123456789",
          fkTeamId: 1,
          state: "空闲",
          remark: "无",
          checkInTime: "2023-07-21 07:58:15",
          alterTime: "2023-07-11 07:58:15",
        },
      ],
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
      )
        .then((res: any) => {
          console.log(res);
          this.truckList = res.data.list;
          //获取所有未绑定的车辆
          this.paginationConfig.total = Number(res.data.total);
        })
        .catch((err: any) => {
          console.log(err);
        });
        this.getTruckFree();
        this.getDriverFree();
      },
    //删除车辆
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
    handleCurrentChange_truck(val: number) {
      this.paginationConfig_truck.currentPage = val;
      this.getTruckFree();
    },
    getTruckFree(){
      searchTruck(
        this.paginationConfig_truck.currentPage,
        this.paginationConfig_truck.pageSize,
        2
      )
        .then((res: any) => {
          console.log(res);
          //获取所有未绑定的车辆
          this.freeTruckList = res.data.list;
          this.paginationConfig_truck.total = Number(res.data.total);
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    handleCurrentChange_driver(val: number) {
      this.paginationConfig_driver.currentPage = val;
      this.getDriverFree();
    },
    getDriverFree(){
      searchDrivers(
        this.paginationConfig_driver.currentPage,
        this.paginationConfig_driver.pageSize,
        2
      )
        .then((res: any) => {
          console.log(res);
          //获取所有未绑定的司机
          this.freeDriverList = res.data.list;
          this.paginationConfig_driver.total = Number(res.data.total);
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    handleFree() {
      this.selectType = 2;
      this.ready();
    },
    handleWork() {
      this.selectType = 1;
      this.ready();
    },
    handleAll() {
      this.selectType = 0;
      this.ready();
    },
    closeForm() {
      this.showMask = false;
      this.showContactForm = false;
    },
    //绑定驾驶员
    contactDriver() {
      this.showMask = true;
      this.showContactForm = true;
    },
    chooseTruck(row: any) {
      this.chosenTruck = row;
    },
    chooseDriver(row: any) {
      this.chosenDriver = row;
    },
    resetForm() {
      this.chosenTruck = {};
      this.chosenDriver = {};
    },
  },
});
</script>

<style scoped lang="scss">
@import "../../assets/style/css/truck.scss";
</style>
