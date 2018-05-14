package com.tool;


import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.tools.DBHelper;

public class OpenSessionInViewInterceptor implements Interceptor {

    public void destroy() {
    }


    public void init() {
    }


    public String intercept(ActionInvocation actionInvocation) throws Exception {
       //执行action以及result(包含jsp)
        actionInvocation.invoke();
        DBHelper.closeSession();

        return null;
    }
}
