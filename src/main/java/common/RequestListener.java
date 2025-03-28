//package common;
//
//import jakarta.servlet.ServletRequestEvent;
//import jakarta.servlet.ServletRequestListener;
//import jakarta.servlet.annotation.WebListener;
//import jakarta.servlet.http.HttpServletRequest;
//
//@WebListener
//public class RequestListener implements ServletRequestListener {
//
//    @Override
//    public void requestDestroyed(ServletRequestEvent sre) {
//        // TODO Auto-generated method stub
//
//    }
//
//    @Override
//    public void requestInitialized(ServletRequestEvent sre) {
//        System.out.println("httpServletRequestInitialized");
//        ((HttpServletRequest) sre.getServletRequest()).getSession();
//
//    }
//}