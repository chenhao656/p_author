<template>
  <div class="app-container">
      <h1>页面样式还没定，监控黑名单人员进入</h1>
<el-upload
    ref="upload"
    action="/wm/upload/"
    :show-file-list="false"
    :on-change="readExcel"
    :auto-upload="false">
  <el-button
      slot="trigger"
      icon="el-icon-upload"
      size="small"
      type="primary">
    上传文件
  </el-button>
</el-upload>
      <input id="upload" type="file" @change="importfxx(this)"  accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" />

  </div>
</template>
<script>
export default {
    methods:{
        readExcel(file) {
    const fileReader = new FileReader();
    fileReader.onload = (ev) => {
      try {
        const data = ev.target.result;
        const workbook = XLSX.read(data, {
          type: 'binary'
        });
        for (let sheet in workbook.Sheets) {
          const sheetArray = XLSX.utils.sheet_to_json(workbook.Sheets[sheet]);
          
         }
      } catch (e) {
        this.$message.warning('文件类型不正确！');
        return false;
      }
    };
    fileReader.readAsBinaryString(file.raw);
  }
    }
}
</script>
