<template>
  <div class="container">
    <navigationBar />
    <div class="content">
      <welcomeHeader />
      <div class="block-list">
        <div class="block1"></div>
        <div class="block2"></div>
        <div class="block3"></div>
      </div>
      <!-- <el-table
          :data="teamList"
          class="table"
          tooltip-effect="dark"
          highlight-current-row
          @row-click="clickRow"
          :cell-style="{ 'background-color': 'transparent' }"
          :row-style="rowStyle"
          :pagination="paginationConfig"
      >
        <el-table-column type="selection" width="50"></el-table-column>
        <el-table-column label="车队编号" width="100" prop="carriersID">
        </el-table-column>
        <el-table-column label="车队名" width="180" prop="sendCompany">
        </el-table-column>
        <el-table-column label="队长" width="180" prop="sendLinkman">
        </el-table-column>
        <el-table-column label="标记" width="180" prop="sendPhone">
        </el-table-column>
        <el-table-column label="登记日期" width="180" prop="checkInTime">
        </el-table-column>
        <el-table-column label="操作">
          <el-button size="default" @click="editRow">编辑</el-button>
          <el-button size="default" type="danger" @click="deleteRow"
          >删除
          </el-button
          >
        </el-table-column>
      </el-table> -->
      <el-row style="margin-left: 20px;">
        <el-col
          class="card"
          v-for="(team, index) in teamList"
          :key="index"
          :span="3"
        >
          <el-card :body-style="{ padding: '10px', height:'250px',}">
            <span style="font-size: 24px;">{{ team.teamName }}</span>
            <br />
            <span style="font-size: 15px; margin-left: 45%;">队伍序号：{{ team.teamId }}</span>
            <br />
            <span>队长： {{ team.leader }}</span>
            <br />
            <span> 备注：{{ team.remark }}</span>
            <div style="padding: 14px">
              <div class="bottom">
                <time class="time">登记日期：{{ team.checkInTime }}</time>
                <el-button text class="button">Operating</el-button>
                
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>
      <!-- 分页 -->
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
import { teamInfo } from "../../api/fleet/team";

export default defineComponent({
  name: "team",
  components: { welcomeHeader, navigationBar },
  data() {
    return {
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
      teamInfo( this.paginationConfig.currentPage,
        this.paginationConfig.pageSize).then((res: any) => {
        console.log(res);
        this.teamList = res.data.list;
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
