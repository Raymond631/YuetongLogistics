<template>
  login
  <el-button type="primary" @click="send">tijiao</el-button>
</template>

<script lang="ts">
import {login} from '../../api/User/login'

export default {
  name: 'login',
  data() {
    return {
      user:{
        account :1,
        password:1,
      }
    }
  },
  methods: {
  	send() {
      login(this.user).then(res=>{
        //请求成功，做相应处理
        console.log(res)
      }).catch(err=>{
        //请求失败，做相应处理
        console.log('请求错误')
      })
  },
}
}
</script>

