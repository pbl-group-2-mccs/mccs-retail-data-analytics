import { request } from "@/utils";

export function getInventoryListAPI(){
    return request({
        url: '/api/inventory',
        method: 'GET',
    })
}

export function deleteInventoryAPI(id){
    return request({
        url: '/api/inventory/${id}',
        method:'DELETE'
    })
}