package red.bofan.model;

import java.util.Date;

/**
 * Created by hongbofan on 2016/11/29.
 */
public class CipherVo {
    private String id;

    private Boolean trigger;

    private Date publishTime;

    private Long remainingMsec;//剩余时间

    private String content;

    private String title;

    private Long fhintRemainingMsec;

    private Boolean hint1trigger;


    private Long shintRemainingMsec;

    private Boolean hint2trigger;


    private Long thintRemainingMsec;

    private Boolean hint3trigger;

    public  CipherVo(){
        this.trigger = false;
        this.hint1trigger = false;
        this.hint2trigger = false;
        this.hint3trigger = false;
    }


    public Date getPublishTime() {
        return publishTime;
    }

    public CipherVo setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
        return this;
    }

    public Boolean getTrigger() {
        return trigger;
    }

    public CipherVo setTrigger(Boolean trigger) {
        this.trigger = trigger;
        return this;
    }

    public Boolean getHint1trigger() {
        return hint1trigger;
    }

    public CipherVo setHint1trigger(Boolean hint1trigger) {
        this.hint1trigger = hint1trigger;
        return this;
    }

    public Boolean getHint2trigger() {
        return hint2trigger;
    }

    public CipherVo setHint2trigger(Boolean hint2trigger) {
        this.hint2trigger = hint2trigger;
        return this;
    }

    public Boolean getHint3trigger() {
        return hint3trigger;
    }

    public CipherVo setHint3trigger(Boolean hint3trigger) {
        this.hint3trigger = hint3trigger;
        return this;
    }

    public String getId(){
        return id;
    }
    public CipherVo setId(String id){
        this.id = id;
        return this;
    }
    public Long getRemainingMsec() {
        return remainingMsec;
    }

    public CipherVo setRemainingMsec(Long remainingMsec) {
        this.remainingMsec = remainingMsec;
        return this;
    }

    public String getContent() {
        return content;
    }

    public CipherVo setContent(String content) {
        this.content = content;
        return this;
    }

    public String getTitle() {
        return title;
    }

    public CipherVo setTitle(String title) {
        this.title = title;
        return this;
    }

    public Long getFhintRemainingMsec() {
        return fhintRemainingMsec;
    }

    public CipherVo setFhintRemainingMsec(Long fhintRemainingMsec) {
        this.fhintRemainingMsec = fhintRemainingMsec;
        return this;
    }

    public Long getShintRemainingMsec() {
        return shintRemainingMsec;
    }

    public CipherVo setShintRemainingMsec(Long shintRemainingMsec) {
        this.shintRemainingMsec = shintRemainingMsec;
        return this;
    }

    public Long getThintRemainingMsec() {
        return thintRemainingMsec;
    }

    public CipherVo setThintRemainingMsec(Long thintRemainingMsec) {
        this.thintRemainingMsec = thintRemainingMsec;
        return this;
    }


}
