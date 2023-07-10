<template>
  <div class="container">
    <navigationBar />
    <div class="content">
      <welcomeHeader />
      <el-tabs v-model="capacity" class="logTabs">
        <el-tab-pane label="承运车队" name="team">
          <ytTable
            class="table"
            :tableInfo="team"
            :tableContent="team_data"
            :tableHeight="700"
          />
        </el-tab-pane>
        <el-tab-pane label="承运车辆" name="vehicle">
          <ytTable
            class="table"
            :tableInfo="truck"
            :tableContent="truck_data"
            :tableHeight="700"
          />
        </el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import navigationBar from "../../components/navigationBar.vue";
import welcomeHeader from "../../components/header.vue";
import ytTable from "../../components/yt-table.vue";
import { capacityTeam, capacityTruck } from "../../api/search/capacity";

export default defineComponent({
  name: "reception",
  data() {
    return {
      data: "capacity",
      capacity: "team",
      team: {
        number: 11,
        select: false,
        action: false,
        tag: false,
        columns: [
          { label: "操作序号", content: "operId" },
          { label: "操作时间", content: "operTime" },
        ],
        actions: {
          specific: false,
          edit: false,
          delete: false,
        },
      },
      truck: {
        number: 4,
        select: false,
        action: false,
        tag: false,
        columns: [
          { label: "序号", content: "infoId" },
          { label: "用户账号", content: "account" },
        ],
        actions: {
          specific: false,
          edit: false,
          delete: false,
        },
      },
      team_data: [
        
      ],
      truck_data: [],
    };
  },
  components: { welcomeHeader, navigationBar, ytTable },
  mounted() {
    this.ready();
  },
  methods: {
    ready(){
      capacityTeam()
      .then((res:any)=>{
<<<<<<< HEAD

        // this.team_data = res.data;
=======
        this.team_data = res.data;
>>>>>>> e8c5b8773ae1420f66a83901735976f2f247d56d
      })
      .catch((err:any)=>{
        console.log(err)
      });
      capacityTruck()
      .then((res:any)=>{
        this.team_data = res.data;
      })
      .catch((err:any)=>{
        console.log(err)
      })
    },
    goBack() {},
  },
});
</script>

<style lang="scss" scoped="scoped">
@import "../../assets/style/css/capacity.scss";
</style>
