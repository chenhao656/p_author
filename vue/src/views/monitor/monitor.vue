<template>
  <div class="app-container">
    <div class="filter-container">
      <el-form>
        <el-form-item>
          <el-button type="primary" icon="plus" @click="startmonitor" v-if="hasPerm('personmonitor:add')">
            开启监控
          </el-button>
        </el-form-item>
      </el-form>
    </div>
    <el-table :data="list" v-loading.body="listLoading" element-loading-text="拼命加载中" border fit
              highlight-current-row>
      <el-table-column align="center" label="序号" width="80">
        <template slot-scope="scope">
          <span v-text="getIndex(scope.$index)"> </span>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="name" label="姓名" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="sex" label="性别" style="width: 30px;"></el-table-column>
      <el-table-column align="center" prop="id_card" label="身份证号" style="width: 200px;"></el-table-column>
      <el-table-column align="center" prop="birthplace" label="户籍地" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="type" label="人员类别" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="case_type" label="案件类别" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="case_type" label="现场照片" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="case_type" label="库存照片" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="case_type" label="是否已处理" style="width: 60px;">
      <template slot-scope="scope">
        <el-button type="danger" icon="edit" @click="changeMonitor(scope.$index)">处理</el-button>
      </template>
      </el-table-column>
    </el-table>
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
        //检查权限
        if (!this.hasPerm('monitorcheck:list')) {
          return
        }
        //获取列表
        this.listLoading = true;
        this.api({
          url: "/monitorcheck/listmonitorcheck",
          method: "get",
          params: this.listQuery
        }).then(data => {
          this.listLoading = false;
          this.list = data.list;
          this.totalCount = data.totalCount;
          if (this.list == false) {
            //console.log(this.list[0].name)
          } else {
            var voice = new Audio('http://www.xmf119.cn/static/admin/sounds/notify.wav')
            voice.play()
            voice.addEventListener('end', function () {
              alert('监控人员' + this.list[0].name + '进入')
            }
            )
            alert('监控人员' + this.list[0].name + '进入')
          }
        })
        //this.value ++;

      }
    },
    startmonitor(){
      this.timer = setInterval(this.getBlackList, 5000);
    },
    mounted() {
      //this.timer = setInterval(this.getBlackList, 5000);
    },
    beforeDestroy() {
      clearInterval(this.timer);
    },
    //点击确定修改人员状态为已查看
    changeMonitor() {
    }
  }
</script>
