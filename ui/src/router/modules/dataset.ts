import Layout from '@/layout/main-layout/index.vue'
const datasetRouter = {
  path: '/dataset',
  name: 'dataset',
  meta: { title: 'Question and Answer Library', permission: 'DATASET:READ' },
  redirect: '/dataset',
  children: [
    {
      path: '/dataset',
      name: 'dataset',
      component: () => import('@/views/dataset/index.vue')
    },
    {
      path: '/dataset/:type', // create or upload
      name: 'CreateDataset',
      meta: { activeMenu: '/dataset' },
      component: () => import('@/views/dataset/CreateDataset.vue'),
      hidden: true
    },
    {
      path: '/dataset/:id',
      name: 'DatasetDetail',
      meta: { title: 'Document', activeMenu: '/dataset' },
      component: Layout,
      hidden: true,
      children: [
        {
          path: 'document',
          name: 'Document',
          meta: {
            icon: 'app-document',
            iconActive: 'app-document-active',
            title: 'Document Pre-Processing',
            active: 'document',
            parentPath: '/dataset/:id',
            parentName: 'DatasetDetail'
          },
          component: () => import('@/views/document/index.vue')
        },
        {
          path: 'doc_rewrite',
          name: 'DocRewrite',
          meta: {
            icon: 'DocumentAdd',
            title: 'Document Structure Rewrite',
            active: 'doc_rewrite',
            parentPath: '/dataset/:id',
            parentName: 'DatasetDetail'
          },
          component: () => import('@/views/doc_rewrite/index.vue') // 修改为新页面的组件文件路径
        },
        {
          path: 'qa_generate',
          name: 'qa_generate',
          meta: {
            icon: 'DocumentAdd',
            title: 'Question and Answer Document Generation',
            active: 'qa_generate',
            parentPath: '/dataset/:id',
            parentName: 'DatasetDetail'
          },
          component: () => import('@/views/qa_generate/index.vue')
        },
        {
          path: 'qa_document',
          name: 'QA_Document',
          meta: {
            icon: 'app-document',
            iconActive: 'app-document-active',
            title: 'Result File',
            active: 'qa_document',
            parentPath: '/dataset/:id',
            parentName: 'DatasetDetail'
          },
          component: () => import('@/views/qa_document/index.vue')
        },
        {
          path: 'setting',
          name: 'DatasetSetting',
          meta: {
            icon: 'app-setting',
            iconActive: 'app-setting-active',
            title: 'Setup',
            active: 'setting',
            parentPath: '/dataset/:id',
            parentName: 'DatasetDetail'
          },
          component: () => import('@/views/dataset/DatasetSetting.vue')
        }
      ]
    },
    {
      path: '/dataset/:id/:documentId', // 分段详情
      name: 'Paragraph',
      meta: { activeMenu: '/dataset' },
      component: () => import('@/views/paragraph/index.vue'),
      hidden: true
    }
  ]
}

export default datasetRouter
