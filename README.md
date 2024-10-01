
<p align="center">
  <img width="60%" alt="image" src="https://github.com/user-attachments/assets/7af61641-e548-459f-b377-c71c1810e38f">
</p>

# <p align="center"><span style="font-size:20px;">Knowledge base generation system based on LLM large language model</span></p>


KB Builder = Knowledge Base Builder is an open source knowledge base generation system based on the LLM large language model. Based on the RAG (Retrieval-Augmented Generation) data generation enhancement method, it provides users with RAG-based knowledge enhancement generation and knowledge base rapid construction capabilities, and is committed to becoming the knowledge construction center of the enterprise. It provides platform-based intelligent dialogue service capabilities, document knowledge base management functions, and supports users to upload documents in docx, pdf, txt, and md formats; users click "Parse Document" to call the large model to generate question-answer data, and filter and generate high-quality knowledge base question-answer data.

- **Wide support for file types**：Supports direct upload of docx, txt, markdown, and pdf format documents, and will support more text format files in the future;
- **Flexible document processing methods**：Provides multiple document slicing (intelligent segmentation/recursive splitting/custom logo splitting, etc.) and multiple text cleaning and other RAG document preprocessing methods;
- **Large language model neutrality**：Supports docking with various large language models to generate QA, including local private large models (Llama 3 / Qwen 2, etc.), domestic public large models (Tongyi Qianwen / Zhipu AI, etc.) and foreign public large models (OpenAI / Gemini, etc.);
- **Knowledge generation and management**：It provides multiple preset scenario prompt libraries, supports the generation of high-quality QA question-answer pairs, and supports QA-based knowledge base generation functions. More knowledge base management capabilities such as rewriting and enhanced structured processing will be provided in the future.
  
## Quick Start

### Alibaba Cloud image one-click deployment
```
docker run -d --name kb-builder -p 8080:8088 -v ~/.KB-builder:/var/lib/postgresql/data registry.cn-hangzhou.aliyuncs.com/hduchat/bindian.hdu.edu.cn:latest 
username: admin
password: admin123.
```

### One-click deployment of DockerHub images
```
docker run -d --name kb_builder -p 8080:8088 -v ~/.kb-builder:/var/lib/postgresql/data hduchat/bindian.hdu.edu.cn
username: admin
password: admin123.
```

💡 Can be installed and deployed via source code

If you have more questions, you can check the manual, or report them through issue. You are also welcome to join the WeChat group to communicate with us
- [User Manual](https://github.com/hduchat/KB-Builder/wiki/%E4%BA%A7%E5%93%81%E4%BB%8B%E7%BB%8D)
- [Suggestions and feedback](https://github.com/hduchat/KB-Builder/issues)
- [Technical exchange group](https://github.com/hduchat/KB-Builder/wiki/%E8%81%94%E7%B3%BB%E6%88%91%E4%BB%AC)

## UI Display

<table style="border-collapse: collapse; border: 1px solid black;">
  <tr>
    <td width="50%";style="padding: 5px;background-color:#fff;"><img src= "https://github.com/user-attachments/assets/8516ef95-6cc7-4769-8fde-fee135e4bab5" alt=" Demo1"   /></td>
    <td width="50%";style="padding: 5px;background-color:#fff;"><img src= "https://github.com/user-attachments/assets/9aaabd11-7550-4245-b297-8156b7a28ce0" alt=" Demo2"   /></td>
  </tr>
  <tr>
    <td width="50%";style="padding: 5px;background-color:#fff;"><img src= "https://github.com/user-attachments/assets/c0e3ada2-58ff-4aa0-92ef-88b66bea6fe8" alt=" Demo3"   /></td>
    <td width="50%";style="padding: 5px;background-color:#fff;"><img src= "https://github.com/user-attachments/assets/cedb669f-55df-4153-b45f-eeedb87768e5" alt=" Demo4"   /></td>
  </tr>
</table>


## Technology Stack
- Frontend：[Vue.js](https://cn.vuejs.org/)
- Backend：[Python / Django](https://www.djangoproject.com/)
- LangChain：[LangChain](https://www.langchain.com/)
- Vector database：[PostgreSQL / pgvector](https://www.postgresql.org/)
- Large models: various local private or public large models

## Join the KB-Builder discussion group on WeChat
<p align="left">
    <img width="30%" alt="image" src="https://github.com/user-attachments/assets/440c070e-88c2-466f-9497-3e30120f32d3">
</p>
    
## Hamaden Chiyan
**This project was developed by Binjiang Research Institute of Hangzhou Dianzi University.**  

Bindian Zhiyan is a large model product for industry segments independently developed by Binjiang Research Institute of Hangzhou Dianzi University. Bindian Zhiyan strengthens the capabilities of domain knowledge extraction and knowledge construction, domain model training and fine-tuning, knowledge retrieval and semantic matching. At present, Bindian Zhiyan has initially built the underlying model capabilities for the vertical fields of energy industry, science and technology education, and medical health, supporting multiple large model application capabilities including intelligent question and answer, domain content generation, text summarization, report generation, data analysis, etc.

Since its official release on August 31, 2023, Bindian Zhiyan has been reported by many news media such as Tencent, Sohu, Hangzhou and Chao News. It is working with multiple customers to build vertical industry big models, striving to build high-quality industry-university-research integration vertical industry big models, and create an intelligent comprehensive solution for your company's exclusive industry big model.

## Special thanks
Thanks to Feizhiyun [MaxKB](https://github.com/1Panel-dev/MaxKB)project for providing technical support!

## License  
Copyright (c) 2014-2024 Bindian Zhiyan, All rights reserved.

Licensed under The GNU General Public License version 3 (GPLv3)  (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

<https://www.gnu.org/licenses/gpl-3.0.html>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
