<template>
  <div class="app-container">
<<<<<<< HEAD
    <h1>测试页面</h1>
    <el-alert title="警告提示的文案"
              type="warning">
    </el-alert>
    <el-alert title="成功提示的文案"
              type="success">
    </el-alert>
    <el-alert title="消息提示的文案"
              type="info">
    </el-alert>
    <el-alert title="警告提示的文案"
              type="warning">
    </el-alert>
    <el-alert title="错误提示的文案"
              type="error">
    </el-alert>
    <el-alert title="成功提示的文案"
              type="warning"
              description="文字说明文字说明文字说明文字说明文字说明文字说明"
              show-icon>
    </el-alert>
    <el-button type="text" @click="open2">点击打开 Message Box</el-button>
  </div>

</template>
<script>
  export default {
    data() {
      return {
        timer: '',
        value: 0
      };
    },
    methods: {
      getBlackList() {
        console.log(11111111111111)

      }
    },
    mounted() {
      this.timer = setInterval(this.getBlackList, 5000);
    },
    beforeDestroy() {
      clearInterval(this.timer);
    },
    open2() {
      this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$message({
          type: 'success',
          message: '删除成功!'
        });
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    }
  }
</script>
=======
      <h1>页面样式还没定，监控黑名单人员进入</h1>
      <!-- <el-upload ref="upload" action="/wm/upload/":show-file-list="false":auto-upload="false"> -->
  <el-button slot="trigger" icon="el-icon-upload" size="middle" type="primary" @click="importfxx(this)">
    批量导入布控人员
  </el-button>
</el-upload>
     <el-tag>批量导入</el-tag> <input id="upload" type="file" @change="importfxx(this)"  accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" />
<upload-excel-component :on-success="handleSuccess" :before-upload="beforeUpload"/>
    <el-table :data="tableData" border highlight-current-row style="width: 100%;margin-top:20px;">
      <el-table-column v-for="item of tableHeader" :prop="item" :label="item" :key="item"/>
    </el-table>
  </div>
</template>
<script>
import UploadExcelComponent from '@/components/UploadExcel/index.vue'

export default {
  name: 'UploadExcel',
  components: { UploadExcelComponent },
  data() {
    return {
      tableData: [],
      tableHeader: []
    }
  },
  methods:{
    mounted() {
        // this.$refs.upload.$el.querySelector('.el-upload__input').addEventListener('change', e => {
        // this.readExcel(e);
        //  })
    },
    readExcel(e) {
         const files = e.target.files;
         const fileReader = new FileReader();
        fileReader.onload = (ev) => {
            try {
         const data = ev.target.result;
         const workbook = XLSX.read(data, {
          type: 'binary'
            });
      for (let sheet in workbook.Sheets) {
        const sheetArray = XLSX.utils.sheet_to_json(workbook.Sheets[sheet]);  //获得以第一列为键名的sheet数组对象 
     
      }
    } catch (e) {
      this.$message.warning('文件类型不正确！');
      return false;
    }
  };
  fileReader.readAsBinaryString(files[0]);
},
 // 文件读取前执行
    beforeUpload(file) {
      // 取文件大小，限制文件大小超过1mb
      const isLt1M = file.size / 1024 / 1024 < 1
      if (isLt1M) {
        return true
      }
      this.$message({
        message: '上传的Excel文件不能大于1mb.',
        type: 'warning'
      })
      return false
    },
    // 文件读取后执行
    handleSuccess({ results, header }) {
      this.tableData = results
      this.tableHeader = header
    },
    importfxx(obj) {
    let _this = this;
    let inputDOM = this.$refs.inputer;
    // 通过DOM取文件数据
    this.file = event.currentTarget.files[0];
    var rABS = false; //是否将文件读取为二进制字符串
    var f = this.file;
    var reader = new FileReader();
    FileReader.prototype.readAsBinaryString = function(f) {
        var binary = "";
        var rABS = false; //是否将文件读取为二进制字符串
        var pt = this;
        var wb; //读取完成的数据
        var outdata;
        var reader = new FileReader();
        reader.onload = function(e) {
            var bytes = new Uint8Array(reader.result);
            var length = bytes.byteLength;
            for(var i = 0; i < length; i++) {
                binary += String.fromCharCode(bytes[i]);
            }
            var XLSX = require('xlsx');
            if(rABS) {
                wb = XLSX.read(btoa(fixdata(binary)), { //手动转化
                type: 'base64'
            });    
            } else {
                wb = XLSX.read(binary, {
                    type: 'binary'
                });
            }
            outdata = XLSX.utils.sheet_to_json(wb.Sheets[wb.SheetNames[0]]);//outdata就是你想要的东西
            console.log(outdata);
            console.log(outdata[0]);
            console.log(outdata[0].姓名);

        }
        reader.readAsArrayBuffer(f);
    }
    if(rABS) {
        reader.readAsArrayBuffer(f);
    } else {
        reader.readAsBinaryString(f);
    }
      }
  }

}

</script>
>>>>>>> 62644bb1d4c09ac04c332bd38aca7baf3c1ce8e7
