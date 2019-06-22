'use strict';

import Knex from 'knex';
import validate from 'validate';


import configs from '../configs/index';

const knex = Knex(configs.knexConfig);

export default class Individual{

  // //用户登录
  static async insert(ctx, next) {
    // 判断数据输入
    let new_data = ctx;
    // console.log('时间')
    // console.log(typeof new_data.now_date)
    // console.log('温度')
    // console.log(typeof new_data.temperature)
    // console.log('湿度')
    // console.log(typeof new_data.humidity)
    // console.log('压强')
    // console.log(typeof new_data.pressure)
    //输入数据的代码
    if(new_data.now_date !== ''){
      if(new_data.temperature !== ''){
        if(new_data.humidity !== ''){
          if(new_data.pressure !== ''){

            let insert_data = {};
            insert_data.time = new_data.now_date;
            insert_data.temperature = new_data.temperature;
            insert_data.humidity = new_data.humidity;
            insert_data.pressure = new_data.pressure;
            //插入数据
            let res = await knex('jiare').insert(insert_data);
              // console.log(res);
              if(res[0] != 0){
                return 'success';
              }else{
                return 'wrong';
              }
          }else{
            return 'pressureIsNull';
          }
        }else{
          return 'humidityIsNull';
        }
      }else{
        return 'temperatureIsNUll';
      }
    }else {
      return 'dateIsNull';
    }

}

//冷却炉数据输入
    static async insertlengque(ctx, next){
        let new_data = ctx;
        // console.log('时间')
        // console.log(typeof new_data.now_date)
        // console.log('温度')
        // console.log(typeof new_data.temperature)
        // console.log('湿度')
        // console.log(typeof new_data.humidity)
        // console.log('压强')
        // console.log(typeof new_data.pressure)
        //输入数据的代码
        if(new_data.now_date !== ''){
            if(new_data.temperature !== ''){
                if(new_data.humidity !== ''){
                    if(new_data.pressure !== ''){

                        let insert_data = {};
                        insert_data.time = new_data.now_date;
                        insert_data.temperature = new_data.temperature;
                        insert_data.humidity = new_data.humidity;
                        insert_data.pressure = new_data.pressure;
                        //插入数据
                        let res = await knex('lengque').insert(insert_data);
                        // console.log(res);
                        if(res[0] != 0){
                            return 'success';
                        }else{
                            return 'wrong';
                        }
                    }else{
                        return 'pressureIsNull';
                    }
                }else{
                    return 'humidityIsNull';
                }
            }else{
                return 'temperatureIsNUll';
            }
        }else {
            return 'dateIsNull';
        }
    }

    //回火炉数据输入
    static async inserthuihuo(ctx, next){
        let new_data = ctx;
        // console.log('时间')
        // console.log(typeof new_data.now_date)
        // console.log('温度')
        // console.log(typeof new_data.temperature)
        // console.log('湿度')
        // console.log(typeof new_data.humidity)
        // console.log('压强')
        // console.log(typeof new_data.pressure)
        //输入数据的代码
        if(new_data.now_date !== ''){
            if(new_data.temperature !== ''){
                if(new_data.humidity !== ''){
                    if(new_data.pressure !== ''){

                        let insert_data = {};
                        insert_data.time = new_data.now_date;
                        insert_data.temperature = new_data.temperature;
                        insert_data.humidity = new_data.humidity;
                        insert_data.pressure = new_data.pressure;
                        //插入数据
                        let res = await knex('lengque').insert(insert_data);
                        // console.log(res);
                        if(res[0] != 0){
                            return 'success';
                        }else{
                            return 'wrong';
                        }
                    }else{
                        return 'pressureIsNull';
                    }
                }else{
                    return 'humidityIsNull';
                }
            }else{
                return 'temperatureIsNUll';
            }
        }else {
            return 'dateIsNull';
        }
    }

    //淬火炉数据输入
    static async insertcuihuo(ctx, next){
        let new_data = ctx;
        // console.log('时间')
        // console.log(typeof new_data.now_date)
        // console.log('温度')
        // console.log(typeof new_data.temperature)
        // console.log('湿度')
        // console.log(typeof new_data.humidity)
        // console.log('压强')
        // console.log(typeof new_data.pressure)
        //输入数据的代码
        if(new_data.now_date !== ''){
            if(new_data.temperature !== ''){
                if(new_data.humidity !== ''){
                    if(new_data.pressure !== ''){
                        if(new_data.jiezhi !== '') {

                            let insert_data = {};
                            insert_data.time = new_data.now_date;
                            insert_data.temperature = new_data.temperature;
                            insert_data.humidity = new_data.humidity;
                            insert_data.pressure = new_data.pressure;
                            insert_data.jiezhi = new_data.jiezhi;
                            //插入数据
                            let res = await knex('cuihuo').insert(insert_data);
                            // console.log(res);
                            if (res[0] != 0) {
                                return 'success';
                            } else {
                                return 'wrong';
                            }
                        }else{
                            return 'jiezhiIsNull';
                        };
                    }else{
                        return 'pressureIsNull';
                    }
                }else{
                    return 'humidityIsNull';
                }
            }else{
                return 'temperatureIsNUll';
            }
        }else {
            return 'dateIsNull';
        }
    }

}
