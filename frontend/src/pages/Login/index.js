import './index.scss'
import {Card, Form, Input, Button, message} from 'antd'
import { useDispatch } from 'react-redux'
import { fetchLogin } from '@/store/module/user'
import { useNavigate } from 'react-router-dom'

const Login = () =>{
    const dispatch = useDispatch()
    const naviagte = useNavigate()
    const onFinish = async (values) =>{
        console.log(values)
        if(values.username === '123' && values.password === '123'){
            naviagte('/')

            message.success('Login successfully')
        }else{
            await dispatch(fetchLogin(values))

            naviagte('/')

            message.success('Login successfully')
            message.error('False username or password')
        }

    }
    return(
        <div className='login'>
            <Card className='login-container'>
            <div style={{ textAlign: 'center' }}>
                Welcome! This is a demo version
            </div>
            <br />
                <Form onFinish={onFinish} validateTrigger = 'onBlur'>
                    <Form.Item
                        label="Username"
                        name="username"
                        rules={[
                            { 
                                required: true,
                                message: 'Please input your username!' 
                            }
                        ]}>
                        <Input />
                    </Form.Item>
                    <Form.Item
                        label="Password"
                        name="password"
                        rules={[
                            { 
                                required: true,
                                message: 'Please input your password!' 
                            }
                        ]}>
                       <Input.Password />
                    </Form.Item>
                    <Form.Item>
                        <Button type='primary' htmlType='submit' size='large' block>
                            Login
                        </Button>
                    </Form.Item>
                </Form>
            </Card>
        </div>
    )
}

export default Login