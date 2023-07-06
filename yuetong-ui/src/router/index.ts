import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import storage from "@/utils/storage";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
    },
    {
      path: "/about",
      name: "about",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/AboutView.vue"),
    },
  ],
});

//全局前置路由守卫————初始化的时候被调用、每次路由切换之前被调用
router.beforeEach((to, from, next) => {
  if (to.meta.isAuth) {
    if (storage.get("token") != "") {
      next(); //放行
    } else {
      alert("抱歉，您无权限查看！");
    }
  } else {
    // 否则，放行
    next();
  }
});

export default router;
