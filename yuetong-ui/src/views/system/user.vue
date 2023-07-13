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
        </div>
      </div>

      <div class="user-main">
        <div
          class="user-block"
          v-for="(user, index) in userList"
          :key="user.account"
        >
          <div class="basic-info">
            <el-avatar
              type="image"
              src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
              class="image"
              @click="detailsClick(index)"
              style="cursor: pointer"
            ></el-avatar>

            <div class="right-info">
              <label v-text="user.username" class="username"></label>
              <label v-text="'#' + user.roleId" class="role"></label>
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
                      @click="changeAuthority(index)"
                    >
                      <Avatar />
                    </el-icon>
                  </template>
                </el-popover>

                <el-popover
                  placement="top-start"
                  title="联系方式"
                  :width="20"
                  trigger="hover"
                  :content="user.phone"
                >
                  <template #reference>
                    <el-icon :size="30" :color="'#0e6f64'" class="icon">
                      <PhoneFilled />
                    </el-icon>
                  </template>
                </el-popover>
                <el-popover
                  placement="top-start"
                  title="用户名"
                  :width="20"
                  trigger="hover"
                  :content="user.account"
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
                  <el-icon>
                    <CloseBold />
                  </el-icon>
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
          @current-change="handlePageChange"
        />
      </div>
    </div>
  </div>
  <el-dialog title="修改权限" v-model="dialogTableVisible">
    <div style="margin-top: -20px">
      <span style="font-size: 20px">当前用户ID：{{ currentUser.userId }}</span>
      <span style="font-size: 20px; margin-left: 10%"
        >当前用户：{{ currentUser.username }}</span
      >
      <span style="font-size: 20px; margin-left: 10%"
        >当前权限：{{ currentUser.roleId }}</span
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
      >提交
    </el-button>
  </el-dialog>
  <div class="mask" v-if="showMask"></div>
  <div class="details" v-if="showDetails">
    <div class="form-title">
      <label>用户信息详情</label>
      <el-button type="danger" class="closeBtn" @click="closeForm"
        >关闭</el-button
      >
    </div>
    <template class="form-info">
      <el-descriptions
        :title="'用户信息 编号：#' + currentUser.userId"
        direction="vertical"
        size="large"
        :column="3"
        border
      >
        <el-descriptions-item label="姓名">{{
          currentUser.username
        }}</el-descriptions-item>
        <el-descriptions-item label="性别">{{
          currentUser.sex
        }}</el-descriptions-item>
        <el-descriptions-item label="权限角色">{{
          currentUser.roleId
        }}</el-descriptions-item>
        <el-descriptions-item label="联系方式">{{
          currentUser.phone
        }}</el-descriptions-item>
        <el-descriptions-item label="邮箱">{{
          currentUser.email
        }}</el-descriptions-item>
        <el-descriptions-item label="登记时间">{{
          currentUser.checkInTime
        }}</el-descriptions-item>
        <el-descriptions-item label="更新时间">{{
          currentUser.alterTime
        }}</el-descriptions-item>
        <el-descriptions-item label="昵称">{{
          currentUser.username
        }}</el-descriptions-item>
        <el-descriptions-item label="密码">{{
          currentUser.password
        }}</el-descriptions-item>
        <el-descriptions-item label="备注">
          <el-tag size="small">{{ currentUser.remark }}</el-tag>
        </el-descriptions-item>
      </el-descriptions>
    </template>
  </div>
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
import axios from "axios";

export default defineComponent({
  name: "user",
  data() {
    return {
      search: "",
      fileList: [],
      dialogTableVisible: false,
      showMask: false,
      showDetails: false,
      authority: {
        value: 1,
        label: "系统管理员",
      },
      currentUser: {
        role: "系统管理员",
        image:"https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png",
        roleId: 1,
        userId: 1,
        account: "abc",
        password: "123",
        username: "hahah",
        sex: "男",
        phone: "123",
        email: "123@qq.com",
        checkInTime: "2023-07-06 03:13:01",
        alterTime: "2023-07-06 03:13:11",
      },
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
          role: "系统管理员",
          image:
            "https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png",
          roleId: 1,
          userId: 1,
          account: "abc",
          password: "123",
          username: "hahah",
          sex: "男",
          phone: "123",
          email: "123@qq.com",
          checkInTime: "2023-07-06 03:13:01",
          alterTime: "2023-07-06 03:13:11",
        },
      ],

      authorities: [
        {
          value: 1,
          label: "系统管理员",
        },
        {
          value: 2,
          label: "运输管理员",
        },
        {
          value: 3,
          label: "承运业务员",
        },
        {
          value: 4,
          label: "调度员",
        },
        {
          value: 5,
          label: "财务人员",
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
          let user = JSON.parse(sessionStorage.getItem("user") || "{}");
          this.authority.value = user.roleId;
          this.authority.label = user.roleName;
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
    changeAuthority(index: number) {
      this.currentUser = this.userList[index];
      this.dialogTableVisible = true;
    },
    //提交修改权限
    updateAuthority() {
      updateUser(this.currentUser.userId, this.authority.value)
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

    uploadFile(item:any){
      let user = JSON.parse(sessionStorage.getItem("user") || "{}");
      const formData = new FormData();
      formData.append("file", item.file);
      let config = {
        method: 'post',
        url: '/api/system/user/importUser',
        headers: {
          'satoken': user.tokenInfo.tokenValue,
          'Accept': '*/*',
          'Connection': 'keep-alive',
          'Content-Type': 'multipart/form-data; boundary=--------------------------725311584525032455700542',
        },
        data : formData
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

    //点击block查看用户详情信息
    detailsClick(index: number) {
      this.currentUser = this.userList[index];
      this.showMask = true;
      this.showDetails = true;
    },
    closeForm() {
      this.showMask = false;
      this.showDetails = false;
    },
  },
});
</script>

<style scoped lang="scss">
@import "../../assets/style/css/user.scss";
</style>
