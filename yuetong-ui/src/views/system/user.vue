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
          <el-upload
            class="action2"
            action="http://192.168.3.107:10000/system/user/importUser"
            :on-preview="handlePreview"
            :on-remove="handleRemove"
            :before-remove="beforeRemove"
            multiple
            :limit="1"
            :on-exceed="handleExceed"
            :file-list="fileList"
            name="file"
          >
            <el-button size="small" class="action2_upload" type="primary">点击上传</el-button>
            
          </el-upload>
        </div>
      </div>

      <div class="user-main">
        <div class="user-block" v-for="user in userList" :key="user.account">
          <div class="basic-info">
            <el-avatar type="image" :src="user.image" class="image"></el-avatar>
            <div class="right-info">
              <label v-text="user.username" class="username"></label>
              <label v-text="'#' + user.role" class="role"></label>
              <div class="icons">
                <el-popover
                  placement="top-start"
                  title="修改用户权限"
                  :width="20"
                  trigger="hover"
                  :content="'当前权限:' + user.roleId"
                >
                  <template #reference>
                    <el-icon
                      :size="30"
                      :color="'#0e6f64'"
                      class="icon"
                      @click="
                        changeAuthority(user.userId, user.roleId, user.username)
                      "
                    >
                      <Avatar />
                    </el-icon>
                  </template>
                </el-popover>

                <el-popover
                  placement="top-start"
                  title="delete"
                  :width="20"
                  trigger="hover"
                  content="删除用户"
                >
                  <template #reference>
                    <el-icon :size="30" :color="'#0e6f64'" class="icon">
                      <PhoneFilled />
                    </el-icon>
                  </template>
                </el-popover>
                <el-popover
                  placement="top-start"
                  title="delete"
                  :width="20"
                  trigger="hover"
                  content="删除用户"
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
              @confirm="handleDelete(user.userId)"
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
            <label class="title">Email</label>
            <label class="email" v-text="user.email"></label>
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
  <el-dialog title="修改权限" v-model="dialogTableVisible">
    <div style="margin-top: -20px">
      <span style="font-size: 20px">当前用户ID：{{ currentUser }}</span>
      <span style="font-size: 20px; margin-left: 10%"
        >当前用户：{{ currentUsername }}</span
      >
      <span style="font-size: 20px; margin-left: 10%"
        >当前权限：{{ currentRole }}</span
      >
      <span style="font-size: 20px; margin-left: 10%; color: red"
        >修改权限：{{ authority.label }}</span
      >
    </div>

    <br />
    <el-select
      v-model="authority"
      class="m-2"
      placeholder="Select"
      size="large"
    >
      <el-option
        v-for="item in authorities"
        :key="item.value"
        :label="item.label"
        :value="item"
      />
    </el-select>
    <el-button
      type="primary"
      class="authorityUpdate"
      style="
        float: left;
        margin-top: -40px;
        margin-left: 80%;
        width: 100px;
        height: 40px;
      "
      @click="updateAuthority"
      >提交</el-button
    >
  </el-dialog>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import navigationBar from "../../components/navigationBar.vue";
import welcomeHeader from "../../components/header.vue";
import ytTable from "../../components/yt-table.vue";
import {
  searchUsers,
  deleteUser,
  updateUser,
  uploadUser,
} from "../../api/system/user";

export default defineComponent({
  name: "user",
  data() {
    return {
      search: "",
      fileList: [],
      dialogTableVisible: false,
      authority: {
        value: 1,
        label: "系统管理员",
      },
      currentUser: 1,
      currentRole: 1,
      currentUsername: "",
      currentRoleContent: "",
      paginationConfig: {
        currentPage: 1, // 当前页码
        pageSize: 12, // 每页显示的条数
        pageCount: 1, //总共有多少页
        total: 1, // 总条数
      },
      userList: [
        {
          userId: 123,
          roleId: 3,
          account: "yueyue",
          username: "yueyue",
          role: "系统管理员",
          image:
            "https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png",
          email: "",
        },
      ],
      authorities: [
        {
          value: 1,
          label: "系统管理员",
        },
        {
          value: 2,
          label: "普通用户",
        },
        {
          value: 3,
          label: "游客",
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
      searchUsers(
        this.paginationConfig.currentPage,
        this.paginationConfig.pageSize
      )
        .then((res: any) => {
          console.log(res);
          this.userList = res.data.list;
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
    handleDelete(userId: number) {
      let that = this;
      deleteUser(userId)
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
    //修改权限
    changeAuthority(user: number, role: number, username: string) {
      this.currentUser = user;
      this.currentRole = role;
      this.currentUsername = username;
      this.currentRoleContent;
      this.dialogTableVisible = true;
    },
    //提交修改权限
    updateAuthority() {
      updateUser(this.currentUser, this.authority.value)
        .then((res: any) => {
          console.log("update success");
          this.dialogTableVisible = false;
          //重新请求该页面数据
          this.ready();
        })
        .catch((err: any) => {
          console.log(err);
        });
    },
    //上传文件
      handleRemove(file:any, fileList:any) {
        console.log(file, fileList);
      },
      handlePreview(file:any) {
        console.log(file);
      },
      handleExceed(files:any, fileList:any) {
        alert(`当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`);
      },
      beforeRemove(file:any, fileList:any) {
        return alert(`确定移除 ${ file.name }？`);
      }
  },
});
</script>

<style scoped lang="scss">
@import "../../assets/style/css/user.scss";
</style>
