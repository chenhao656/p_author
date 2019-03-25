<template>
  <div class="app-container">
    <div class="filter-container">
      <el-form>
        <el-form-item>
          <el-button type="primary" icon="plus" @click="showAddPoint">
            新增采集点
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
        <el-table-column align="center" prop="add_time" label="添加时间" style="width: 30px;"></el-table-column>
        <el-table-column align="center" label="操作" style="width: 200px;">
          <template slot-scope="scope">
            <el-button type="danger" icon="delete" @click="removePoint(scope.$index)">
              删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-dialog  :visible.sync="dialogFormVisible">
        <el-form class="small-space" :model="collectPoint" label-position="left" label-width="60px"
                 style='width: 300px; margin-left:50px;'>
          <el-form-item label="采集点 ">
            <el-input type="text" v-model="collectPoint.point_name">
            </el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取 消</el-button>
          <el-button v-if="dialogStatus=='create'" type="success" @click="createPoint">保存</el-button>
        </div>
      </el-dialog>
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
        collectPoint: {
          id: "",
          point_name: "",
          edit_time: "",
          is_deal: ""
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
          url: "/collectpoint/listCollectPoint",
          method: "get",
          params: this.listQuery
        }).then(data => {
          this.listLoading = false;
          for (var i = 0; i < data.list.length;i++) {
            data.list[i]['add_time'] = this.timeFormat(data.list[i]['add_time']);

          }
          this.list = data.list;
          this.totalCount = data.totalCount;
        })
      },
      getIndex($index) {
        //表格序号
        return (this.listQuery.pageNum - 1) * this.listQuery.pageRow + $index + 1
      },
      removePoint($index) {
        this.collectPoint.id = this.list[$index].id;
        this.api({
          url: "/collectpoint/delCollectPoint",
          method: "post",
          data: this.collectPoint
        }).then(data => {
          this.getList();
        })
      },
      showAddPoint() {
        //显示新增对话框
        this.collectPoint.point_name = "";
        this.dialogFormVisible = true
      },
      createPoint() {
        this.api({
          url: "/collectpoint/addCollectPoint",
          method: "post",
          data: this.collectPoint
        }).then(data => {
          this.getList();
          this.dialogFormVisible = false;
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

