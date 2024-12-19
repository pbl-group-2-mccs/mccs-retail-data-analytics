import { Card, Row, Col } from 'antd';
import BarChart from "@/components/BarChart"
import PieChart from "@/components/PieChart"
import USAMap from "@/components/USAMap"
import { getUSAMapAPI } from '@/apis/visualization'
import { useEffect, useState } from 'react'

const Home = () => {
    //   const [ usaMap, setMap] = useState([])
    //   useEffect(() => {
    //       async function getMap() {
    //           const res = await getUSAMapAPI()
    //           console.log(res)
    //           setMap(res)
    //           console.log(usaMap)
    //       }
    //       getMap()
    //   }, [])

    //   useEffect(() => {
    //     const mapData = usaMap.map((item) => ({
    //       name: item.region,
    //       value: item.totalSales
    //     }));
    // }, [usaMap]); // 依赖 usaMap

    const mapData = [
        { name: 'Alabama', value: 4822023 },
        { name: 'Alaska', value: 731449 },
        { name: 'Arizona', value: 6553255 },
        { name: 'Arkansas', value: 2949131 },
        { name: 'California', value: 38041430 },
        { name: 'Colorado', value: 5187582 },
        { name: 'Connecticut', value: 3590347 },
        { name: 'Delaware', value: 917092 },
        { name: 'District of Columbia', value: 632323 },
        { name: 'Florida', value: 19317568 },
        { name: 'Georgia', value: 9919945 },
        { name: 'Hawaii', value: 1392313 },
        { name: 'Idaho', value: 1595728 },
        { name: 'Illinois', value: 12875255 },
        { name: 'Indiana', value: 6537334 },
        { name: 'Iowa', value: 3074186 },
        { name: 'Kansas', value: 2885905 },
        { name: 'Kentucky', value: 4380415 },
        { name: 'Louisiana', value: 4601893 },
        { name: 'Maine', value: 1329192 },
        { name: 'Maryland', value: 5884563 },
        { name: 'Massachusetts', value: 6646144 },
        { name: 'Michigan', value: 9883360 },
        { name: 'Minnesota', value: 5379139 },
        { name: 'Mississippi', value: 2984926 },
        { name: 'Missouri', value: 6021988 },
        { name: 'Montana', value: 1005141 },
        { name: 'Nebraska', value: 1855525 },
        { name: 'Nevada', value: 2758931 },
        { name: 'New Hampshire', value: 1320718 },
        { name: 'New Jersey', value: 8864590 },
        { name: 'New Mexico', value: 2085538 },
        { name: 'New York', value: 19570261 },
        { name: 'North Carolina', value: 9752073 },
        { name: 'North Dakota', value: 699628 },
        { name: 'Ohio', value: 11544225 },
        { name: 'Oklahoma', value: 3814820 },
        { name: 'Oregon', value: 3899353 },
        { name: 'Pennsylvania', value: 12763536 },
        { name: 'Rhode Island', value: 1050292 },
        { name: 'South Carolina', value: 4723723 },
        { name: 'South Dakota', value: 833354 },
        { name: 'Tennessee', value: 6456243 },
        { name: 'Texas', value: 26059203 },
        { name: 'Utah', value: 2855287 },
        { name: 'Vermont', value: 626011 },
        { name: 'Virginia', value: 8185867 },
        { name: 'Washington', value: 6897012 },
        { name: 'West Virginia', value: 1855413 },
        { name: 'Wisconsin', value: 5726398 },
        { name: 'Wyoming', value: 576412 },
        { name: 'Puerto Rico', value: 3667084 }
    ]

    return (
        <Row gutter={16}>
            {/* First Card - Left */}
            <Col span={12}>
                <Card style={{ marginBottom: '20px' }}>
                    <BarChart
                        title={'Sales data by Month (2024)'}
                        seriesData={[587, 765, 801, 605, 740, 912, 1057, 1288, 1105, 906, 851, 802]}
                        xdata={['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']}
                    />
                </Card>
            </Col>

            {/* Second Card - Right */}
            <Col span={12}>
                <Card style={{ marginBottom: '20px' }}>
                    <PieChart
                        title={'Product Revenue by Line'}
                        data={[
                            { value: 1048, name: 'Electronics' },
                            { value: 735, name: 'Home & Garden' },
                            { value: 580, name: 'Toys' },
                            { value: 484, name: 'Clothing' }
                        ]}
                    />
                </Card>
            </Col>
            {/* Third Card - Full width below */}
            <Col span={24}>
                <Card>
                    <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
                        <USAMap data={mapData} />
                    </div>
                </Card>
            </Col>
        </Row>
    );
};

export default Home;




// import BarChart from "@/components/BarChart"
// import PieChart from "@/components/PieChart"
// import USAMap from "@/components/USAMap"
// import { useEffect, useState } from 'react'
// import { getUSAMapAPI } from '@/apis/visualization'
//
// const Home = () => {
//     const [ list, setList] = useState([])
//     useEffect(() => {
//         async function getList() {
//             const res = await getUSAMapAPI()
//             console.log(res)
//             setList(res)
//             console.log('After:', list)
//         }
//         getList()
//     }, [])
//
//     const mapData = list.map((item) => ({
//         name: item.region,
//         value: item.totalSales
//     }));
//     // const [ usaMap, setMap] = useState([])
//     //
//     // useEffect(() => {
//     //     async function getMap() {
//     //         const res = await getUSAMapAPI()
//     //         // console.log(res)
//     //         console.log(res)
//     //         console.log(res.length)
//     //         console.log(res[0])
//     //         // setMap(res)
//     //         console.log(usaMap)
//     //     }
//     //     getMap()
//     // }, [])
//     //
//     // useEffect(() => {
//     //     console.log(usaMap)
//     // }, [usaMap]); // 依赖 usaMap
//     //
//     // const mapData = usaMap.map((item) => ({
//     //     name: item.region,
//     //     value: item.totalSales
//     // }));
//
//     return <div>
//         <BarChart title={'Product Stock Risk Status'}
//                   seriesData={[20, 40, 70]}
//                   xdata={['Laptop', 'Tablet', 'Smartwatch', ]}/>
//         <PieChart title={'Product Value Classification'}
//                   data={[
//                     { value: 1048, name: 'Home & Garden' },
//                     { value: 735, name: 'Clothing' },
//                     { value: 580, name: 'Toys' },
//                     { value: 484, name: 'Electronics' }
//                   ]}/>
//         <USAMap data={mapData}/>
//     </div>
// }
//
// export default Home