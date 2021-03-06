package edu.fau.aclerizier.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@SuppressWarnings("deprecation")
@Service
public class GoogleAPIService {

	private static final Logger LOGGER = LoggerFactory.getLogger(GoogleAPIService.class);

	// HTTP GET request
	@SuppressWarnings("resource")
	public String getAPIResults(String url) {

		LOGGER.debug("Sending Get Request to {}", url);

		HttpClient client = null;
		HttpGet request = null;
		HttpResponse response = null;

		BufferedReader rd = null;
		StringBuffer result = null;
		String line = null;

		try {
			client = new DefaultHttpClient();
			request = new HttpGet(url);
			response = client.execute(request);

			rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
			result = new StringBuffer();
			line = "";
			while ((line = rd.readLine()) != null) {
				result.append(line);
			}
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
		}

		return result.toString();
	}

	// HTTP POST request
	// private void sendPost() throws Exception {
	//
	// String url = "https://selfsolve.apple.com/wcResults.do";
	//
	// HttpClient client = new DefaultHttpClient();
	// HttpPost post = new HttpPost(url);
	//
	// // add header
	// post.setHeader("User-Agent", USER_AGENT);
	//
	// List<NameValuePair> urlParameters = new ArrayList<NameValuePair>();
	// urlParameters.add(new BasicNameValuePair("sn", "C02G8416DRJM"));
	// urlParameters.add(new BasicNameValuePair("cn", ""));
	// urlParameters.add(new BasicNameValuePair("locale", ""));
	// urlParameters.add(new BasicNameValuePair("caller", ""));
	// urlParameters.add(new BasicNameValuePair("num", "12345"));
	//
	// post.setEntity(new UrlEncodedFormEntity(urlParameters));
	//
	// HttpResponse response = client.execute(post);
	// System.out.println("\nSending 'POST' request to URL : " + url);
	// System.out.println("Post parameters : " + post.getEntity());
	// System.out.println("Response Code : " +
	// response.getStatusLine().getStatusCode());
	//
	// BufferedReader rd = new BufferedReader(new
	// InputStreamReader(response.getEntity().getContent()));
	//
	// StringBuffer result = new StringBuffer();
	// String line = "";
	// while ((line = rd.readLine()) != null) {
	// result.append(line);
	// }
	//
	// System.out.println(result.toString());
	//
	// }

}
