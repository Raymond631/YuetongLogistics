<template>
  <navigationBar/>
 
</template>
<script lang="ts">
import navigationBar from "../components/header.vue";
import { defineComponent } from "vue";

export default defineComponent({
  name: "header",
  data() {
    return {
      data: "",
      login: false,
      type: 2,
    };
  },
  components: {navigationBar},
  mounted() {},
  methods: {
    menuSelect(index: string) {},
  },
});
</script>

<style>
.flex-grow {
  flex-grow: 1;
}
</style>
