//
//  File.swift
//  BaseSdk
//
//  Created by Howard on 2021/1/11.
//

import Foundation

//userdefault工具类
open class MyUserDefaultUtil {
    //保存数据
    @objc public static func save(_ key:String,_ obj:Any) {
        let userDefaults =  UserDefaults.standard
        userDefaults.setValue(obj, forKey: key)
        userDefaults.synchronize()
    }
    //获取数据
    @objc public static func get(_ key:String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
    //清除数据
    @objc public static func remove(_ key:String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
