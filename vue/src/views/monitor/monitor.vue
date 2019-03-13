<template>
  <div class="app-container">
      <h1>页面样式还没定，监控黑名单人员进入</h1>
  </div>
</template>
<script>
  export default {data() {
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
          if(this.list!=null){
            //console.log(this.list[0].name)
            var voice=new Audio('http://www.xmf119.cn/static/admin/sounds/notify.wav')
            //voice.play()
            voice.addEventListener('end', function () { 
                alert('监控人员'+this.list[0].name+'进入') 
             }
              
            )

            //alert('监控人员'+this.list[0].name+'进入') 
        }
        })
        //this.value ++;

        
      }
    },
    mounted() {
      this.timer = setInterval(this.getBlackList, 5000);
    },
    beforeDestroy() {
      clearInterval(this.timer);
    },
    //点击确定修改人员状态为已查看
    changeMonitor(){

    }
  }
</script>
