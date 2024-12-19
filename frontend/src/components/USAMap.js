import * as echarts from 'echarts';
import { useEffect, useRef, useState } from 'react';
import { getUSAMapAPI } from '@/apis/visualization';
import usaJson from '@/assets/usa.json'; // Adjust the path as necessary// Ensure this path is correct

const USAMap = () => {
    const chartRef = useRef(null);
    const [data, setData] = useState([]); // State to hold the map data

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await getUSAMapAPI(); // Fetch data from the backend
                setData(response); // Set the fetched data to state
            } catch (error) {
                console.error('Error fetching data:', error); // Log any errors
            }
        };

        fetchData(); // Call the fetch function
    }, []); // Run only once on mount

    useEffect(() => {
        const myChart = echarts.init(chartRef.current);

        // Register the USA map
        echarts.registerMap('USA', usaJson, {
            Alaska: {              // 把阿拉斯加移到美国主大陆左下方
                left: -131,
                top: 25,
                width: 15
            },
            Hawaii: {
                left: -110,        // 夏威夷
                top: 28,
                width: 5
            },
            'Puerto Rico': {       // 波多黎各
                left: -76,
                top: 26,
                width: 2
            }
        });

        const option = {
            title: {
                text: 'USA Map',
                subtext: 'Sales map',
                left: 'center',
            },
            tooltip : {
                trigger: 'item',
                showDelay: 0,
                transitionDuration: 0.2,
                formatter : function (params) {
                    var value = (params.value + '').split('.');
                    value = value[0].replace(/(\d{1,3})(?=(?:\d{3})+(?!\d))/g, '$1,');
                    return params.seriesName + '<br/>' + params.name + ' : ' + value;
                }
            },
            visualMap: {
                min: 3500,
                max: 11000,
                color: ['orangered','yellow','lightskyblue'],
                left: 'right',
                // top: 'bottom',
                text: ['High', 'Low'],
                calculable: true,
            },
            toolbox: {
                show : true,
                //orient : 'vertical',
                left: 'left',
                top: 'top',
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            series: [
                {
                    name: 'Sales Order',
                    type: 'map',
                    roam: true,
                    map: 'USA',
                    itemStyle:{
                        emphasis:{label:{show:true}}
                    },
                    // 文本位置修正
                    textFixed : {
                        Alaska : [20, -20]
                    },
                    data: data.map(item => ({
                        name: item.region, // Ensure this matches your data structure
                        value: item.totalSales, // Ensure this matches your data structure
                    })),
                },
            ],
        };
        //console.log('Echart map Option:', option);
        myChart.setOption(option);

        return () => {
            myChart.dispose(); // Clean up the chart instance on unmount
        };
    }, [data]); // Re-run when data changes

    return <div><div ref={chartRef} style={{ width: '1200px', height: '800px' }}></div></div>;
};

export default USAMap;


