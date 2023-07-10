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
      <el-table
        :data="team"
        class="table"
        tooltip-effect="dark"
        highlight-current-row
        @row-click="clickRow"
        :cell-style="{ 'background-color': 'transparent' }"
        :row-style="rowStyle"
        :pagination="paginationConfig"
      >
        <el-table-column type="selection" width="50"> </el-table-column>
        <el-table-column label="车队编号" width="100" prop="teamId">
        </el-table-column>
        <el-table-column label="车队名" width="180" prop="teamName">
        </el-table-column>
        <el-table-column label="队长" width="180" prop="leader">
        </el-table-column>
        <el-table-column label="标记" width="180" prop="remark">
        </el-table-column>
        <el-table-column label="登记日期" width="180" prop="checkInTime">
        </el-table-column>
        <el-table-column label="操作">
          <el-button size="default" @click="editRow">编辑</el-button>
          <el-button size="default" type="danger" @click="deleteRow"
            >删除</el-button
          >
        </el-table-column>
      </el-table>
    </div>

    <div v-if="showMask" class="mask"></div>
    <div class="editForm" v-if="showEditForm">
      <label class="title">编辑车队信息</label>
      <div>
        <div class="edit-item">
          <label>车队编号</label>
          <el-input type="text" class="editInput" v-model="edit_team.teamId" />
        </div>
        <div class="edit-item">
          <label>车队名</label>
          <el-input
            type="text"
            class="editInput"
            v-model="edit_team.teamName"
          />
        </div>
        <div class="edit-item">
          <label>队长</label>
          <el-input type="text" class="editInput" v-model="edit_team.leader" />
        </div>
        <div class="edit-item">
          <label>标记</label>
          <el-input type="text" class="editInput" v-model="edit_team.remark" />
        </div>
        <div class="edit-item">
          <label>登记日期</label>
          <el-input
            type="text"
            class="editInput"
            v-model="edit_team.checkInTime"
          />
        </div>
      </div>
      <div class="editBtns">
        <el-button
          size="default"
          type="primary"
          @click="confirmEdit"
          class="editBtn"
          >提交</el-button
        >
        <el-button size="default" @click="cancelEdit" class="editBtn"
          >取消</el-button
        >
      </div>
    </div>
    <div class="deleteForm" v-if="showDeleteForm">
      <p>编辑表单</p>
    </div>
  </div>
</template>

<script lang="ts">
import welcomeHeader from "../../components/header.vue";
import { defineComponent } from "vue";

export default defineComponent({
  name: "team",
  components: { welcomeHeader },
  data() {
    return {
      paginationConfig: {
        currentPage: 1, // 当前页码
        pageSize: 2, // 每页显示的条数
        total: 3, // 总条数
      },
      team: [
        {
          teamId: "1",
          teamName: "冲冲队",
          leader: "张三",
          remark: "1",
          checkInTime: "2022/07/04",
          isDelete: "1",
          alterTime: "2022/07/04",
        },
        {
          teamId: "2",
          teamName: "宝宝队",
          leader: "李四",
          remark: "1",
          checkInTime: "2022/07/04",
          isDelete: "1",
          alterTime: "2022/07/04",
        },
        {
          teamId: "3",
          teamName: "丫丫队",
          leader: "王五",
          remark: "1",
          checkInTime: "2022/07/04",
          isDelete: "1",
          alterTime: "2022/07/04",
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
  mounted() {},
  methods: {
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
.container {
  .content {
    margin-left: $Mleft;
    height: $max_height;
    //background-color: $back_color;
    background-color: #f6f6f6;
  }
}

.block-list {
  margin-top: 20px;
  margin-left: 50px;
  display: flex;

  .block1 {
    width: 700px;
    height: 150px;
    margin-left: 20px;
    border-radius: 20px;
    background-image: url("../../assets/images/loginBgi.png");
    background-size: cover;
  }

  .block2,
  .block3 {
    margin-left: 30px;
    width: 370px;
    height: 150px;
    border-radius: 20px;
    background-color: #ffffff;
  }
}

.table {
  border-radius: 20px;
  width: 1500px;
  margin-top: 20px;
  margin-left: 70px;
}

.mask {
  background-color: rgb(0, 0, 0);
  opacity: 0.3;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 3;
}

.editForm {
  position: fixed;
  display: grid;
  top: 300px;
  left: 630px;
  width: 650px;
  height: auto;
  border-radius: 20px;
  background-color: $back_color;
  z-index: 4;
  .title {
    font-size: 30px;
    margin: 30px auto;
  }
  .edit-item {
    display: flex;
    margin: 20px 0 auto;
    label {
      font-size: 18px;
      margin-left: 120px;
      margin-right: 20px;
      width: 100px;
      text-align: right;
    }
    .editInput {
      width: 250px;
    }
  }
  .editBtns {
    width: 333px;
    margin: 30px auto;
    display: flex;
    justify-content: space-between;
    .editBtn {
      width: 120px;
    }
  }
}
</style>
