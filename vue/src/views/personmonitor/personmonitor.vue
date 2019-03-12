<template>
  <div class="app-container">
    <div class="filter-container">
      <el-form>
        <el-form-item>
          <el-button type="primary" icon="plus" @click="showCreate" v-if="hasPerm('personmonitor:add')">添加布控人员
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
      <el-table-column align="center" prop="id_no" label="人员编号" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="name" label="姓名" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="sex" label="性别" style="width: 30px;"></el-table-column>
      <el-table-column align="center" prop="id_card" label="身份证号" style="width: 200px;"></el-table-column>
      <el-table-column align="center" prop="birthplace" label="户籍地" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="type" label="人员类别" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="case_type" label="案件类别" style="width: 60px;"></el-table-column>
      <el-table-column align="center" label="操作" width="200" v-if="hasPerm('personmonitor:update')">
        <template slot-scope="scope">
          <el-button type="primary" icon="edit" @click="showUpdate(scope.$index)">修改</el-button>
          <el-button type="primary" icon="edit" @click="showDel(scope.$index)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="listQuery.pageNum"
      :page-size="listQuery.pageRow"
      :total="totalCount"
      :page-sizes="[10, 20, 50, 100]"
      layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
      <el-form class="small-space" :model="tempPersonmonitor" label-position="left" label-width="100px"
               style='width: 300px; margin-left:50px;'>
        <el-form-item label="姓名">
          <el-input type="text" v-model="tempPersonmonitor.name">
          </el-input>
        </el-form-item>
        <el-form-item label="性别">
          <el-select v-model="tempPersonmonitor.sex" placeholder="请选择">
                <el-option v-for="item in items" :label="item.name" :value="item.id"></el-option>
          </el-select>
          </el-input>
        </el-form-item>
        <el-form-item label="身份证号">
          <el-input type="text" v-model="tempPersonmonitor.id_card">
          </el-input>
        </el-form-item>
        <el-form-item label="户籍地">
          <el-input type="text" v-model="tempPersonmonitor.birthplace">
          </el-input>
        </el-form-item>
        <el-form-item label="人员类别">
          <el-input type="text" v-model="tempPersonmonitor.type">
          </el-input>
        </el-form-item>
        <el-form-item label="案件类别">
          <el-input type="text" v-model="tempPersonmonitor.case_type">
          </el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button v-if="dialogStatus=='create'" type="success" @click="createpersonmonitor">创 建</el-button>
        <el-button type="primary" v-else @click="updatepersonmonitor">修 改</el-button>
      </div>
    </el-dialog>
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
        dialogStatus: 'create',
        dialogFormVisible: false,
        textMap: {
          update: '编辑',
          create: '添加布控人员'
        },
        tempPersonmonitor: {
          id: "",
          id_no: "",
          name:"",
          sex:"男",
          id_card:"",
          birthplace:"",
          type:"",
          case_type:""
        },
        items:[{name:"男",id:'1'},{name:"女",id:'2'}]
      }
    },
    created() {
      this.getList();
    },
    methods: {
      getList() {
        //查询列表
        //权限检查
        if (!this.hasPerm('personmonitor:list')) {
          return
        }
        this.listLoading = true;
        this.api({
          url: "/personmonitor/listPersonmonitor",
          method: "get",
          params: this.listQuery
        }).then(data => {
          this.listLoading = false;
          this.list = data.list;
          this.totalCount = data.totalCount;
        })
      },
      handleSizeChange(val) {
        //改变每页数量
        this.listQuery.pageRow = val
        this.handleFilter();
      },
      handleCurrentChange(val) {
        //改变页码
        this.listQuery.pageNum = val
        this.getList();
      },
      getIndex($index) {
        //表格序号
        return (this.listQuery.pageNum - 1) * this.listQuery.pageRow + $index + 1
      },
      showCreate() {
        //显示新增对话框
        //this.tempPersonmonitor.name = "";
        this.dialogStatus = "create"
        this.dialogFormVisible = true
      },
      showUpdate($index) {
        //显示修改对话框
        alert('还没写')
        // this.tempPersonmonitor.id = this.list[$index].id;
        // this.tempPersonmonitor.content = this.list[$index].content;
        // this.dialogStatus = "update"
        // this.dialogFormVisible = true
      },
      createpersonmonitor() {
        //保存
        this.api({
          url: "/personmonitor/addPersonmonitor",
          method: "post",
          data: this.tempPersonmonitor
        }).then(() => {
          this.getList();
          this.dialogFormVisible = false
        })
      },
      updatepersonmonitor() {
        //修改
        this.api({
          url: "/personmonitor/updatepersonmonitor",
          method: "post",
          data: this.tempPersonmonitor
        }).then(() => {
          this.getList();
          this.dialogFormVisible = false
        })
      },
      showDel(){
        //删除
        alert('还没写')
      }
    }
  }
</script>
