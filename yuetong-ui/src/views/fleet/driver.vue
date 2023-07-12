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
            <label>筛选</label>
          </div>
          <div class="action2">
            <label>添加用户</label>
          </div>
        </div>
      </div>
      <div class="user-main">
        <div class="user-block" v-for="driver in driverList" :key="driver.driverId">
          <div class="basic-info">
            <el-avatar type="image" :src="driver.image" class="image"></el-avatar>
            <div class="right-info">
              <label v-text="driver.name" class="username"></label>
              <label v-text="'#' + driver.state" class="role"></label>
              <div class="icons">
                <el-popover
                  placement="top-start"
                  title="生日很重要啊！"
                  :width="20"
                  trigger="hover"
                  :content="'生日:' + driver.birth"
                >
                  <template #reference>
                    <el-icon :size="30" :color="'#0e6f64'" class="icon">
                      <Avatar />
                    </el-icon>
                  </template>
                </el-popover>

                <el-popover
                  placement="top-start"
                  title="联系电话"
                  :width="20"
                  trigger="hover"
                  :content="'移动电话：'+driver.phone"
                >
                  <template #reference>
                    <el-icon :size="30" :color="'#0e6f64'" class="icon">
                      <PhoneFilled />
                    </el-icon>
                  </template>
                </el-popover>
                <el-popover
                  placement="top-start"
                  title="入厂时间"
                  :width="20"
                  trigger="hover"
                  :content="driver.checkInTime"
                >
                  <template #reference>
                    <el-icon :size="30" :color="'#0e6f64'" class="icon">
                      <ChatLineRound />
                    </el-icon>
                  </template>
                </el-popover>
              </div>
            </div>

            <el-popconfirm
              title="这是一段内容确定删除吗？"
              @confirm="handleDelete(driver.driverId)"
            >
              <template #reference>
                <el-button class="dot">
                  <el-icon><CloseBold /></el-icon>
                </el-button>
              </template>
            </el-popconfirm>

            <!-- <el-icon :size="30" class="more">
              <More />
            </el-icon> -->
          </div>
          <div class="extra-info">
            <label class="title">alterTime</label>
            <label class="email" v-text="driver.alterTime"></label>
          </div>
        </div>
      </div>
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
    </div>
  </div>
</template>

<script lang="ts">
import welcomeHeader from "../../components/header.vue";
import navigationBar from "../../components/navigationBar.vue";
import ytTable from "../../components/yt-table.vue";
import { searchDrivers, deleteDrivers } from "../../api/fleet/driver";

export default {
  name: "driver",
  data() {
    return {
      search: "",
      paginationConfig: {
        currentPage: 1, // 当前页码
        pageSize: 12, // 每页显示的条数
        pageCount: 1, //总共有多少页
        total: 1, // 总条数
      },
      driverList: [
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
  components: { welcomeHeader, navigationBar, ytTable },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      searchDrivers(
        this.paginationConfig.currentPage,
        this.paginationConfig.pageSize
      )
        .then((res: any) => {
          console.log(res);
          this.driverList = res.data.list;
          this.paginationConfig.total = Number(res.data.total);
          this.paginationConfig.pageCount = Number(res.data.pageNum);
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
    //删除驾驶员
    handleDelete(userId: number) {
      let that = this;
      deleteDrivers(userId)
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
  },
};
</script>

<style scoped lang="scss">
@import "../../assets/style/css/user.scss";

</style>
