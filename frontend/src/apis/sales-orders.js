import { request } from "@/utils";

export function getSalesOrdersListAPI(){
    return request({
        url: '/api/sales-orders',
        method: 'GET',
    })
}

export function deleteSalesOrderAPI(id){
    return request({
        url: '/api/sales-orders/${id}',
        method:'DELETE'
    })
}