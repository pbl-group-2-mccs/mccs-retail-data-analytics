import { createSlice } from "@reduxjs/toolkit";
import { request } from "@/utils";
import { setToken as _setToken, getToken } from "@/utils";
import { loginAPI } from "@/apis/user";

const userStore = createSlice({
    name:"user",
    initialState: {
        token: getToken() || ''
    },
    reducers:{
        setToken(state, action) {
            state.token = action.payload
            _setToken(action.payload)
        }
    }
})

const { setToken } = userStore.actions

const userReducer = userStore.reducer

const fetchLogin = (loginForm)=>{
    return async (dispatch) =>{
        //login api name
        const res = await loginAPI(loginForm)
        dispatch(setToken(res.data.token))
    }
}

export{ fetchLogin, setToken }

export default userReducer