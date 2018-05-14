import com.dao.Dao;
import com.msg.webSocket.Push;
import com.tool.PushMsg;
import com.tool.TemporalMsgs;
import com.tool.WebSocketPush;
import com.tools.DBHelper;
import jdk.nashorn.internal.objects.annotations.Property;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;

import javax.annotation.Resource;

import static org.junit.Assert.*;

@Configuration
@ComponentScan(basePackages = {"com.msg.webSocket"})
public class test {



    @Test
    public void test(){


        //Session session= DBHelper.currentSession();
       ClassPathXmlApplicationContext clph=new ClassPathXmlApplicationContext("spring-config.xml");
        TemporalMsgs temporalMsgs= (TemporalMsgs) clph.getBean("temporalMsgs");
        //assertNotNull(push);
        assertNotNull(temporalMsgs);
        assertNotNull(temporalMsgs.getMyPush());
        WebSocketPush webSocketPush= (WebSocketPush) temporalMsgs.getMyPush();
        assertNotNull(webSocketPush.getPush());
        //assertNotNull(webSocketPush.getPush().temporalMsgs);
    }
}
