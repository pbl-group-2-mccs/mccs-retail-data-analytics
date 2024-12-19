import { Card, Table, Tag, Space, Breadcrumb, Radio, Select, Form, DatePicker, Button, Popconfirm} from 'antd'
import { Link } from 'react-router-dom'
import { EditOutlined, DeleteOutlined } from '@ant-design/icons'
import { useEffect, useState } from 'react'
import { deleteSalesOrderAPI, getSalesOrdersListAPI } from '@/apis/sales-orders'
import { format } from 'date-fns';

const { Option } = Select

const status = {
    COMPLETED: <Tag color='success'>COMPLETED</Tag>,
    CANCELLED: <Tag color='error'>CANCELLED</Tag>,
    PENDING: <Tag color='warning'>PENDING</Tag>
}

const SalesOrder = () => {

    const columns = [
        {
            title: 'Order Id',
            dataIndex: 'orderId',
          },
        {
            title: 'Product Name',
            dataIndex: 'productName',
        },
          {
            title: 'Customer Id',
            dataIndex: 'customerId',
          },
          {
            title: 'Customer Name',
            dataIndex: 'name',
          },
          {
            title: 'Customer Email',
            dataIndex: 'email',
          },
          {
            title: 'Customer Phone',
            dataIndex: 'phone',
          },
          {
            title: 'Customer Address Line 1',
            dataIndex: 'addressLine1',
          },
          {
            title: 'Order Date',
            dataIndex: 'orderDate',
              render: (text) => {
                  const date = new Date(...text);
                  return format(date, 'yyyy-MM-dd');
              }, // Format the date
          },
          {
            title: 'Quantity',
            dataIndex: 'quantity',
          },
          {
            title: 'Unit Price',
            dataIndex: 'unitPrice',
          },
          {
            title: 'Status',
            dataIndex: 'status',
            render: data => status[data]
          },
          {
            title: 'Operation',
            render: data => {
              return (
                  <Space size="middle">
                  <Button type='primary' shape='circle' icon={<EditOutlined />} />
                  <Popconfirm
                    title='Delete the sales order'
                    description='Are you sure to delete this sales order?'
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
    //         orderId: '1',
    //         customer: {
    //             customerId:44,
    //             name:"Timothy Berger",
    //             email:"nicholaswall@example.com",
    //             phone:"240232312",
    //             addressLine1:"9281",
    //             addressLine2:null,
    //             city:"Washington",
    //             state:"Virginia",
    //             zipCode:"22042",
    //             country:"USA",
    //         },
    //         orderDate:"2024-11-26",
    //         totalAmount:488.39,
    //         status:"Cancelled"
    //       },
    // ]


      
      const [reqData, setReqData] = useState({
        status:'',
        name:'',
        date:'',
        page:1,
        per_page:10
      })


    const [count, setCount] = useState([])
    const [list, setList] = useState([])

    const flatData = list.map((item) => ({
        ...item,
        customerId: item.customer?.customerId,
        name: item.customer?.name,
        email: item.customer?.email,
        phone: item.customer?.phone,
        addressLine1: item.customer?.addressLine1
    }));

    useEffect(() => {
        async function getList() {
            const res = await getSalesOrdersListAPI()
            setList(res)
        }
        getList()
    }, [])

    const onFinish = (formValue) => {
      console.log(formValue)
      console.log(formValue.date.format('YYYY-MM-DD'))
      setReqData({
        ...reqData,
        status: formValue.status,
        name: formValue.name,
        date: formValue.date.format('YYYY-MM-DD')
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
      deleteSalesOrderAPI(data.orderId)
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
                {title: 'sales-order'},
              ]} />
            }
            style={{marginBottom :20}}
          >
            <Form initialValues={{status: null}} onFinish={onFinish}>
              <Form.Item label='Status' name='status'>
                <Radio.Group>
                    <Radio value={0}>COMPLETED</Radio>
                    <Radio value={1}>CANCELLED</Radio>
                    <Radio value={2}>PENDING</Radio>
                </Radio.Group>
              </Form.Item>
              <Form.Item label='Customer Name' name='name'>
                <Select
                  placeholder='Please select customer'
                  style={{width: 240}}
                  >
                    <Option value='Timothy Berger'></Option>
                  </Select>
              </Form.Item>
              <Form.Item label='Date' name="date">
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

export default SalesOrder