webpackJsonp([6],{pfnv:function(t,e,l){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var n={render:function(){var t=this,e=t.$createElement,l=t._self._c||e;return l("div",{staticClass:"app-container"},[l("div",{staticClass:"filter-container"},[l("el-form",[l("el-form-item",[t.hasPerm("personmonitor:add")?l("el-button",{attrs:{type:"primary",icon:"plus"},on:{click:t.startmonitor}},[t._v("\n          同步布控人员\n        ")]):t._e()],1)],1),t._v(" "),l("el-table",{directives:[{name:"loading",rawName:"v-loading.body",value:t.listLoading,expression:"listLoading",modifiers:{body:!0}}],attrs:{data:t.list,"element-loading-text":"拼命加载中",border:"",fit:"","highlight-current-row":""}},[l("el-table-column",{attrs:{align:"center",label:"序号",width:"80"},scopedSlots:t._u([{key:"default",fn:function(e){return[l("span",{domProps:{textContent:t._s(t.getIndex(e.$index))}})]}}])}),t._v(" "),l("el-table-column",{staticStyle:{width:"60px"},attrs:{align:"center",prop:"name",label:"采集点名称"}}),t._v(" "),l("el-table-column",{staticStyle:{width:"30px"},attrs:{align:"center",prop:"sex",label:"同步时间"}}),t._v(" "),l("el-table-column",{staticStyle:{width:"200px"},attrs:{align:"center",prop:"id_card",label:"同步状态"}})],1)],1)])},staticRenderFns:[]},a=l("VU/8")(null,n,!1,null,null,null);e.default=a.exports}});