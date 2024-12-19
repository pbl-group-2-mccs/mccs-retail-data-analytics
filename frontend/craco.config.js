//config of webpack extension

const path = require('path')

module.exports = {
    //config of webpack
    webpack:{
        alias: {
            '@':path.resolve(__dirname,'src')
        }
    }
}