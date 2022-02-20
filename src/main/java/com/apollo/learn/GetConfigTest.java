package com.apollo.learn;

import com.ctrip.framework.apollo.Config;
import com.ctrip.framework.apollo.ConfigService;

/**
 * @author 正能量导师
 * @version 1.0
 * @description
 * @date 19/2/2022 下午7:09
 */
public class GetConfigTest {

    //-Dapp.id=apollo-quickstart -Denv=DEV -Ddev_meta=http://localhost:8080
    public static void main(String[] args) {
//        Config config = ConfigService.getAppConfig();
        Config config1 = ConfigService.getConfig("spring-rocketmq");
//        String someKey = "sms.enable";

        String someKey = "rocketmq.name-server";

        while (true){
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            String value = config1.getProperty(someKey,null);
            System.out.println("sms.enable:"+value);
        }


    }
}
