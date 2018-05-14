package com.test;

import com.msg.webSocket.Push;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

import static org.junit.Assert.assertNotNull;

@Component
@Configuration
@ComponentScan(basePackages = {"com.msg.webSocket"})
public class test {
    @Autowired
    private Push push;

/*
    public Push getPush() {
        return push;
    }

    public void setPush(Push push) {
        this.push = push;
    }
*/

    @Test
    public void test(){
        //Session session= DBHelper.currentSession();
       /* ClassPathXmlApplicationContext clph=new ClassPathXmlApplicationContext("spring-config.xml");
        Push push= (Push) clph.getBean("push");*/
        assertNotNull(push);
    }
}
