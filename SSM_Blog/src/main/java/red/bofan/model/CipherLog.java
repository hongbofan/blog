package red.bofan.model;

/**
 * Created by DELL on 2018/2/5.
 */
public class CipherLog extends BaseDto{
    private String logId;
    private String cipherId;
    private String submitAnswer;
    private String userId;
    private String userName;
    private String submitIp;

    public String getLogId() {
        return logId;
    }

    public void setLogId(String logId) {
        this.logId = logId;
    }

    public String getCipherId() {
        return cipherId;
    }

    public void setCipherId(String cipherId) {
        this.cipherId = cipherId;
    }

    public String getSubmitAnswer() {
        return submitAnswer;
    }

    public void setSubmitAnswer(String submitAnswer) {
        this.submitAnswer = submitAnswer;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSubmitIp() {
        return submitIp;
    }

    public void setSubmitIp(String submitIp) {
        this.submitIp = submitIp;
    }
}
