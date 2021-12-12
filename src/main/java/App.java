
import java.io.BufferedInputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

public class App 
{
    public static void main( String[] args )
    {
    	String status="";
    	int totalResults=0;
    	String title="";
    	
    	News news = new News(status, totalResults, title);
    	
    	String apiKey = "996b219d54484e368dfbeb6aaeb53d16";
		String newsApiEndPoint = "https://newsapi.org/v2/everything?q=tesla&from=2021-10-20&sortBy=publishedAt&apiKey="+apiKey;
		
		
		try {
//		1. Create URL
			URL url = new URL(newsApiEndPoint);
			
//		2. Create URL Connection
			URLConnection connection = url.openConnection(); // Hit the End Point
			
//		3. Read JSON Data into Bytes
			InputStream stream = connection.getInputStream();
			BufferedInputStream buffer = new BufferedInputStream(stream);
			
//		3. Convert Bytes into String
			byte[] bytes = buffer.readAllBytes(); // read all bytes together in bytes variable
			String response = new String(bytes); 
			
			
			// The String response is a Structured Response. Here it is JSON.
				System.out.println(response);
			// We need to represent String as JSON
			// For that we need  JSON .jar file
			
			JSONObject object = new JSONObject(response);
			
			System.out.println(object.getString("status"));
			status = object.getString("status");
			
			System.out.println(object.getInt("totalResults"));
			totalResults = object.getInt("totalResults");
			
			JSONArray array = object.getJSONArray("articles");
			
			for(int i =0; i<array.length(); i++) {
				JSONObject obj = array.getJSONObject(i);
				
				System.out.println(obj.getString("title"));
				title = obj.getString("title");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
    }
}
