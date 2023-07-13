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
            placeholder="请搜索车队"
          ></el-input>
        </div>
        <div class="actions">
          <el-upload
            ref="uploadForm"
            :http-request="uploadFile"
            :limit="1"
            accept="*.xlsx"
            action="string"
            multiple
          >
            <el-button size="small" class="action2" type="primary">
              <span class="iconfont icon-shangchuan" />上传文件
            </el-button>
          </el-upload>
          <div class="action1">
            <label>查看所有</label>
          </div>
          <el-popconfirm
            title="选择筛选项"
            confirm-button-text="空闲"
            cancel-button-text="运输中"
          >
<!--            <template #reference>-->
<!--              <div class="action2">-->
<!--                <label>筛选</label>-->
<!--              </div>-->
<!--            </template>-->
          </el-popconfirm>
        </div>
      </div>
      <div
        class="card"
        v-for="(team, index) in teamList"
        :key="index"
        @click="forDetails(index)"
      >
        <div class="car_id">
          {{ team.truckTeam.teamName }}
          <span style="margin-left: 20px">
            <el-tag size="small">{{ team.truckTeam.teamId }}</el-tag></span
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
        <div class="car_number">队长： {{ team.truckTeam.leader }}</div>
        <div class="car_remark">备注：{{ team.truckTeam.remark }}</div>
        <!-- 下面可以直接写成table -->
        <el-table
          :data="team.truckList"
          class="truckList"
          style="font-size: 16px"
        >
          <el-table-column
            prop="number"
            label="车牌"
            width="80px"
          ></el-table-column>
          <el-table-column prop="truckType" label="车型"></el-table-column>
          <el-table-column prop="tonnage" label="吨位"></el-table-column>
        </el-table>
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
      <p>删除表单</p>
    </div>
    <div class="detailsForm" v-if="showDetailsForm">
      <div class="form-title">
        <label>车队详情</label>
        <el-button type="danger" class="closeBtn" @click="cancelEdit"
          >关闭</el-button
        >
      </div>
      <template class="form-info">
        <el-descriptions
          :title="'车队信息 编号：#' + currentTeam.truckTeam.teamId"
          direction="vertical"
          size="large"
          :column="4"
          border
        >
          <el-descriptions-item label="车队名">{{
            currentTeam.truckTeam.teamName
          }}</el-descriptions-item>
          <el-descriptions-item label="队长">{{
            currentTeam.truckTeam.leader
          }}</el-descriptions-item>
          <el-descriptions-item label="备注">{{
            currentTeam.truckTeam.remark
          }}</el-descriptions-item>
          <el-descriptions-item label="登记时间">{{
            currentTeam.truckTeam.checkInTime
          }}</el-descriptions-item>
        </el-descriptions>
        <label class="goods-title">车辆信息</label>
        <el-table :data="currentTeam.truckList" style="font-size: 16px">
          <el-table-column
            prop="number"
            label="车牌"
            width="80px"
          ></el-table-column>
          <el-table-column prop="truckType" label="车型"></el-table-column>
          <el-table-column prop="tonnage" label="吨位"></el-table-column>
          <el-table-column prop="tonnage" label="空闲状态"></el-table-column>
          <el-table-column prop="tonnage" label="登记日期"></el-table-column>
          <el-table-column prop="tonnage" label="购买日期"></el-table-column>
        </el-table>
      </template>
    </div>
  </div>
</template>

<script lang="ts">
import navigationBar from "../../components/navigationBar.vue";
import welcomeHeader from "../../components/header.vue";
import { defineComponent } from "vue";
import { teamInfo, teamDelete } from "../../api/fleet/team";
import axios from "axios";

export default defineComponent({
  name: "team",
  components: { welcomeHeader, navigationBar },
  data() {
    return {
      search: "",
      data: "",
      paginationConfig: {
        currentPage: 1, // 当前页码
        pageSize: 8, // 每页显示的条数
        pageCount: 1, //总共有多少页
        total: 1, // 总条数
      },
      teamList: [
        {
          truckTeam: {
            teamId: 1,
            teamName: "hhh",
            leader: "清",
            remark: "无",
            checkInTime: "2023-07-11 07:27:34",
            alterTime: "2023-07-11 07:27:37",
          },
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
        },
      ],
      currentTeam: {
        truckTeam: {
          teamId: 1,
          teamName: "hhh",
          leader: "清",
          remark: "无",
          checkInTime: "2023-07-11 07:27:34",
          alterTime: "2023-07-11 07:27:37",
        },
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
      },
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
      //编辑页面
      showMask: false,
      showEditForm: false,
      showDetailsForm: false,
      showDeleteForm: false,
    };
  },
  mounted() {
    this.ready();
  },
  methods: {
    ready() {
      teamInfo(
        this.paginationConfig.currentPage,
        this.paginationConfig.pageSize
      ).then((res: any) => {
        console.log(res);
        this.teamList = res.data.list;
        this.paginationConfig.total = Number(res.data.total);
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
    uploadFile(item: any) {
      let user = JSON.parse(sessionStorage.getItem("user") || "{}");
      const formData = new FormData();
      formData.append("file", item.file);
      let config = {
        method: "post",
        url: "/api/fleet/team/importTeam",
        headers: {
          satoken: user.tokenInfo.tokenValue,
          Accept: "*/*",
          Connection: "keep-alive",
          "Content-Type":
            "multipart/form-data; boundary=--------------------------725311584525032455700542",
        },
        data: formData,
      };
      axios(config)
        .then(function (response) {
          alert('上传成功')
          console.log(JSON.stringify(response.data));
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    //编辑表单的确认和取消按钮
    confirmEdit() {
      window.confirm("编辑成功");
      this.showMask = false;
      this.showEditForm = false;
    },
    cancelEdit() {
      this.showMask = false;
      this.showEditForm = false;
      this.showDetailsForm = false;
    },

    forDetails(index: number) {
      this.currentTeam = this.teamList[index];
      this.showMask = true;
      this.showDetailsForm = true;
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
