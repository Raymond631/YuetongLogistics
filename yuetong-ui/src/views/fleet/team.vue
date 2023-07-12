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
            <label>查看所有</label>
          </div>
          <el-popconfirm
            title="选择筛选项"
            confirm-button-text="空闲"
            cancel-button-text="运输中"
          >
            <template #reference>
              <div class="action2">
                <label>筛选</label>
              </div>
            </template>
          </el-popconfirm>
        </div>
      </div>
      <div class="card" v-for="(team, index) in teamList" :key="index">
        <div class="car_id">
          {{ team.teamName }}
          <span style="margin-left: 20px">
            <el-tag size="small">{{ team.teamId }}</el-tag></span
          >
        </div>
        <el-popconfirm
          title="这是一段内容确定删除吗？"
          @confirm="handleDelete(team.teamId)"
        >
          <template #reference>
            <el-button type="danger" class="car_delete">删除</el-button>
          </template>
        </el-popconfirm>
        <div class="car_number">队长： {{ team.leader }}</div>
        <div class="car_remark">备注：{{ team.remark }}</div>
        <!-- 下面可以直接写成table -->
        <!-- <div class="car_time_buy">
          购车时间：<span style="margin-left: 30px">{{ truck.buyDate }}</span>
        </div>
        <div class="car_time_check">
          登入时间：<span style="margin-left: 30px">{{
            truck.checkInTime
          }}</span>
        </div>
        <div class="car_time_update">
          更新时间：<span style="margin-left: 30px">{{ truck.alterTime }}</span>
        </div> -->
      </div>
      <!-- 分页 -->
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
    <div v-if="showMask" class="mask"></div>
    <div class="editForm" v-if="showEditForm">
      <label class="form-title">编辑车队信息</label>
      <div>
        <div class="form-item">
          <label>车队编号</label>
          <el-input type="text" class="form-input" v-model="edit_team.teamId" />
        </div>
        <div class="form-item">
          <label>车队名</label>
          <el-input
            type="text"
            class="form-input"
            v-model="edit_team.teamName"
          />
        </div>
        <div class="form-item">
          <label>队长</label>
          <el-input type="text" class="form-input" v-model="edit_team.leader" />
        </div>
        <div class="form-item">
          <label>标记</label>
          <el-input type="text" class="form-input" v-model="edit_team.remark" />
        </div>
        <div class="form-item">
          <label>登记日期</label>
          <el-input
            type="text"
            class="form-input"
            v-model="edit_team.checkInTime"
          />
        </div>
      </div>
      <div class="actionBtns">
        <el-button
          size="default"
          type="primary"
          @click="confirmEdit"
          class="actionBtn btn1"
          >提交
        </el-button>
        <el-button size="default" @click="cancelEdit" class="actionBtn btn2"
          >取消
        </el-button>
      </div>
    </div>
    <div class="deleteForm" v-if="showDeleteForm">
      <p>编辑表单</p>
    </div>
  </div>
</template>

<script lang="ts">
import navigationBar from "../../components/navigationBar.vue";
import welcomeHeader from "../../components/header.vue";
import { defineComponent } from "vue";
import { teamInfo, teamDelete } from "../../api/fleet/team";

export default defineComponent({
  name: "team",
  components: { welcomeHeader, navigationBar },
  data() {
    return {
      search: "",
      paginationConfig: {
        currentPage: 1, // 当前页码
        pageSize: 10, // 每页显示的条数
        pageCount: 1, //总共有多少页
        total: 1, // 总条数
      },
      teamList: [
        {
          teamId: 1,
          teamName: "hhh",
          leader: "清",
          remark: "无",
          checkInTime: "2023-07-11 07:27:34",
          alterTime: "2023-07-11 07:27:37",
        },
      ],
      truckList: [
        {
          truckId: 1,
          number: "湘A12345",
          buyDate: "2022-10-01",
          truckType: "大货车",
          tonnage: 20,
          fkTeamId: 1,
          state: "Working",
          remark: "无",
          checkInTime: "2023-07-11 07:27:34",
          alterTime: "2023-07-11 07:27:37",
        },
      ],
      edit_team: {
        teamId: "",
        teamName: "",
        leader: "",
        remark: "",
        checkInTime: "",
        isDelete: "",
        alterTime: "",
      },
      //当前选中行
      selectedRow: null,
      //所有复选框选中值
      multipleSelection: [],
      //编辑页面
      showMask: false,
      showEditForm: false,
      showDeleteForm: false,
    };
  },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      let that = this;
      teamInfo(
        this.paginationConfig.currentPage,
        this.paginationConfig.pageSize
      ).then((res: any) => {
        console.log(res);
        res.data.list.forEach(function (item: any) {
          that.teamList.push(item.truckTeam);
          that.truckList.push(item.truckList) ;
        });

        this.paginationConfig.total = Number(res.data.total);
        this.paginationConfig.pageCount = Number(res.data.pageNum);
      });
    },

    handleCurrentChange(val: number) {
      this.paginationConfig.currentPage = val;
      this.ready();
    },

    //选中该行数据
    clickRow(row: any) {
      console.log(row);
      this.selectedRow = row;
    },

    rowStyle({ row }: any) {
      if (row === this.selectedRow) {
        console.log("添加样式......" + row.teamId);
        return {
          background: "#f6f6f6",
          "box-shadow": "13px 13px 30px #cecece",
        };
      }
      return "";
    },
    handleDelete(teamId: number) {
      let that = this;
      teamDelete(teamId)
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
    //编辑
    editRow() {
      console.log("点击编辑......");
      this.showMask = true;
      this.showEditForm = true;
    },
    //删除
    deleteRow() {},

    //编辑表单的确认和取消按钮
    confirmEdit() {
      window.confirm("编辑成功");
      this.showMask = false;
      this.showEditForm = false;
    },
    cancelEdit() {
      this.showMask = false;
      this.showEditForm = false;
    },
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../assets/style/css/team.scss";
.time {
  font-size: 12px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.button {
  padding: 0px;
  // margin-top: 30px;
}

.card {
  margin: 10px;
  margin-left: 50px;
  height: 250px;
  width: 250px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  cursor: pointer;
}
</style>
