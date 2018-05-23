package controller;

import service.StudentService;
import service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
/**
 * 业务Controller层，四个模块在这里进行处理
 */

/**
 * Created by HP on 2018/5/15.
 */
@Controller
@RequestMapping("/controller/")
public class WorkController {
    /***********************王思卓代码模块********************************************/
    //教师获得课程列表(页面1）
    @RequestMapping(value = "getCourseList.do/{uid}",method = RequestMethod.POST)
    @ResponseBody
    public Object getCourseList(@PathVariable("uid") String uid, HttpSession session) throws SQLException {
        TeacherService teacherService = new TeacherService(uid);
        return teacherService.getCourseList();
    }

    //教师查看某一门课程的交互情况(页面2)
    // 图1（四合一图）
    @RequestMapping(value = "getOneCourseChart.do/{uid}/{cid}",method = RequestMethod.POST)
    @ResponseBody
    public Object getOneCourseInteraction(@PathVariable("uid") String uid,
                                          @PathVariable String cid, HttpSession session) throws SQLException {
        TeacherService teacherService = new TeacherService(uid);
        return teacherService.getInteractionAndGrade(cid);
    }

    //教师查看所有学生的地区分布(页面2)
    //图2
    @RequestMapping(value = "getAllCourseChart.do/{uid}/{cid}",method = RequestMethod.POST)
    @ResponseBody
    public Object getLocation(@PathVariable("uid") String uid, @PathVariable String cid, HttpSession session) throws SQLException {
        TeacherService teacherService = new TeacherService(uid);
        return teacherService.getLocation(cid);
    }

    //教师查看某一课程各个属性人数和获得证书人数的关系(页面2)
    // 属性：学历、年龄、性别
    //图3,4,5
    @RequestMapping(value = "getStudentList.do/{uid}/{cid}",method = RequestMethod.POST)
    @ResponseBody
    public Object getAttrAndCertified(@PathVariable("uid") String uid,
                                      @PathVariable String cid, HttpSession session) throws SQLException {
        TeacherService teacherService = new TeacherService(uid);
        Map<String,Map<String,ArrayList<Object>>> map = new HashMap<>();
        map.put("gender",teacherService.attributeWithCertified(cid,"gender"));
        map.put("age",teacherService.attributeWithCertified(cid,"age"));
        map.put("level",teacherService.attributeWithCertified(cid,"level"));
        return map;
    }

    //教师查询某一课程交互情况的统计图(页面2)
    //交互：总次数，观看视频数，学习章节数，论坛发帖数
    //图6,7,8,9
    @RequestMapping(value = "getAllCourseChart.do/{uid}/{cid}/{kind}",method = RequestMethod.POST)
    @ResponseBody
    public Object getTeacherAllInteractionChart(@PathVariable String uid,@PathVariable String cid, @PathVariable String kind,
                                                HttpSession session) throws SQLException {
        TeacherService teacherService = new TeacherService(uid);
        return teacherService.getInteractionWithNumber(kind,cid);
    }

    //获得某一门课程的选课学生列表(页面3)
    @RequestMapping(value = "getStudentList.do/{uid}/{cid}/{pageNo}/{pageSize}",method = RequestMethod.POST)
    @ResponseBody
    public Object getStudentList(@PathVariable("uid") String uid,
                                 @PathVariable String cid, @PathVariable int pageNo, @PathVariable int pageSize, HttpSession session) throws SQLException {
        TeacherService teacherService = new TeacherService(uid);
        return teacherService.getStudentList(cid, pageNo, pageSize);
    }

    //预测(页面4)
    //教师学生通用
    @RequestMapping(value = "prediction.do/{uid}/{cid}/{path}",method = RequestMethod.POST)
    @ResponseBody
    public void prediction(@PathVariable("tid") String tid, @PathVariable String cid,
                           @PathVariable String path, HttpSession session) throws SQLException {
        TeacherService teacherService = new TeacherService(tid);
        teacherService.importPredictionData(path,cid);
    }

    //学生获得选课列表(页面5)
    @RequestMapping(value = "getMyCourseList.do/{uid}/{pageNo}/{pageSize}",method = RequestMethod.POST)
    @ResponseBody
    public Object getMyCourseList(@PathVariable String uid, @PathVariable int pageNo, @PathVariable int pageSize, HttpSession session) throws SQLException {
        StudentService s = new StudentService(uid);
        return s.getAllCourseInfo(pageNo,pageSize);
    }

}
