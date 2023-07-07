<template>
    <div>qwq</div>
    <div v-for="column in cl1data.columns" :key="column">{{ column.column }}</div>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "yt-table",
  data() {
    return {
        cldata: {
        number:'',
        columns:[]
      },
    };
  },
  props: ['cl1data'],
//   watch: {
//     cldata: {
//       immediate: true, //绑定值就开始执行监听，而不是等值改变。
//       handler(newValue, oldValue) {
//        //doSometing
//        console.log(this.cldata);
//        console.log('new')
//       },
//     },
//   },
  mounted() { console.log(this.cl1data.columns[0])},
  methods: {
    goBack() {},
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../assets/style/components/yt-table.scss";
</style>
