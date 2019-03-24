<template>
  <div class="app-container">
    <div class="filter-container">
      <el-form>
        <el-form-item>
          <el-button type="primary" icon="plus" @click="startmonitor" v-if="hasPerm('personmonitor:add')">
            同步布控人员
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
        <el-table-column align="center" prop="name" label="采集点名称" style="width: 60px;"></el-table-column>
        <el-table-column align="center" prop="sex" label="同步时间" style="width: 30px;"></el-table-column>
        <el-table-column align="center" prop="id_card" label="同步状态" style="width: 200px;"></el-table-column>
      </el-table>
    </div>
  </div>
</template>
