import * as echarts from 'echarts';
import { useEffect, useRef } from 'react';

const PieChart = ({title, data}) =>{
    const chartRef = useRef(null)
    useEffect(() => {
        //保证dom可用 才进行图表的渲染
        //1.获取渲染图表的dom节点
        const chartDom = chartRef.current

        //2.图表初始化生成图表实例对象
        const myChart = echarts.init(chartDom);

        //3.准备图表参数
        const option = {
            title: {
                text: title,
                subtext: 'Group by product type',
                left: 'center'
              },
              tooltip: {
                trigger: 'item'
              },
              legend: {
                orient: 'vertical',
                left: 'left'
              },
              series: [
                {
                  name: 'Access From',
                  type: 'pie',
                  radius: '50%',
                  data: data,
                  emphasis: {
                    itemStyle: {
                      shadowBlur: 10,
                      shadowOffsetX: 0,
                      shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                  }
                }
              ]
        };

        option && myChart.setOption(option);
    },[])
    return <div><div ref={ chartRef } style={{ width:'500px', height:'400px'}}></div></div> 
}

export default PieChart