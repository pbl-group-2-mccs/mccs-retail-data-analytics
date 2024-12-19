import { Card, Table, Tag, Space, Breadcrumb, Radio, Select, Form, DatePicker, Button, Popconfirm} from 'antd'
import { Link } from 'react-router-dom'
import { EditOutlined, DeleteOutlined } from '@ant-design/icons'
import { useEffect, useState } from 'react'
import { deleteInventoryAPI, getInventoryListAPI } from '@/apis/inventory'
import { format } from 'date-fns';

const { Option } = Select


const Inventory = () => {

    const columns = [
        {
            title: 'Product Id',
            dataIndex: 'productId',
          },
          {
            title: 'Product Name',
            dataIndex: 'productName',
          },
          {
            title: 'Product Line',
            dataIndex: 'productLine',
          },
          {
            title: 'Quantity',
            dataIndex: 'quantity',
          },
          {
            title: 'Price',
            dataIndex: 'unitPrice',
          },
          {
            title: 'Created Date',
            dataIndex: 'createdAt',
              render: (text) => {
                const date = new Date(...text);
                return format(date, 'yyyy-MM-dd');
              }, // Format the date
          },
          {
            title: 'Operation',
            render: data => {
              return (
                  <Space size="middle">
                  <Button type='primary' shape='circle' icon={<EditOutlined />} />
                  <Popconfirm
                    title='Delete the inventory'
                    description='Are you sure to delete this inventory?'
                    onConfirm={() => onConfirm(data)}
                    okText="Yes"
                    cancelText="No"
                  >
                  <Button
                    type='primary'
                    danger
                    shape='circle'
                    icon={<DeleteOutlined />}
                    />
                  </Popconfirm>
                </Space>
              )
            }
          }
    ]

    // const data = [
    //     {
    //         productId: "1",
    //         productName: "Aircraft Carrier",
    //         productLine: "Da Li An",
    //         quantity:"2",
    //         price:2000,
    //         createdAt:"2013-11-19"
    //       },
    // ]



      const [reqData, setReqData] = useState({
        productName:'',
        productLine:'',
        createdAt:'',
        page:1,
        per_page:10
      })


    const [count, setCount] = useState([])
    const [list, setList] = useState([])

    const flatData = list.map((item) => ({
        ...item,
    }));

    useEffect(() => {
        async function getList() {
            const res = await getInventoryListAPI()
            setList(res)
        }
        getList()
    }, [])

    const onFinish = (formValue) => {
      console.log(formValue)
      console.log(formValue.createdAt.format('YYYY-MM-DD'))
      setReqData({
        ...reqData,
        productName: formValue.productName,
        productLine: formValue.productLine,
        createdAt: formValue.createdAt.format('YYYY-MM-DD')
      })
    }

    const onPageChange = (page) => {
      console.log(page)
      setReqData({
        ...reqData,
        page
      })
    }

    const onConfirm = (data) =>{
      console.log(data)
      deleteInventoryAPI(data.productId)
      setReqData({
        ...reqData,
        page:1
      })
    }

    return (
        <div>
          <Card 
            title={
              <Breadcrumb items={[
                {title: <Link to={'/'}>dashboard</Link> },
                {title: 'inventory'},
              ]} />
            }
            style={{marginBottom :20}}
          >
            <Form initialValues={{status: null}} onFinish={onFinish}>
              <Form.Item label='Product Name' name='productName'>
                <Select
                  placeholder='Please select product name'
                  style={{width: 240}}
                  >
                    <Option value='Aircraft Carrier'></Option>
                  </Select>
              </Form.Item>
              <Form.Item label='Product Line' name='productLine'>
                <Select
                  placeholder='Please select product line'
                  style={{width: 240}}
                  >
                    <Option value='Da Li An'></Option>
                    <Option value='Ji Anna'></Option>
                  </Select>
              </Form.Item>
              <Form.Item label='Created Date' name="createdAt">
               <DatePicker />
              </Form.Item>

              <Form.Item>
                <Button type='primary' htmlType='submit' style={{marginLeft:40}}>
                  Filter
                </Button>
              </Form.Item>
            </Form>
            </Card>
            <Card title={'Dataset'}>
                <Table rowKey={"id"} columns={columns} dataSource={flatData} pagination={{
                  total: count,
                  pageSize: reqData.per_page,
                  onChange: onPageChange
                }}
                  />
            </Card>
        </div>
    )
}

export default Inventory