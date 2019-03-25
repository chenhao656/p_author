<template>
  <div class="app-container">
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
    <el-upload class="upload-demo"
               action="/api/personmonitor/uploadphoto"
               :on-preview="handlePreview"
               :on-remove="handleRemove"
               :before-remove="beforeRemove"
               multiple
               :show-file-list="false"
               >
      <el-button size="small" type="primary">点击上传</el-button>
      <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，单张图片最大10Mb</div>
    </el-upload>
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

      },
      handleRemove(file, fileList) {
        console.log(file, fileList);
      },
      handlePreview(file) {
        console.log(file);
      },
      handleExceed(files, fileList) {
        this.$message.warning(`当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`);
      },
      beforeRemove(file, fileList) {
        return this.$confirm(`确定移除 ${file.name}？`);
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
   

  }
</script>
