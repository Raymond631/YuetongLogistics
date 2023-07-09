<template>

  <div class="block-list">
    <div class="search">
      <el-input type="text" class="search-input" v-model="search" placeholder="请搜索用户"></el-input>
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
    <div class="user-block" v-for="user in userList">
      <div class="basic-info">
        <el-avatar type="image" :src="user.image" class="image"></el-avatar>
        <div class="right-info">
          <label v-text="user.username" class="username"></label>
          <label v-text="'#'+user.role" class="role"></label>
          <div class="icons">
            <el-icon :size="35" :color="'#0e6f64'" class="icon">
              <Avatar/>
            </el-icon>
            <el-icon :size="35" :color="'#0e6f64'" class="icon">
              <PhoneFilled/>
            </el-icon>
            <el-icon :size="35" :color="'#0e6f64'" class="icon">
              <ChatLineRound/>
            </el-icon>
          </div>
        </div>
        <el-icon :size="30" class="more">
          <More/>
        </el-icon>
      </div>
      <div class="extra-info">
        <label class="title">Email</label>
        <label class="email" v-text="user.email"></label>
      </div>
    </div>

  </div>

</template>

<script>
import welcomeHeader from "../../components/header.vue";

export default {
  name: "truck",
  components: {welcomeHeader},
  data() {
    return {
      search: '',
      userList: [
        {
          image: 'https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg',
          username: '彭狗',
          role: '调度员',
          sex: '男',
          phone: '19573135235',
          email: '1139040315@qq.com',
        },
        {
          image: 'https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg',
          username: '彭狗',
          role: '调度员',
          sex: '男',
          phone: '19573135235',
          email: '1139040315@qq.com',
        },
        {
          image: 'https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg',
          username: '彭狗',
          role: '调度员',
          sex: '男',
          phone: '19573135235',
          email: '1139040315@qq.com',
        },
        {
          image: 'https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg',
          username: '彭狗',
          role: '调度员',
          sex: '男',
          phone: '19573135235',
          email: '1139040315@qq.com',
        },
        {
          image: 'https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg',
          username: '彭狗',
          role: '调度员',
          sex: '男',
          phone: '19573135235',
          email: '1139040315@qq.com',
        },
        {
          image: 'https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg',
          username: '彭狗',
          role: '调度员',
          sex: '男',
          phone: '19573135235',
          email: '1139040315@qq.com',
        },
        {
          image: 'https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg',
          username: '彭狗',
          role: '调度员',
          sex: '男',
          phone: '19573135235',
          email: '1139040315@qq.com',
        },
        {
          image: 'https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg',
          username: '彭狗',
          role: '调度员',
          sex: '男',
          phone: '19573135235',
          email: '1139040315@qq.com',
        },
        {
          image: 'https://img02.sogoucdn.com/app/a/100520093/8379901cc65ba509-45c21ceb904429fc-e8e0ced72c7814e527ca276e0fe48673.jpg',
          username: '彭狗',
          role: '调度员',
          sex: '男',
          phone: '19573135235',
          email: '1139040315@qq.com',
        },
      ],

    }
  }


}
</script>

<style scoped lang="scss">

@mixin font {
  font-family: "Microsoft YaHei", sans-serif;
  font-size: 20px;
}

@mixin action {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 30%;
  height: 60px;
  @include font;
  border-radius: 15px;
  margin-left: 60px;
}

.block-list {
  margin: 0 auto;
  width: 100%;
  height: 200px;
  display: flex;
  justify-content: space-between;

  .search {
    margin-top: 50px;
    margin-left: 50px;
    width: 30%;

    .search-input {
      height: 60px;
      font-size: 20px;
    }
  }

  .actions {
    margin-top: 50px;
    margin-right: 100px;
    width: 50%;
    display: flex;
    justify-content: right;

    .action1 {
      color: $theme_color;
      border: 2px solid $theme_color;
      background-color: #eff4f4;
      @include action;
    }

    .action2 {
      color: #ffffff;
      border: 2px solid $theme_color;
      background-color: $theme_color;
      @include action;
    }

  }
}

@mixin bold_font {
  font-family: "Microsoft YaHei", sans-serif;
  font-size: 25px;
  font-weight: bold;
}

.user-main {
  margin-left: 50px;
  width: 1530px;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  overflow: hidden;

  .user-block {
    margin-right: 32px;
    margin-bottom: 30px;
    width: 350px;
    height: 200px;
    border-radius: 30px;
    background-color: #ffffff;
    display: grid;

    .basic-info {
      display: flex;

      .image {
        margin-top: 20px;
        margin-left: 20px;
        width: 90px;
        height: 90px;
      }

      .right-info {
        display: grid;
        margin-top: 20px;
        margin-left: 30px;

        .username {
          @include bold_font;
          height: 30px;
        }

        .role {
          font-family: "Microsoft YaHei", sans-serif;
          font-size: 15px;
          color: #0e6f64;
        }

        .icons {
          .icon {
            margin-right: 20px;
          }
        }
      }

      .more {
        margin-top: 20px;
      }
    }

    .extra-info {
      margin-left: 20px;
      display: grid;

      .email {
        font-family: "宋体", sans-serif;
        font-size: 20px;
        font-weight: bold;
      }

    }

  }


}


</style>
