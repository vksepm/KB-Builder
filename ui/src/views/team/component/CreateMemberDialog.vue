<template>
  <el-dialog
    v-model="dialogVisible"
    :close-on-press-escape="false"
    :close-on-click-modal="false"
    :destroy-on-close="true"
    width="600"
    class="member-dialog"
  >
    <template #header="{ titleId, titleClass }">
      <h4 :id="titleId" :class="titleClass">添加成员</h4>
      <div class="dialog-sub-title">成员登录后可以访问到您授权的数据。</div>
    </template>

    <el-form
      ref="addMemberFormRef"
      :model="memberForm"
      label-position="top"
      :rules="rules"
      require-asterisk-position="right"
      @submit.prevent
    >
      <el-form-item label="Username/Email" prop="users">
        <tags-input v-model:tags="memberForm.users" placeholder="Please enter the member's username or email address" />
        <!-- <el-select
          ref="SelectRemoteRef"
          class="custom-select-multiple"
          v-model="memberForm.users"
          multiple
          filterable
          remote
          reserve-keyword
          placeholder="Please enter the member's username or email address"
          no-data-text="User does not exist"
          :remote-method="remoteMethod"
          :loading="loading"
          @change="changeSelectHandle"
        >
          <el-option
            v-for="item in userOptions"
            :key="item?.id"
            :label="item?.username"
            :value="item?.id"
          />
        </el-select> -->
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click.prevent="dialogVisible = false"> Cancel </el-button>
        <el-button type="primary" @click="submitMember(addMemberFormRef)" :loading="loading">
          添加
        </el-button>
      </span>
    </template>
  </el-dialog>
</template>
<script setup lang="ts">
import { ref, watch, onMounted } from 'vue'
import type { FormInstance, FormRules } from 'element-plus'
import { MsgSuccess } from '@/utils/message'
import TeamApi from '@/api/team'
// import UserApi from '@/api/user'

const emit = defineEmits(['refresh'])

const dialogVisible = ref<boolean>(false)

const memberForm = ref({
  users: []
})

// const SelectRemoteRef = ref()
const addMemberFormRef = ref<FormInstance>()

const loading = ref<boolean>(false)
// const userOptions = ref<Array<any>>([])

const rules = ref<FormRules>({
  users: [
    {
      type: 'array',
      required: true,
      message: 'Please enter your username/email',
      trigger: 'change'
    }
  ]
})

watch(dialogVisible, (bool) => {
  if (!bool) {
    memberForm.value = {
      users: []
    }
    loading.value = false
  }
})

// const remoteMethod = (query: string) => {
//   if (query) {
//     setTimeout(() => {
//       getUser(query)
//     }, 200)
//   } else {
//     userOptions.value = []
//   }
// }

// const changeSelectHandle = () => {
//   SelectRemoteRef.value.query = ''
//   SelectRemoteRef.value.blur()
// }

const open = () => {
  dialogVisible.value = true
}
const submitMember = async (formEl: FormInstance | undefined) => {
  if (!formEl) return
  await formEl.validate((valid, fields) => {
    if (valid) {
      loading.value = true
      let idsArray = memberForm.value.users.map((obj: any) => obj.id)
      TeamApi.postCreatTeamMember(idsArray).then((res) => {
        MsgSuccess('Submit successfully')
        emit('refresh', idsArray)
        dialogVisible.value = false
        loading.value = false
      })
    }
  })
}

onMounted(() => {})

defineExpose({ open, close })
</script>
<style lang="scss" scope>
.member-dialog {
  .el-dialog__header {
    padding-bottom: 19px;
  }
}
.custom-select-multiple {
  width: 200%;
  .el-input {
    min-height: 100px;
  }
  .el-select__tags {
    top: 0;
    transform: none;
    padding-top: 8px;
  }
  .el-input__wrapper {
    align-items: start;
  }
}
</style>
