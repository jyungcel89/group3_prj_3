package kr.co.sist.domain;

import kr.co.sist.vo.Paging;

public class EventSelectList extends Paging{

	private int event_num;
	private String title,event_start,event_end;
	public int getEvent_num() {
		return event_num;
	}
	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEvent_start() {
		return event_start;
	}
	public void setEvent_start(String event_start) {
		this.event_start = event_start;
	}
	public String getEvent_end() {
		return event_end;
	}
	public void setEvent_end(String event_end) {
		this.event_end = event_end;
	}
	
	
	
}
