<template>
  <div class="app-container">
    <div class="filter-container">
      <el-form>
        <el-form-item>
          <el-button type="primary" icon="plus" @click="addPointControl(1)" size="small">
            同步布控人员到设备
          </el-button>
          <el-button type="warning" icon="plus" @click="addPointControl(2)"  size="small">
            取消设备人员告警
          </el-button>
        </el-form-item>
      </el-form>
      <el-table :data="list" v-loading.body="listLoading" element-loading-text="拼命加载中" border fit
                highlight-current-row>
        <el-table-column align="center" label="序号" width="80">
          <template slot-scope="scope">
            <span v-text="getIndex(scope.$index)"> </span>
          </template>
        </el-table-column>
        <el-table-column align="center" prop="id" label="隐藏ID" v-if="false"></el-table-column>
        <el-table-column align="center" prop="point_name" label="采集点名称" style="width: 60px;"></el-table-column>
        <el-table-column align="center" prop="edit_time" label="同步完成时间" style="width: 30px;"></el-table-column>
        <el-table-column align="center" prop="deal_type" label="同步类型" style="width: 200px;"></el-table-column>
        <el-table-column align="center" prop="is_deal" label="同步状态" style="width: 200px;"></el-table-column>
        <el-table-column align="center" label="操作" style="width: 200px;">
          <template slot-scope="scope">
            <el-button type="danger" icon="delete" @click="removePointSync(scope.$index)">
              删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        totalCount: 0, //分页组件--数据总条数
        list: [],//表格的数据
        listLoading: false,//数据加载等待动画
        listQuery: {
          pageNum: 1,//页码
          pageRow: 50,//每页条数
          name: ''
        },
        deletelist: [],//删除的号码
        dialogStatus: 'create',
        dialogFormVisible: false,
        collectSync: {
          id: "",
          point_name: "",
          edit_time: "",
          is_deal: "",
          deal_type:""
        }
      }
    },
    created() {
      this.getList();
    },
    methods: {
      getList() {
        this.listLoading = true;
        this.api({
          url: "/collectpoint/listCollectPointSync",
          method: "get",
          params: this.listQuery
        }).then(data => {
          this.listLoading = false;
          for (var i = 0; i < data.list.length; i++) {
            data.list[i]['edit_time'] = this.timeFormat(data.list[i]['edit_time']);
            if (data.list[i]['is_deal'] == 1) {
              data.list[i]['is_deal'] = '已完成'
            } else {
              data.list[i]['is_deal'] = '未完成'
            };
            if (data.list[i]['deal_type'] == 1) {
              data.list[i]['deal_type'] = '新增布控人员'
            } else if (data.list[i]['deal_type'] == 2)
            {
              data.list[i]['deal_type'] = '删除布控人员'
            }
          }
          this.list = data.list;
          this.totalCount = data.totalCount;
        })
      },
      getIndex($index) {
        //表格序号
        return (this.listQuery.pageNum - 1) * this.listQuery.pageRow + $index + 1
      },
      addPointControl(val) {
        this.collectSync.deal_type = val;
        this.api({
          url: "/collectpoint/addCollectPointSync",
          method: "post",
          data: this.collectSync
        }).then(data => {
          this.getList();
        })
      },
      removePointSync($index) {
        this.collectSync.id = this.list[$index].id;
        this.api({
          url: "/collectpoint/delCollectPointSync",
          method: "post",
          data: this.collectSync
        }).then(data => {
          this.getList();
        })
      },
      timeFormat(val) {
        if (val != null) {
          var date = new Date(val);
          return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
        }
      }


    }
  }

</script>
