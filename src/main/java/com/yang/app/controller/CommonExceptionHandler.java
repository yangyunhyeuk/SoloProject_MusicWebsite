package com.yang.app.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice("com.yang.app.controller")
public class CommonExceptionHandler {

   @ExceptionHandler(NullPointerException.class)
   public ModelAndView handleNullPointerException(Exception e) {
      ModelAndView mav=new ModelAndView();
      mav.addObject("exception", e);
      mav.setViewName("excep/error");
      return mav;
   }
   
   @ExceptionHandler(Exception.class)
   public ModelAndView handleException(Exception e) {
      ModelAndView mav=new ModelAndView();
      mav.addObject("exception", e);
      mav.setViewName("excep/error");
      return mav;
   }
      
}