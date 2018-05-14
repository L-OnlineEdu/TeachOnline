package com.msg.webSocket;
import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

/**
 * 从websocket中获取用户session
 * 由于HTTP协议与websocket协议的不同，导致没法直接从websocket中获取协议，
 * 下面的类中写了获取HttpSession的代码，但是如果真的放出去执行，那么会报空指值异常，因为这个HttpSession并没有设置进去。
 需要我们自己来来设置HttpSession。这时候我们需要写一个监听器  下面有监听器的代码。
 *
 */
public class HttpSessionConfigurator extends Configurator {

    @Override
    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {

        HttpSession httpSession = (HttpSession) request.getHttpSession();
        // ServerEndpointConfig 继承->EndpointConfig  中一个方法
        //  Map<String,Object> getUserProperties();  对这个map进行赋值
        sec.getUserProperties().put(HttpSession.class.getName(), httpSession);
    }
}