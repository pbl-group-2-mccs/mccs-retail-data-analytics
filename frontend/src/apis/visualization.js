import { request } from "@/utils";

export function getUSAMapAPI(){
    return request({
        url: '/api/visualization/sales-by-region',
        method: 'GET',
    })
}