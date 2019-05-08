import com.webratio.rtx.RTXConstants
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession

HttpServletRequest request = localContext.get(RTXConstants.HTTP_SERVLET_REQUEST_KEY)
return request.getSession().getId()