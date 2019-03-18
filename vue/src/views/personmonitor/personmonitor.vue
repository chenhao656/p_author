<template>
  <div class="app-container">
    <div class="filter-container">
      <el-form>
        <el-form-item>
          <el-input v-model="this.searchcondition" placeholder="身份证号或姓名" style="width: 200px;" size="small"></el-input><el-button type="primary" icon="el-icon-search" size="small">搜索</el-button>
          <el-button type="primary" icon="plus" @click="showCreate" v-if="hasPerm('personmonitor:add')" size="small">添加布控人员
          </el-button>
          <el-button type="danger" icon="edit" @click="showDel(id_cardlist)" size="small">删除</el-button>
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
              批量上传
            </el-button>
          </el-upload>          

        </el-form-item>
      </el-form>
    </div>
    <el-table :data="list" v-loading.body="listLoading" element-loading-text="拼命加载中" border fit
              highlight-current-row  @selection-change="handleSelectionChange">
    <el-table-column type="selection" width="55"s></el-table-column>
      <el-table-column align="center" label="序号" width="80">
        <template slot-scope="scope">
          <span v-text="getIndex(scope.$index)"> </span>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="person_id" label="隐藏ID" v-if="false"></el-table-column>
      <el-table-column align="center" prop="id_no" label="人员编号" style="width: 160px;"></el-table-column>
      <el-table-column align="center" prop="name" label="姓名" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="sex" label="性别" style="width: 30px;"></el-table-column>
      <el-table-column align="center" prop="id_card" label="身份证号" width="200"></el-table-column>
      <el-table-column align="center" prop="birthplace" label="户籍地" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="type" label="人员类别" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="case_type" label="案件类别" style="width: 60px;"></el-table-column>
      <el-table-column align="center" label="操作" width="200" v-if="hasPerm('personmonitor:update')">
        <template slot-scope="scope">
          <el-button type="primary" icon="edit" @click="showUpdate(scope.$index)">修改</el-button>
          <!-- <el-button type="danger" icon="edit" @click="showDel(scope.$index)">删除</el-button> -->
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
        <el-button type="primary" v-else @click="updatepersonmonitor">保 存</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import XLSX from 'xlsx'

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
        id_cardlist:[],//选中的身份证号数据
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
        items:[{name:"男",id:'1'},{name:"女",id:'2'}],
        searchcondition:""
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
      hideRow(val){
        this.show=false
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
        //alert('还没写')
        this.tempPersonmonitor.id = this.list[$index].id;
        this.tempPersonmonitor.id_card = this.list[$index].id_card;
        this.tempPersonmonitor.sex = this.list[$index].sex;
        this.tempPersonmonitor.birthplace = this.list[$index].birthplace;
        this.tempPersonmonitor.type = this.list[$index].type;
        this.tempPersonmonitor.case_type = this.list[$index].case_type;
        this.tempPersonmonitor.name = this.list[$index].name;
        this.dialogStatus = "update"
        this.dialogFormVisible = true
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
      showDel(list){
        //删除
        if (this.id_cardlist.length==0){
            this.$message({
            type: 'info',
            message: '请选中需要删除的人员!'
            });
        }else{
          this.$confirm('确定删除选中人员？', '提示', {
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
      },
      handleSelectionChange(val){
        console.log(val);
        console.log(val[0].hasOwnProperty("姓名"));
        console.log(val[0].hasOwnProperty("name"));
        for(var i=0;i<val.length;i++){
          this.id_cardlist=val;
          console.log(this.id_cardlist[i].id_card);
        }
      },
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
          console.log(sheetArray);
          if(sheetArray.length>0){
            if(!sheetArray[0].hasOwnProperty('姓名')){
            this.$message({
            type: 'info',
            message: '表头格式有误，找不到姓名列!'
             });
              return false;
            }else if(!sheetArray[0].hasOwnProperty("人员编号")){
              this.$message({
              type: 'info',
              message: '表头格式有误，找不到人员编号列!'
              });
              return false;
            }else if(!sheetArray[0].hasOwnProperty("身份证号")){
              this.$message({
              type: 'info',
              message: '表头格式有误，找不到身份证号列!'
              });
              return false;
            }else if(!sheetArray[0].hasOwnProperty("性别")){
              this.$message({
              type: 'info',
              message: '表头格式有误，找不到性别列!'
              });
              return false;
            }else if(!sheetArray[0].hasOwnProperty("户籍地")){
              this.$message({
              type: 'info',
              message: '表头格式有误，找不到户籍地列!'
              });
              return false;
            }else if(!sheetArray[0].hasOwnProperty("人员类别")){
              this.$message({
              type: 'info',
              message: '表头格式有误，找不到人员类别列!'
              });
              return false;
            }else if(!sheetArray[0].hasOwnProperty("案件类别")){
              this.$message({
              type: 'info',
              message: '表头格式有误，找不到案件类别列!'
              });
              return false;
            }
            var importJson = [];
            var tempJson = {};
            for (var i in sheetArray) {
               // 清空json对象
               tempJson = {};
               // 添加json元素(key-goods)并赋值(value)
               tempJson['name'] = sheetArray[i].姓名;
               // 设置key=value所对应的值并添加到tempJson对象中
               tempJson['id_no'] = sheetArray[i].人员编号;
               tempJson['sex'] = sheetArray[i].性别;
               tempJson['id_card'] = sheetArray[i].身份证号;
               tempJson['type'] = sheetArray[i].人员类别;
               tempJson['case_type'] = sheetArray[i].案件类别;
               tempJson['birthplace'] = sheetArray[i].户籍地;
               importJson[i] = tempJson;
              }

               this.api({
                    url: "/personmonitor/bulkaddPersonmonitor",
                    method: "post",
                    data: importJson
                    }).then(() => {
                        this.getList();
                  })

            }
         }
         }
       catch (e) {
         this.$message.warning('文件类型不正确！');
         return false;
         }
      };
        fileReader.readAsBinaryString(file.raw);
      }
    }
  }
</script>
