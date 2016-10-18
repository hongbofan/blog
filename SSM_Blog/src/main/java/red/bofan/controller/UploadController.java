package red.bofan.controller;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by hongbofan on 2016/10/12.
 */
@Controller
@RequestMapping("/file")
public class UploadController extends BaseController{

    //设置好账号的ACCESS_KEY和SECRET_KEY
    String ACCESS_KEY = "wBLxj03nqg7pG745yV5Z5mQmIdYtudS84b9Wx8fq";
    String SECRET_KEY = "IgpyuuEuGP2gA3jCHBqOjeQ4D3pxqePzReOZnSQo";

    //要上传的空间
    String bucketname = "workdd";
    //上传到七牛后保存的文件名
    String key = "";
    //上传文件的路径
    String FilePath = "";
    //密钥配置
    Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
    //创建上传对象
    UploadManager uploadManager = new UploadManager();

    //简单上传，使用默认策略，只需要设置上传的空间名就可以了
    public String getUpToken(){
        return auth.uploadToken(bucketname);
    }
    public String upload() throws IOException{
        try {
            //调用put方法上传

            Response res = uploadManager.put(FilePath, key, getUpToken());
            String url = (String) res.jsonToMap().get("key");
            //打印返回的信息
            System.out.println(url);
            System.out.println(res.bodyString());
            return url;
        } catch (QiniuException e) {
            Response r = e.response;
            // 请求失败时打印的异常的信息
            System.out.println(r.toString());
            try {
                //响应的文本信息
                System.out.println(r.bodyString());
            } catch (QiniuException e1) {
                //ignore
            }
        }
        return  null;
    }
    @RequestMapping(value="/uploadFile.do",method= RequestMethod.POST)
    public void hello(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "editormd-image-file", required = false) MultipartFile attach){
        try {
            request.setCharacterEncoding( "utf-8" );
            response.setHeader( "Content-Type" , "text/html" );
            String rootPath = request.getSession().getServletContext().getRealPath("/FileUpload/temp/");

            /**
             * 文件路径不存在则需要创建文件路径
             */
            File filePath=new File(rootPath);
            if(!filePath.exists()){
                filePath.mkdirs();
            }

            //最终文件名
            File realFile=new File(rootPath+File.separator+attach.getOriginalFilename());
            FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);
            FilePath = realFile.getPath();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHMMss");
            key = attach.getOriginalFilename()+"-"+sdf.format(Calendar.getInstance().getTime());
            String url = upload();
            //下面response返回的json格式是editor.md所限制的，规范输出就OK
            //response.getWriter().write( "{\"success\": 1, \"message\":\"上传成功\",\"url\":\"/FileUpload/temp/" + attach.getOriginalFilename() + "\"}" );
            response.getWriter().write( "{\"success\": 1, \"message\":\"上传成功\",\"url\":\"http://78rewm.com1.z0.glb.clouddn.com/"+url+"\"}" );
        } catch (Exception e) {
            try {
                response.getWriter().write( "{\"success\":0}" );
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
}
