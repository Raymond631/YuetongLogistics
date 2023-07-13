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
      component: () => import("../views/AboutView.vue"),
    },
    {
      path: "/authentication/selfCenter",
      name: "selfCenter",
      component: () => import("../views/authentication/selfCenter.vue"),
      beforeEnter: (to, from, next) => {
        let user = JSON.parse(sessionStorage.getItem("user") || "{}");
        if (user.roleId) {
          next(); //放行
        } else {
          alert("抱歉，您还没有登录！");
          next({ name: "home" });
        }
      },
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
      beforeEnter: (to, from, next) => {
        let user = JSON.parse(sessionStorage.getItem("user") || "{}");
        if (user.roleId) {
          next(); //放行
        } else {
          alert("抱歉，您还没有登陆！");
          next({ name: "home" });
        }
      },
    },
    {
      path: "/carrier/bill/issue",
      name: "issue",
      component: () => import("../views/carrier/bill/issue.vue"),
      beforeEnter: (to, from, next) => {
        let user = JSON.parse(sessionStorage.getItem("user") || "{}");
        if (user.roleId) {
          if (user.roleId == 3) {
            next(); //放行
          } else {
            alert("抱歉，您无权限查看！");
            next({ name: "main" });
          }
        } else {
          alert("抱歉，您还没有登陆！");
          next({ name: "home" });
        }
      },
    },
    {
      path: "/carrier/bill/reception",
      name: "reception",
      component: () => import("../views/carrier/bill/reception.vue"),
      beforeEnter: (to, from, next) => {
        let user = JSON.parse(sessionStorage.getItem("user") || "{}");
        if (user.roleId) {
          if (user.roleId == 3) {
            next(); //放行
          } else {
            alert("抱歉，您无权限查看！");
            next({ name: "main" });
          }
        } else {
          alert("抱歉，您还没有登陆！");
          next({ name: "home" });
        }
      },
    },
    {
      path: "/carrier/task/dispatch",
      name: "dispatch",
      component: () => import("../views/carrier/task/dispatch.vue"),
      beforeEnter: (to, from, next) => {
        let user = JSON.parse(sessionStorage.getItem("user") || "{}");
        if (user.roleId) {
          if (user.roleId == 4) {
            next(); //放行
          } else {
            alert("抱歉，您无权限查看！");
            next({ name: "main" });
          }
        } else {
          alert("抱歉，您还没有登陆！");
          next({ name: "home" });
        }
      },
    },
    {
      path: "/cost/accounting",
      name: "accounting",
      component: () => import("../views/cost/accounting.vue"),
      beforeEnter: (to, from, next) => {
        let user = JSON.parse(sessionStorage.getItem("user") || "{}");
        if (user.roleId) {
          if (user.roleId == 5) {
            next(); //放行
          } else {
            alert("抱歉，您无权限查看！");
            next({ name: "main" });
          }
        } else {
          alert("抱歉，您还没有登陆！");
          next({ name: "home" });
        }
      },
    },
    {
      path: "/cost/maintenance",
      name: "maintenance",
      component: () => import("../views/cost/maintenance.vue"),
      beforeEnter: (to, from, next) => {
        let user = JSON.parse(sessionStorage.getItem("user") || "{}");
        if (user.roleId) {
          if (user.roleId == 5) {
            next(); //放行
          } else {
            alert("抱歉，您无权限查看！");
            next({ name: "main" });
          }
        } else {
          alert("抱歉，您还没有登陆！");
          next({ name: "home" });
        }
      },
    },
    {
      path: "/fleet/truck",
      name: "truck",
      component: () => import("../views/fleet/truck.vue"),
      beforeEnter: (to, from, next) => {
        let user = JSON.parse(sessionStorage.getItem("user") || "{}");
        if (user.roleId) {
          if (user.roleId == 2) {
            next(); //放行
          } else {
            alert("抱歉，您无权限查看！");
            next({ name: "main" });
          }
        } else {
          alert("抱歉，您还没有登陆！");
          next({ name: "home" });
        }
      },
    },
    {
      path: "/fleet/driver",
      name: "driver",
      component: () => import("../views/fleet/driver.vue"),
      beforeEnter: (to, from, next) => {
        let user = JSON.parse(sessionStorage.getItem("user") || "{}");
        if (user.roleId) {
          if (user.roleId == 2) {
            next(); //放行
          } else {
            alert("抱歉，您无权限查看！");
            next({ name: "main" });
          }
        } else {
          alert("抱歉，您还没有登陆！");
          next({ name: "home" });
        }
      },
    },
    {
      path: "/fleet/team",
      name: "team",
      component: () => import("../views/fleet/team.vue"),
      beforeEnter: (to, from, next) => {
        let user = JSON.parse(sessionStorage.getItem("user") || "{}");
        if (user.roleId) {
          if (user.roleId == 2) {
            next(); //放行
          } else {
            alert("抱歉，您无权限查看！");
            next({ name: "main" });
          }
        } else {
          alert("抱歉，您还没有登陆！");
          next({ name: "home" });
        }
      },
    },
    {
      path: "/search/history",
      name: "history",
      component: () => import("../views/search/history.vue"),
      beforeEnter: (to, from, next) => {
        let user = JSON.parse(sessionStorage.getItem("user") || "{}");
        if (user.roleId) {
          if (user.roleId == 4 || user.roleId == 5) {
            next(); //放行
          } else {
            alert("抱歉，您无权限查看！");
            next({ name: "main" });
          }
        } else {
          alert("抱歉，您还没有登陆！");
          next({ name: "home" });
        }
      },
    },
    {
      path: "/system/log",
      name: "log",
      component: () => import("../views/system/log.vue"),
      beforeEnter: (to, from, next) => {
        let user = JSON.parse(sessionStorage.getItem("user") || "{}");
        if (user.roleId) {
          if (user.roleId == 1) {
            next(); //放行
          } else {
            alert("抱歉，您无权限查看！");
            next({ name: "main" });
          }
        } else {
          alert("抱歉，您还没有登陆！");
          next({ name: "home" });
        }
      },
    },
    {
      path: "/system/user",
      name: "user",
      component: () => import("../views/system/user.vue"),
      beforeEnter: (to, from, next) => {
        let user = JSON.parse(sessionStorage.getItem("user") || "{}");
        if (user.roleId) {
          if (user.roleId == 1) {
            next(); //放行
          } else {
            alert("抱歉，您无权限查看！");
            next({ name: "main" });
          }
        } else {
          alert("抱歉，您还没有登陆！");
          next({ name: "home" });
        }
      },
    },
    {
      path: "/error",
      name: "notFound",
      component: () => import("../views/NotFound.vue"),
    },
  ],
});

//全局前置路由守卫————初始化的时候被调用、每次路由切换之前被调用
// router.beforeEach((to, from, next) => {
//   console.log("inRouter")
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
