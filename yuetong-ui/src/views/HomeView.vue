<template>
  <div class="container">
    <navigationBar />
    <div class="content">
      <welcomeHeader />
    </div>
  </div>
</template>
<script lang="ts">
import navigationBar from "../components/navigationBar.vue";
import welcomeHeader from "../components/header.vue";
import { defineComponent } from "vue";

export default defineComponent({
  name: "header",
  data() {
    return {
      data: "",
    };
  },
  components: { welcomeHeader, navigationBar },
  mounted() {},
  methods: {
    menuSelect(index: string) {},
  },
});
</script>

<style lang="scss">
.container {
  .content {
    margin-left: $Mleft;
    height: $max_height;
    background-color:$back_color;
  }
}
</style>
