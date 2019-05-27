package org.kh.sunbang.admin.model.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class Editor implements java.io.Serializable{
	private static final long serialVersionUID = 1131435L;
	private MultipartFile Filedata;
	private String callback;
	private String callback_func;
	
	public Editor() {}
	
	public Editor(MultipartFile filedata, String callback, String callback_func) {
		super();
		Filedata = filedata;
		this.callback = callback;
		this.callback_func = callback_func;
	}

	public MultipartFile getFiledata() {
		return Filedata;
	}

	public void setFiledata(MultipartFile filedata) {
		Filedata = filedata;
	}

	public String getCallback() {
		return callback;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	public String getCallback_func() {
		return callback_func;
	}

	public void setCallback_func(String callback_func) {
		this.callback_func = callback_func;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
