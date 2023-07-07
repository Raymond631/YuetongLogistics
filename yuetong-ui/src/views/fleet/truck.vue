<template>
  <div class="container">
    <navigationBar/>
    <div class="content">
      <welcomeHeader/>



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

      <div class="user-block">

      </div>


    </div>
  </div>


</template>

<script>
import welcomeHeader from "../../components/header.vue";

export default {
  name: "truck",
  components: {welcomeHeader},
  data(){
    return {
      search:'',
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

@mixin font{
  font-family: "Microsoft YaHei", sans-serif;
  font-size: 20px;
}
.block-list {
  margin:0 auto;
  width: 90%;
  height: 200px;
  display: flex;
  .search{
    margin-top: 50px;
    width:30%;
    .search-input{
      height:60px;
      font-size:20px;
    }
  }
  .actions{
    width:50%;
    display: flex;

    .action1,.action2{
      display: flex;
      justify-content: center;
      align-items: center;
      width:20%;
      height:60px;
      @include font;
      color:$theme_color;
      border: 2px solid $theme_color;
      border-radius:15px;
      background-color: #eff4f4;
    }
  }
}

.user-block{

}


</style>
