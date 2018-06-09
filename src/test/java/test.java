import com.dao.Dao;
import com.msg.webSocket.Push;
import com.pojo.Message;
import com.pojo.Warn;
import com.tool.PushMsg;
import com.tool.TemporalMsgs;
import com.tool.Utils;
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

import java.util.List;

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

    @Test
    public void testDel() {
        int warnid = 6;
        Dao dao = new Dao();
        //Warn x = (Warn) dao.select(Warn.class, warnid);
        Message x= (Message) dao.select(Message.class,1);

            dao.del(x);

      // Warn x2 = (Warn) dao.select(Warn.class, warnid);
        Message x2= (Message) new Dao().select(Message.class,1);
        assertNull(x2);
    }

    @Test
    public void testWhat(){
        Dao dao=new Dao();
        List scores=dao.selectAll("Score s where eid=86 AND sid=3");
        assertNotNull(scores);
    }

}
