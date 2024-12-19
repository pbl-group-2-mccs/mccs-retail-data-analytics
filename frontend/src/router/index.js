import Layout from '@/pages/Layout'
import Login from '@/pages/Login'

import { createBrowserRouter } from 'react-router-dom'
import { AuthRoute } from '@/components/AuthRoute'
import Home from '@/pages/Home'
import SalesOrder from '@/pages/SalesOrder'
import Inventory from '@/pages/Inventory'

const router = createBrowserRouter([
    {
        path: "/",
        element: 
        // <AuthRoute> 
            <Layout /> 
        // </AuthRoute>
        ,
        children:[
            {
                element: <Home />,
                index:true
            },
            {
                path: 'salesorder',
                element: <SalesOrder />
            },
            {
                path:'inventory',
                element: <Inventory />
            }
        ]
    },
    {
        path:"/login",
        element:<Login />
    }
])

export default router