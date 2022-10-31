package com.cozy.www.user;

public class Paging {
   private int limit;
   private int Page;
   private int nowPage;
   private int Startpage;
   private int Endpage;
   private int Maxpage;
   private int offset;
   private String ch1;
   private String ch2;
   
   public int getLimit() {
      return limit;
   }
   public void setLimit(int limit) {
      this.limit = limit;
   }
   
   public int getPage() {
      return Page;
   }
   public void setPage(int page) {
      Page = page;
   }
   
   public int getNowPage() {
      return nowPage;
   }
   public void setNowPage(int nowPage) {
      this.nowPage = nowPage;
   }
   public int getStartpage() {
      return Startpage;
   }
   public void setStartpage(int startpage) {
      Startpage = startpage;
   }
   public int getEndpage() {
      return Endpage;
   }
   public void setEndpage(int endpage) {
      Endpage = endpage;
   }
   public int getMaxpage() {
      return Maxpage;
   }
   public void setMaxpage(int maxpage) {
      Maxpage = maxpage;
   }
   public int getOffset() {
      return offset;
   }
   public void setOffset(int offset) {
      this.offset = offset;
   }
   public String getCh1() {
      return ch1;
   }
   public void setCh1(String ch1) {
      this.ch1 = ch1;
   }
   public String getCh2() {
      return ch2;
   }
   public void setCh2(String ch2) {
      this.ch2 = ch2;
   }   
   
   
}