<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>

<h1>Источники новостей:</h1>
<br>
<!-- Button trigger modal -->
<button class="btn btn-primary btn-lg  navbar-right" data-toggle="modal" data-target="#myModal">
    Добавить источник данных
</button>


<form:form commandName="site" cssClass="form-horizontal siteForm">
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">New news source</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Name:</label>
                        <div class="col-sm-10">
                            <form:input path="name" cssClass="form-control" />
                            <form:errors path="name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="url" class="col-sm-2 control-label">URL:</label>
                        <div class="col-sm-10">
                            <form:input path="url" cssClass="form-control" />
                            <form:errors path="url" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Parse Rule:</label>
                        <div class="col-sm-10">
                            <form:textarea path="parseRule" cols="40" rows="5" cssClass="form-control" />
                            <form:errors path="parseRule" />
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary" value="Save" />
                </div>
            </div>
        </div>
    </div>
</form:form>

<br /><br />

<script type="text/javascript">
    $(document).ready(function() {
        $('.nav-tabs a:first').tab('show'); // Select first tab
        $(".triggerRemove").click(function(e) {
            e.preventDefault();
            $("#modalRemove .removeBtn").attr("href", $(this).attr("href"));
            $("#modalRemove").modal();
        });
        $(".blogForm").validate(
            {
                rules: {
                    name: {
                        required : true,
                        minlength : 1
                    },
                    url: {
                        required : true,
                        url: true
                    }
                },
                highlight: function(element) {
                    $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                },
                unhighlight: function(element) {
                    $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                }
            }
        );
    });
</script>


<br><br>

<table class="table table-bordered table-hover table-striped">
    <thead>
    <tr>
        <th>News Site</th>
        <th>Parse Rule</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${sites}" var="item">
        <tr>
            <td>
                <strong>
                    <a href="<c:out value="${item.url}" />" target="_blank">
                        <c:out value="${item.name}" />
                    </a>
                </strong>
                <br>
                <c:out value="${item.url}"/>
            </td>
            <td>
                <c:if test="${item.parseRule.type != ''}">
                    type=<c:out value="${item.parseRule.type}" /><br>
                </c:if>
                <c:if test="${item.parseRule.contentType != ''}">
                    content-type=<c:out value="${item.parseRule.contentType}" /><br>
                </c:if>
                <c:if test="${item.parseRule.feedTag != ''}">
                    feed-tag=<c:out value="${item.parseRule.feedTag}" /><br>
                </c:if>
                <c:if test="${item.parseRule.feedClass != ''}">
                    feed-class=<c:out value="${item.parseRule.feedClass}" /><br>
                </c:if>
                <c:if test="${item.parseRule.channelTag != ''}">
                    feed-class=<c:out value="${item.parseRule.channelTag}" /><br>
                </c:if>
                <c:if test="${item.parseRule.channelClassName != ''}">
                    feed-class=<c:out value="${item.parseRule.channelClassName}" /><br>
                </c:if>
                <c:if test="${item.parseRule.itemTag != ''}">
                    feed-class=<c:out value="${item.parseRule.itemTag}" /><br>
                </c:if>
                <c:if test="${item.parseRule.itemClass != ''}">
                    feed-class=<c:out value="${item.parseRule.itemClass}" /><br>
                </c:if>
                <c:if test="${item.parseRule.titleTag != ''}">
                    feed-class=<c:out value="${item.parseRule.titleTag}" /><br>
                </c:if>
                <c:if test="${item.parseRule.titleClass != ''}">
                    feed-class=<c:out value="${item.parseRule.titleClass}" /><br>
                </c:if>
                <c:if test="${item.parseRule.descriptionTag != ''}">
                    feed-class=<c:out value="${item.parseRule.descriptionTag}" /><br>
                </c:if>
                <c:if test="${item.parseRule.descriptionClass != ''}">
                    feed-class=<c:out value="${item.parseRule.descriptionClass}" /><br>
                </c:if>
                <c:if test="${item.parseRule.publishedDateTag != ''}">
                    feed-class=<c:out value="${item.parseRule.publishedDateTag}" /><br>
                </c:if>
                <c:if test="${item.parseRule.publishedDateClass != ''}">
                    feed-class=<c:out value="${item.parseRule.publishedDateClass}" /><br>
                </c:if>
                <c:if test="${item.parseRule.linkTag != ''}">
                    feed-class=<c:out value="${item.parseRule.linkTag}" /><br>
                </c:if>
                <c:if test="${item.parseRule.linkClass != ''}">
                    feed-class=<c:out value="${item.parseRule.linkClass}" />
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
