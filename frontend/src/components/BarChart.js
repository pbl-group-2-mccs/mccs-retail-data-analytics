import * as echarts from 'echarts';
import { useEffect, useRef } from 'react';

//1.把功能代码都放到这个组件中
//2.把可变的部分抽象成prop参数

const BarChart = ({title, xdata, seriesData}) => {
    const chartRef = useRef(null)
    useEffect(() => {
        //保证dom可用 才进行图表的渲染
        //1.获取渲染图表的dom节点
        const chartDom = chartRef.current

        //2.图表初始化生成图表实例对象
        const myChart = echarts.init(chartDom);

        //3.准备图表参数
        const option = {
        title:{
            text: title
        },
        xAxis: {
            type: 'category',
            data: xdata
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
            data: seriesData, 
            type: 'bar'
            }
        ]
        };

        option && myChart.setOption(option);
    },[])
    return <div><div ref={ chartRef } style={{ width:'500px', height:'400px'}}></div></div> 
}

export default BarChart


