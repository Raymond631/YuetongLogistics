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
    {
      path: "/authentication/selfCenter",
      name: "selfCenter",
      component: () => import("../views/authentication/selfCenter.vue"),
    },
    {
      path: "/authentication/login",
      name: "login",
      component: () => import("../views/authentication/login.vue"),
    },
    {
      path: "/authentication/main",
      name: "main",
      component: () => import("../views/authentication/main.vue"),
    },
    {
      path: "/carrier/bill/issue",
      name: "issue",
      component: () => import("../views/carrier/bill/issue.vue"),
    },
    {
      path: "/carrier/bill/reception",
      name: "reception",
      component: () => import("../views/carrier/bill/reception.vue"),
    },
    {
      path: "/carrier/task/dispatch",
      name: "dispatch",
      component: () => import("../views/carrier/task/dispatch.vue"),
    },
    {
      path: "/cost/accounting",
      name: "accounting",
      component: () => import("../views/cost/accounting.vue"),
    },
    {
      path: "/cost/maintenance",
      name: "maintenance",
      component: () => import("../views/cost/maintenance.vue"),
    },
    {
      path: "/fleet/truck",
      name: "truck",
      component: () => import("../views/fleet/truck.vue")
    },
    {
      path: "/fleet/driver",
      name: "driver",
      component: () => import("../views/fleet/driver.vue")
    },
    {
      path: "/fleet/team",
      name: "team",
      component: () => import("../views/fleet/team.vue")
    },

    {
      path: "/search/capacity",
      name: "capacity",
      component: () => import("../views/search/capacity.vue"),
    },
    {
      path: "/search/history",
      name: "history",
      component: () => import("../views/search/history.vue"),
    },
    {
      path: "/system/log",
      name: "log",
      component: () => import("../views/system/log.vue"),
    },
    {
      path: "/system/system",
      name: "system",
      component: () => import("../views/system/system.vue"),
    },
    {
      path: "/system/user",
      name: "user",
      component: () => import("../views/system/user.vue"),
    }
  ],
});

//全局前置路由守卫————初始化的时候被调用、每次路由切换之前被调用
// router.beforeEach((to, from, next) => {
//   if (to.meta.isAuth) {
//     if (storage.get("token") != "") {
//       next(); //放行
//     } else {
//       alert("抱歉，您无权限查看！");
//     }
//   } else {
//     // 否则，放行
//     next();
//   }
// });

export default router;
