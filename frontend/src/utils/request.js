//axios
import axios from "axios";
import { getToken } from "./token";
//1.root domain
//2.time
//3.request / response inteceptor

const request = axios.create({
    //backend domain
    baseURL: 'http://localhost:8000',
    timeout: 5000
})

//添加请求拦截器
//在请求发送之前 做拦截 插入一些自定义的配置（参数处理）
request.interceptors.request.use((config) => {
    //操作这个config 注入token数据
    //1.获取到token
    //2.按照后端的格式要求做token拼接
    const token = getToken()
    if(token){
        config.headers.Authorization = 'Bearer ${token}'
    }
    return config
},(error) => {
    return Promise.reject(error)
})

request.interceptors.response.use((response) =>{
    return response.data
},(error) => {
    return Promise.reject(error)
})
export { request }