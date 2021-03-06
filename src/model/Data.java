package model;

/**
 * 原始数据，用于数据分析
 */
public class Data {

    private String uid;
    private String cid;
    private String registered;
    private String viewed;
    private String explored;
    private String certified;
    private String location;
    private String level;
    private String age;
    private String gender;
    private String grade;
    private String startTime;
    private String lastEventTime;
    private double nevents;
    private double ndays;
    private double nplayVideos;
    private double nchapters;
    private double nforumPosts;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getRegistered() {
        return registered;
    }

    public void setRegistered(String registered) {
        if (registered.equals("1")) {
            this.registered = "yes";
        } else {
            this.registered = "no";
        }
    }

    public String getViewed() {
        return viewed;
    }

    public void setViewed(String viewed) {
        if (viewed.equals("1")) {
            this.viewed = "yes";
        } else {
            this.viewed = "no";
        }
    }

    public String getExplored() {
        return explored;
    }

    public void setExplored(String explored) {
        if (explored.equals("1")) {
            this.explored = "yes";
        } else {
            this.explored = "no";
        }
    }

    public String getCertified() {
        return certified;
    }

    public void setCertified(String certified) {
        if (certified.equals("1")) {
            this.certified = "yes";
        } else {
            this.certified = "no";
        }
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        switch (level) {
            case "Less than Secondary":
                this.level = "Less than Secondary";
                break;
            case "Secondary":
                this.level = "Secondary";
                break;
            case "Bachelor's":
                this.level = "Bachelor";
                break;
            case "Master's":
                this.level = "Master";
                break;
            case "Doctorate":
                this.level = "Doctorate";
                break;
            case "NA":
            case "null":
                this.level = "empty";
                break;
            default:
                this.level = "其他学历";
        }
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        if (age.equals("null") || age.equals("NA")) {
            this.age = "empty";
        } else {
            this.age = String.valueOf(2018 - Integer.parseInt(age));
        }
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        switch (gender) {
            case "null":
            case "NA":
            case "o":
                this.gender = "empty";
                break;
            case "f":
                this.gender = "female";
                break;
            case "m":
                this.gender = "male";
                break;
        }
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getLastEventTime() {
        return lastEventTime;
    }

    public void setLastEventTime(String lastEventTime) {
        this.lastEventTime = lastEventTime;
    }

    public double getNevents() {
        return nevents;
    }

    public void setNevents(String nevents) {
        this.nevents = fillEmpty(nevents);
    }

    public double getNdays() {
        return ndays;
    }

    public void setNdays(String ndays) {
        this.ndays = fillEmpty(ndays);
    }

    public double getNplayVideos() {
        return nplayVideos;
    }

    public void setNplayVideos(String nplayVideos) {
        this.nplayVideos = fillEmpty(nplayVideos);

    }

    public double getNchapters() {
        return nchapters;
    }

    public void setNchapters(String nchapters) {
        this.nchapters = fillEmpty(nchapters);
    }

    public double getNforumPosts() {
        return nforumPosts;
    }

    public void setNforumPosts(String nforumPosts) {
        this.nforumPosts = fillEmpty(nforumPosts);
    }


    private double fillEmpty(String v) {
        if (v.equals("null")) {
            v = "0";
        }
        return Double.parseDouble(v);
    }

}
