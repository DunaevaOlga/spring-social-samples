<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/spring-social/facebook/tags" prefix="facebook" %>
<%@ page session="false" %>

<c:url value="/signin/authenticate" var="signinUrl" />

<sf:form id="signin" action="${signinUrl}" method="post">
	<div class="formInfo">
  		<c:if test="${param.error eq 'bad_credentials'}">
  		<div class="error">
  			Your sign in information was incorrect.
  			Please try again or <a href="<c:url value="/signup" />">sign up</a>.
  		</div>
 	 	</c:if>
  		<c:if test="${param.error eq 'multiple_users'}">
  		<div class="error">
  			Multiple local accounts are connected to the provider account.
  			Try again with a different provider or with your username and password.
  		</div>
 	 	</c:if>
	</div>
	<fieldset>
		<label for="login">Username</label>
		<input id="login" name="username" type="text" size="25" <c:if test="${not empty signinErrorMessage}">value="${SPRING_SECURITY_LAST_USERNAME}"</c:if> />
		<label for="password">Password</label>
		<input id="password" name="password" type="password" size="25" />	
	</fieldset>
	<button type="submit">Sign In</button>
	
	<p>Some test user/password pairs you may use are:</p>
	<ul>
		<li>habuma/freebirds</li>
		<li>rclarkson/atlanta</li>
	</ul>
	
	<p>Or you can <a href="<c:url value="/signup"/>">signup</a> with a new account.</p>
</sf:form>
	<!-- FACEBOOK SIGNIN -->
	<form name="fb_signin" id="fb_signin" action="<c:url value="/signin/facebook"/>" method="POST">
	    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        <input type="hidden" name="scope" value="publish_stream,user_photos,offline_access" />
		<button type="submit"><img src="<c:url value="/resources/social/facebook/sign-in-with-facebook.png"/>" /></button>
	</form>

    <!-- VKONTAKTE SIGNIN -->
    <form name="vk_signin" id="vk_signin" action="<c:url value="/signin/vkontakte"/>" method="POST">
        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        <input type="hidden" name="scope" value="notify,friends,photos,audio,video,notes,pages,offline" />
        <button type="submit"><img src="<c:url value="/resources/social/vkontakte/connect_short.png" />"/></button>
    </form>
