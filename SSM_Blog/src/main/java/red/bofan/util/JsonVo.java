package red.bofan.util;

public class JsonVo {
	private String msg;
	private Integer code;
	private Object data;

	public String getMsg() {
		return msg;
	}

	public JsonVo setMsg(String msg) {
		this.msg = msg;
		return this;
	}

	public Integer getCode() {
		return code;
	}

	public JsonVo setCode(Integer code) {
		this.code = code;
		return this;
	}

	public Object getData() {
		return data;
	}

	public JsonVo setData(Object data) {
		this.data = data;
		return this;
	}
}
