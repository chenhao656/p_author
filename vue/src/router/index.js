import Vue from 'vue'
import Router from 'vue-router'
// in development env not use Lazy Loading,because Lazy Loading too many pages will cause webpack hot update too slow.so only in production use Lazy Loading
/* layout */
import Layout from '../views/layout/Layout'

const _import = require('./_import_' + process.env.NODE_ENV)
Vue.use(Router)
export const constantRouterMap = [
  {path: '/login', component: _import('login/index'), hidden: true},
  {path: '/404', component: _import('404'), hidden: true},
  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    name: '首页',
    hidden: true,
    children: [{
      path: 'dashboard', component: _import('dashboard/index')
    }]
  }
]

export default new Router({
  // mode: 'history', //后端支持可开
  scrollBehavior: () => ({y: 0}),
  routes: constantRouterMap
})
export const asyncRouterMap = [
  {
    path: '/system',
    component: Layout,
    redirect: '/system/article',
    name: '功能模块',
    meta: {title: '功能模块', icon: 'tree'},
    children: [
      {
        path: 'article',
        name: '文章',
        component: _import('article/article'),
        meta: {title: '文章', icon: 'example'},
        menu: 'article'
      },      
      {
        path: 'monitor',
        name: '布控监测',
        component: _import('monitor/monitor'),
        meta: {title: '布控监测', icon: 'example'},
        menu: 'monitor'
      },
    ]
  },
  {
    path: '/user',
    component: Layout,
    redirect: '/user/',
    name: '',
    meta: {title: '基础数据管理', icon: 'table'},
    children: [
      {
        path: '', name: '用户管理', component: _import('user/user'), meta: {title: '用户管理', icon: 'user'}, menu: 'user'
      },
      {
        path: 'organization',
        name: '单位管理',
        //component: _import('user/role'),
        meta: {title: '单位管理', icon: 'example'},
        //menu: 'role'
      },
      // {
      //   path: 'role',
      //   name: '权限管理',
      //   component: _import('user/role'),
      //   meta: {title: '权限管理', icon: 'password'},
      //   menu: 'role'
      // },
    ]
  },
  {
    path: '/person',
    component: Layout,
    redirect: '/person/',
    name: '',
    meta: {title: '人口信息管理', icon: 'table'},
    children: [      
      {
      path: 'p_query',
      name: '人口信息查询',
      //component: _import('user/role'),
      meta: {title: '人口信息查询', icon: 'example'},
      //menu: 'role'
      },      
      {
        path: 'p_task',
        name: '人像查询任务',
        //component: _import('user/role'),
        meta: {title: '人像查询任务', icon: 'example'},
        //menu: 'role'
      },
  ]
  },
  {
    path: '/control',
    component: Layout,
    redirect: '/control/',
    name: '',
    meta: {title: '布控人员管理', icon: 'table'},
    children: [      
      {
      path: 'control_manager',
      name: '布控人员管理',
      //component: _import('user/role'),
      meta: {title: '布控人员管理', icon: 'example'},
      //menu: 'role'
      },      
      {
        path: 'card_alarm',
        name: '证件比对报警',
        //component: _import('user/role'),
        meta: {title: '证件比对报警', icon: 'example'},
        //menu: 'role'
      },
      {
        path: 'photot_alarm',
        name: '现场照比对报警',
        //component: _import('user/role'),
        meta: {title: '现场照比对报警', icon: 'example'},
        //menu: 'role'
      },
    ]
  },
  {
    path: '/collect',
    component: Layout,
    redirect: '/collect/',
    name: '',
    meta: {title: '采集点管理', icon: 'table'},
    children: [      
      {
      path: 'collect_manager',
      name: '采集点管理',
      //component: _import('user/role'),
      meta: {title: '采集点管理', icon: 'example'},
      //menu: 'role'
      }
    ]
  },
  {
    path: '/statistics',
    component: Layout,
    redirect: '/statistics/',
    name: '',
    meta: {title: '数据统计', icon: 'table'},
    children: [      
      {
      path: 'data_statistics',
      name: '数据统计',
      //component: _import('user/role'),
      meta: {title: '数据统计', icon: 'example'},
      //menu: 'role'
      }
    ]
  },
  {
    path: '/log',
    component: Layout,
    redirect: '/log/',
    name: '',
    meta: {title: '系统日志', icon: 'table'},
    children: [      
      {
      path: 'log_query',
      name: '日志查询',
      //component: _import('user/role'),
      meta: {title: '日志查询', icon: 'example'},
      //menu: 'role'
      }
    ]
  },
  {path: '*', redirect: '/404', hidden: true}
]
