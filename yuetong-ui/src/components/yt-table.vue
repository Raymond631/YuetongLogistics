<template>
  <div class="container">
    <div class="content">
      <el-table
        :data="tableContent"
        class="table"
        tooltip-effect="dark"
        highlight-current-row
        @row-click="clickRow"
        :cell-style="cellStyle"
        :row-style="{ background: 'rgba(251,251,251)' }"
        :height="tableHeight"
      >
        <div v-for="column in tableInfo.columns" :key="column">
          {{ column.column }}
        </div>
        <el-table-column type="selection" v-if="tableInfo.select">
        </el-table-column>
        <el-table-column
          v-for="column in tableInfo.columns"
          :key="column"
          :label="column.label"
          :prop="column.content"
        >
        </el-table-column>
        <el-table-column
          prop="tag"
          label="状态"
          width="100"
          filter-placement="bottom-end"
          v-if="tableInfo.tag"
        >
          <template #default="scope">
            <el-tag
              :type="
                scope.row.status == 'failed'
                  ? 'danger'
                  : scope.row.status == 'success'
                  ? 'success'
                  : scope.row.status == 2
                  ? 'info'
                  : ''
              "
              disable-transitions
              >{{ scope.row.status }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column v-if="tableInfo.action" label="操作">
          <el-button
            size="default"
            type="info"
            @click="specificInfo"
            v-if="tableInfo.actions.specific"
            >详情</el-button
          >
          <el-button
            size="default"
            @click="editRow"
            v-if="tableInfo.actions.edit"
            >编辑</el-button
          >
          <el-button
            size="default"
            type="danger"
            @click="deleteRow"
            v-if="tableInfo.actions.delete"
            >删除</el-button
          >
        </el-table-column>
      </el-table>
      <!-- 分页 -->
<!--      <div class="page">-->
<!--        <el-pagination-->
<!--            v-model:currentPage="paginationConfig.currentPage"-->
<!--            layout="total, prev, pager, next"-->
<!--            :page-size="paginationConfig.pageSize"-->
<!--            :total="paginationConfig.total"-->
<!--            :page-count="paginationConfig.pageCount"-->
<!--            @current-change="handlePageChange"-->
<!--        />-->
<!--      </div>-->
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
import { defineComponent } from "vue";

export default defineComponent({
  name: "yt-table",
  data() {
    return {

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
  props: ["tableInfo", "tableContent", "tableHeight" ,"paginationConfig" ,"handlePageChange"],
  mounted() {
    console.log('tableinfo中的prop值为：',this.tableInfo);
  },
  methods: {
    goBack() {},
    //选中该行数据
    clickRow(row: any) {
      console.log(row);
      this.selectedRow = row;
    },

    cellStyle({ row }: any) {
      if (row === this.selectedRow) {
        console.log("添加样式......" + row.id);
        return {
          background: "#ffffff",
          "box-shadow": "13px 13px 15px  #cecece",
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

    specificInfo() {},

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
@import "../assets/style/components/yt-table.scss";

.table {
  border-radius: 20px;
  width: 100%;
  margin-top: 20px;
  .el-table_1_column_2 .el-table__cell {
    background-color: aqua;
  }
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
