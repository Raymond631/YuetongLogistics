<template>
  <div class="container">
    <navigationBar/>
    <div class="content">
      <welcomeHeader/>
      <div class="block-list">
        <div class="block1">
        </div>
        <div class="block2">
        </div>
        <div class="block3">
        </div>
      </div>
      <el-table :data="team" class="table" tooltip-effect="dark"
                highlight-current-row
                @row-click="clickRow"
                @row-class-name="addRowStyle">
        <el-table-column type="selection" width="50">
        </el-table-column>
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
          <el-button size="default" type="danger" @click="deleteRow">删除</el-button>
        </el-table-column>
      </el-table>
    </div>

    <div v-if="showMask" class="mask">
    </div>
    <div class="editForm" v-if="showEditForm">
      <label class="title">编辑车队信息</label>
      <div>
        <div class="edit-item">
          <label>车队编号</label>
          <input type="text" class="editInput"  v-model="edit_team.teamId"/>
        </div>
        <div class="edit-item">
          <label>车队名</label>
          <input type="text" class="editInput"  v-model="edit_team.teamName"/>
        </div>
        <div class="edit-item">
          <label>队长</label>
          <input type="text" class="editInput"  v-model="edit_team.leader"/>
        </div>
        <div class="edit-item">
          <label>标记</label>
          <input type="text" class="editInput"  v-model="edit_team.remark"/>
        </div>
        <div class="edit-item">
          <label>登记日期</label>
          <input type="text" class="editInput"  v-model="edit_team.checkInTime"/>
        </div>
      </div>
      <div class="editBtns">
        <el-button size="default" type="primary" @click="confirmEdit">提交</el-button>
        <el-button size="default" @click="cancelEdit">取消</el-button>
      </div>
    </div>
    <div class="deleteForm" v-if="showDeleteForm">
      <p>编辑表单</p>
    </div>
  </div>

</template>

<script>
import welcomeHeader from "../../components/header.vue";
import {computed} from "vue";

export default {
  name: "team",
  components: {welcomeHeader},
  data() {
    return {
      team: [
        {
          teamId: '1',
          teamName: '冲冲队',
          leader: '张三',
          remark: '1',
          checkInTime: '2022/07/04',
          isDelete: '1',
          alterTime: '2022/07/04',
        },
        {
          teamId: '2',
          teamName: '宝宝队',
          leader: '李四',
          remark: '1',
          checkInTime: '2022/07/04',
          isDelete: '1',
          alterTime: '2022/07/04',
        },
        {
          teamId: '3',
          teamName: '丫丫队',
          leader: '王五',
          remark: '1',
          checkInTime: '2022/07/04',
          isDelete: '1',
          alterTime: '2022/07/04',
        },
      ],
      edit_team:{
        teamId: '',
        teamName: '',
        leader: '',
        remark: '',
        checkInTime: '',
        isDelete: '',
        alterTime: '',
      },
      //当前选中行
      currentTeamId: null,
      //所有复选框选中值
      multipleSelection: [],
      showMask: false,
      showEditForm:false,
      showDeleteForm:false,
    }
  },
  mounted() {
  },
  methods: {
    //选中该行数据
    clickRow(row) {
      console.log(row.teamId)
      this.currentTeamId = row.teamId
    },

    addRowStyle(row){
      console.log("修改样式......")
      if(row.teamId === this.this.currentTeamId){
        console.log("修改样式......")
        return "background-color: $theme_color;border-color: $theme_color;";
      }
    },

    //编辑
    editRow(){
      console.log("点击编辑......")
      this.showMask=true;
      this.showEditForm=true;
    },
    //删除
    deleteRow(){
    },

    //编辑表单的确认和取消按钮
    confirmEdit(){
      window.confirm("编辑成功")
      this.showMask=false;
      this.showEditForm=false;
    },
    cancelEdit(){
      this.showMask=false;
      this.showEditForm=false;
    }


  }

}
</script>

<style scoped lang="scss">
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

  .block2, .block3 {
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

.select-row {
  background-color: $theme_color;
  border-color: $theme_color;
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
  width:650px;
  height:400px;
  border-radius:20px;
  background-color: $back_color;
  z-index: 4;
}

</style>
