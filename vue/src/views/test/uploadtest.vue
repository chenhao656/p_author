<template>
  <div class="app-container">
      <h1>页面样式还没定，监控黑名单人员进入</h1>
      <el-upload ref="upload" action="/wm/upload/":show-file-list="false":auto-upload="false">
  <el-button slot="trigger" icon="el-icon-upload" size="small" type="primary">
    批量导入布控人员
  </el-button>
</el-upload>
      <input id="upload" type="file" @change="importfxx(this)"  accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" />

  </div>
</template>