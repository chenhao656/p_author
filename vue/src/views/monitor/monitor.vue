<template>
  <div class="app-container">
    <div class="filter-container">
      <el-alert title="警告："
                type="warning" v-if="showwarning" description="有布控人员进入" center show-icon>
      </el-alert>
      <div id="warningmsg" />
      <el-form>
        <el-form-item>
          <el-tag v-if="monitoropen">监控已开启</el-tag>
          <el-tag v-else>监控未开启</el-tag>
          <!--<el-button type="primary" icon="plus" @click="startmonitor" v-if="hasPerm('personmonitor:add')">
    开启监控
  </el-button>-->
          <el-switch v-model="monitoropen"
                     active-color="#13ce66"
                     inactive-color="#ff4949" @change="switchmonitor">
          </el-switch>
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
      <el-table-column align="center" prop="id" label="隐藏ID" v-if="false"></el-table-column>
      <el-table-column align="center" prop="name" label="姓名" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="sex" label="性别" style="width: 30px;"></el-table-column>
      <el-table-column align="center" prop="id_card" label="身份证号" style="width: 200px;"></el-table-column>
      <el-table-column align="center" prop="birthplace" label="户籍地" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="type" label="人员类别" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="case_type" label="案件类别" style="width: 60px;"></el-table-column>
      <el-table-column align="center" prop="spot_photo" label="现场照片" style="width: 60px;">
        <template slot-scope="scope">
          <img v-bind:src="scope.row.spot_photo" min-width="70" height="70" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="stock_photo" label="库存照片" style="width: 60px;">
        <template slot-scope="scope">
          <img v-bind:src="scope.row.stock_photo" min-width="70" height="70" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="is_deal" label="是否已处理" style="width: 60px;">
        <template slot-scope="scope">
          <el-button type="danger" icon="edit" @click="changeMonitor(scope.$index)" size="small" v-if="scope.row.is_deal==0">未处理</el-button>
          <el-tag type="success" v-else>已处理</el-tag>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        totalCount: 0, //分页组件--数据总条数
        listQuery: {
          pageNum: 1,//页码
          pageRow: 50,//每页条数
          name: ''
        },
        list: [],//表格的数据
        monitorlist:[],
        listLoading: false,//数据加载等待动画
        timer: '',
        monitoropen: false,
        value: 0,
        showwarning: false,
        warningmessage:"",
        monitorPerson: {
          id:"",
          name: "",
          sex: "",
          id_card: "",
          birthplace: "",
          type: "",
          case_type: "",
          spot_photo: "",
          stock_photo: "",
          is_deal:""
        }
      };
    },
    created() {
      this.getList();
    },
    methods: {
      getList() {
        this.listLoading = true;
        this.api({
          url: "/monitorcheck/listmonitorcheck",
          method: "get",
          params: this.listQuery
        }).then(data => {
          this.listLoading = false;
          this.list = data.list;
          this.totalCount = data.totalCount;
        })
      },
      switchmonitor(val) {
        this.monitoropen = val;
        if (val) {
          this.timer = setInterval(this.monitorBlackList, 2000);
        } else {
          clearInterval(this.timer);
        }
      },
      monitorBlackList() {
        //获取列表
        this.listLoading = true;
        this.api({
          url: "/monitorcheck/monitorEntry",
          method: "get",
          params: this.listQuery
        }).then(data => {
          this.listLoading = false;
          this.monitorlist = data.list;
          //this.totalCount = data.totalCount;
          console.log(this.monitorlist.length);
          if (this.monitorlist.length > 0) {
            this.getList();
            var voice = new Audio('/static/warning.wav')
            voice.play()
            this.showwarning = true;
          } 
        })
        //this.value ++;

      },
      getIndex($index) {
        //表格序号
        return (this.listQuery.pageNum - 1) * this.listQuery.pageRow + $index + 1
      },
      //startmonitor() {
      //  //console.log(1111);
        
      //  this.warningmessage = "布控人员张三进入车站";
      //  this.showwarning = true;
      //  this.timer = setinterval(this.getblacklist, 5000);
      //},
      beforeDestroy() {
        clearInterval(this.timer);
      },
      //点击确定修改人员状态为已查看
      changeMonitor($index) {
        console.log($index);
        this.monitorPerson.id = this.list[$index].id;
        this.monitorPerson.id_card = this.list[$index].id_card;
        this.monitorPerson.sex = this.list[$index].sex;
        this.monitorPerson.birthplace = this.list[$index].birthplace;
        this.monitorPerson.type = this.list[$index].type;
        this.monitorPerson.case_type = this.list[$index].case_type;
        this.monitorPerson.name = this.list[$index].name;
        console.log(this.monitorPerson);
        this.api({
          url: "/monitorcheck/changeMonitor",
          method: "post",
          params: this.monitorPerson
        }).then(data => {
          this.listLoading = false;
          this.showwarning = false;
          this.getList();
        })
      }
      }
    }
   
</script>
