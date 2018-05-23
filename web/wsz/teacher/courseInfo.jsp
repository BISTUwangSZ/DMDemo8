<%@ page import="algorithm.Prediction" %>
<%@ page import="net.sf.json.JSONArray" %><%--
  Created by IntelliJ IDEA.
  User: drpeng
  Date: 2018/5/17
  Time: 下午3:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="head.jsp"></jsp:include>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script src="/js/echarts.js"></script>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<%String cid = request.getParameter("cid");%>
<script>
    var cid='<%=cid%>';
</script>

<body>
<div id="tab" style="width: 900px; float: left">
<ul id="myTab" class="nav nav-tabs">
    <li class="active"><a href="#home" data-toggle="tab">学生列表</a></li>
    <li><a href="#ios" data-toggle="tab">图表分析</a></li>
    <li><a href="#prediction" data-toggle="tab">预测</a></li>
</ul>
</div>

<div id="myTabContent" class="tab-content" style="width: 900px; float: left">
    <!--列表-->
    <div class="tab-pane fade in active" id="home" style="width: 900px">

    </div>

    <!--图表-->
    <div class="tab-pane fade" id="ios" style="width: 900px">
        以下显示图
        <div id='course1Interaction' style='width:900px;height:400px'></div>
    </div>

    <!--预测-->
    <div class="tab-pane fade" id="prediction" style="width: 900px">
            <input type="text" id="path" placeholder="输入文件地址"/>
            <br/><br/>
            <input type="submit" value="预测" onclick="prediction(document.getElementById('path').innerText)"/>
    </div>
</div>

<!--获取列表-->
<script type="text/javascript">
    $(function(){
        $.getJSON("../../json/HarvardX_PH207x_2012_Fall_studentList.json",function(data){
            var $jsontip = $("#home");
            var strHtml = "";//存储数据的变量
            $jsontip.empty();//清空内容
            strHtml += "<table class=\"table table-hover\">";
            strHtml += "<thead>" +
                "<tr>" +
                "<th>序号</th>" +
                "<th>学号</th>" +
                "<th>成绩</th>" +
                "<th>是否获得证书</th>" +
                "<th>详情</th>" +
                "</tr>" +
                "</thead>"
            $jsontip.html(strHtml);//显示处理后的数据
            $.each(data,function(infoIndex,info){
                strHtml += "<tr><td>"+(infoIndex+1)+"</td>";
                strHtml += "<td id='uid'>"+info["学号"]+"</td>";
                strHtml += "<td>"+info["成绩"]+"</td>";
                strHtml += "<td>"+info["取得证书"]+"</td>";
                strHtml += "<td><button class='btn btn-info btn-sm' data-toggle='modal' data-target='#myModal' " +
                    ">详情</button></td></tr>";
            })
            $jsontip.html(strHtml);
        })
    });
</script>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    详细信息
                </h4>
            </div>
            <div class="modal-body">

                <div id="mycContent"></div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!--模态框数据-->
<script type="text/javascript">
    $(function () {
        $.getJSON("../../json/HarvardX_PH207x_2012_Fall_studentList.json",function (data) {
            var $json = $("#mycContent");
            var strHtml = "";//存储数据的变量
            // var uid = document.getElementById('uid').value;
            // strHtml += uid;
            $json.empty();//清空内容
            strHtml += "这里展示学生的个人信息";
            $.each(data,function(infoIndex,info){
                // strHtml += "姓名:"+info["学号"];
                // strHtml += "地区:"+info["地区"];
                // strHtml += "学历"+info["学历"];
                // strHtml += "年龄"+info["年龄"];
                // strHtml += "性别"+info["性别"];
                // strHtml += "注册时间"+info["注册时间"];
                // strHtml += "最后登录时间"+info["最后登录时间"];
                // strHtml += "交互次数"+info["交互次数"];
                // strHtml += "交互天数"+info["交互天数"];
                // strHtml += "播放视频数"+info["播放视频数"];
                // strHtml += "观看章节数"+info["观看章节数"];
                // strHtml += "论坛发帖数"+info["论坛发帖数"];
                // strHtml += "取得证书"+info["取得证书"];
            })
            $json.html(strHtml);
        })
    })
</script>

<!--点击详情显示模态框-->
<script>
    $(function(){
        // dom加载完毕
        var $m_btn = $('#btn-sm');
        var $modal = $('#myModal');
        $m_btn.on('click', function(){
            alert("dsagg");
            $modal.modal({backdrop: 'static'});
        });
        // 测试 bootstrap 居中
        $modal.on('show.bs.modal', function(){
            var $this = $(this);
            var $modal_dialog = $this.find('.modal-dialog');
            // 关键代码，如没将modal设置为 block，则$modala_dialog.height() 为零
            $this.css('display', 'block');
            $modal_dialog.css({'margin-top': Math.max(0, ($(window).height() - $modal_dialog.height()) / 3) });
        });
    });
</script>

<!--预测-->
<script type="text/javascript">
    function prediction(path) {
        alert("dkffd");
    }
</script>

<!--每一门课程交互情况和成绩的比较-->
<script type="text/javascript">
    var course1Interaction = echarts.init(document.getElementById("course1Interaction"));

    <%--var interactionJson = <%=interaction%>;--%>
    // alert(interactionJson);
    $.get('../../json/HarvardX_PH207x_2012_Fall_gradeWithInteraction.json', function (data) {
        var sizeValue = '57%';
        var symbolSize = 3;
        option = {
            legend: {},
            tooltip: {},
            toolbox: {
                left: 'center',
                feature: {
                    dataZoom: {}
                }
            },
            title:{
                text:'课程交互情况和成绩分布图'
            },
            grid: [
                {right: sizeValue, bottom: sizeValue},
                {left: sizeValue, bottom: sizeValue},
                {right: sizeValue, top: sizeValue},
                {left: sizeValue, top: sizeValue}
            ],
            xAxis: [
                {type: 'value', gridIndex: 0, name: 'nevents', axisLabel: {rotate: 50, interval: 0}},
                {type: 'value', gridIndex: 1, name: 'nplay_videos', boundaryGap: false, axisLabel: {rotate: 50, interval: 0}},
                {type: 'value', gridIndex: 2, name: 'nchapters', axisLabel: {rotate: 50, interval: 0}},
                {type: 'value', gridIndex: 3, name: 'nforum_posts', axisLabel: {rotate: 50, interval: 0}}
            ],
            yAxis: [
                {type: 'value', gridIndex: 0, name: 'grade'},
                {type: 'value', gridIndex: 1, name: 'grade'},
                {type: 'value', gridIndex: 2, name: 'grade'},
                {type: 'value', gridIndex: 3, name: 'grade'}
            ],
            dataset: {
                dimensions: [
                    'grade',
                    'nevents',
                    'nplay_videos',
                    'nchapters',
                    'nforum_posts'
                ],
                source: data
            },
            series: [
                {
                    type: 'scatter',
                    symbolSize: symbolSize,
                    xAxisIndex: 0,
                    yAxisIndex: 0,
                    encode: {
                        x: 'nevents',
                        y: 'grade',
                        tooltip: [0, 1, 2, 3, 4]
                    }
                },
                {
                    type: 'scatter',
                    symbolSize: symbolSize,
                    xAxisIndex: 1,
                    yAxisIndex: 1,
                    encode: {
                        x: 'nchapters',
                        y: 'grade',
                        tooltip: [0, 1, 2, 3, 4]
                    }
                },
                {
                    type: 'scatter',
                    symbolSize: symbolSize,
                    xAxisIndex: 2,
                    yAxisIndex: 2,
                    encode: {
                        x: 'nplay_videos',
                        y: 'grade',
                        tooltip: [0, 1, 2, 3, 4]
                    }
                },
                {
                    type: 'scatter',
                    symbolSize: symbolSize,
                    xAxisIndex: 3,
                    yAxisIndex: 3,
                    encode: {
                        x: 'nforum_posts',
                        y: 'grade',
                        tooltip: [0, 1, 2, 3, 4]
                    }
                }
            ]
        };
        course1Interaction.setOption(option);
    });
</script>

</body>
</html>
