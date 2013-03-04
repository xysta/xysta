package com.xysta.web.util;

public class ResponseData {
	private boolean result;
	private Object message;

	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public Object getMessage() {
		return message;
	}

	public void setMessage(Object message) {
		this.message = message;
	}

	public ResponseData(boolean result, Object message) {
		this.result = result;
		this.message = message;
	}

	public ResponseData() {
		
	}
	
	public ResponseData set(boolean result){
		this.result = result;
		return this;
	}
	
	public ResponseData set(Object message){
		this.message = message;
		return this;
	}
	
}
