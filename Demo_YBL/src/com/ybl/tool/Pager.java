package com.ybl.tool;

public class Pager {
	private int pageNow;
	private int pageSize=20;
	private int totalPage;		//总页数
	private int totalSize;		//总记录数
	private boolean hasFirst;   //是否有首页
	private boolean hasPre;   //是否有前一页
	private boolean hasNext;   //是否有下一页
	private boolean hasLast;   //是否有最后一页
	public Pager(int pageNow,int pagesize,int totalSize ){
		this.pageNow=pageNow;
		this.pageSize=pagesize;
		this.totalSize=totalSize;
	}
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		totalPage=getTotalSize()/getPageSize();
		if(getTotalSize()%getPageSize()!=0)totalPage++;
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
	public boolean isHasFirst() {
		hasFirst=true;
		if(pageNow==1)hasFirst=false;
		return hasFirst;
	}
	public void setHasFirst(boolean hasFirst) {
		this.hasFirst = hasFirst;
	}
	public boolean isHasPre() {
		hasPre=!isHasFirst();
		return hasPre;
	}
	public void setHasPre(boolean hasPre) {
		this.hasPre = hasPre;
	}
	public boolean isHasNext() {
		hasNext=!isHasLast();
		return hasNext;
	}
	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}
	public boolean isHasLast() {
		hasLast=true;
		if(pageNow==this.getTotalPage())hasLast=false;
		return hasLast;
	}
	public void setHasLast(boolean hasLast) {
		this.hasLast = hasLast;
	}
	
	
}
