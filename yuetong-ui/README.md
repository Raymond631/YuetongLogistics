# 项目前端
> 介绍一下目录结构，可以参考https://doc.ruoyi.vip/ruoyi-cloud/document/xmjs.html#%E5%89%8D%E7%AB%AF%E7%BB%93%E6%9E%84
* api用来存放各种请求，并不是一个界面就一个文件，实际上是允许复用的，但我觉得可能复用程度比较低，所以结构目录暂定和views一致
* assert：静态资源，包括css、js、image等
* component：用于存放组件
* model：不知道干啥的，但是目前用来放不同的存储方式
* router：路由
* store：管理，管理啥我也不是很清楚（基本用不到吧？）。
* utils：公用模块，比如请求的发送，统一使用request
* views：界面


## Project Setup
```sh
npm install
```
### Compile and Hot-Reload for Development
```sh
npm run dev
```
### Type-Check, Compile and Minify for Production
```sh
npm run build
```
