package cn.com.qytx.webservice.impl;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Logger;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;

/**
 * This class was generated by the JAX-WS RI. JAX-WS RI 2.1.3-hudson-390-
 * Generated source version: 2.0
 * <p>
 * An example of how this class may be used:
 * 
 * <pre>
 * CardServiceService service = new CardServiceService();
 * CardService portType = service.getCardService();
 * portType.getCard(...);
 * </pre>
 * 
 * </p>
 * 
 */
@WebServiceClient(name = "CardServiceService", targetNamespace = "http://server.wei.com", wsdlLocation = "http://10.120.40.60:7001/hnCardService/services/CardService?wsdl")
public class CardServiceService extends Service {

	private final static URL CARDSERVICESERVICE_WSDL_LOCATION;
	private final static Logger logger = Logger
			.getLogger(cn.com.qytx.webservice.impl.CardServiceService.class
					.getName());

	static {
		URL url = null;
		try {
			URL baseUrl;
			baseUrl = cn.com.qytx.webservice.impl.CardServiceService.class
					.getResource(".");
			url = new URL(baseUrl,
					"http://10.120.1.18:7001/hnCardService/services/CardService?wsdl");
		} catch (MalformedURLException e) {
			logger.warning("Failed to create URL for the wsdl Location: 'http://10.120.1.18:7001/hnCardService/services/CardService?wsdl', retrying as a local file");
			logger.warning(e.getMessage());
		}
		CARDSERVICESERVICE_WSDL_LOCATION = url;
	}

	public CardServiceService(URL wsdlLocation, QName serviceName) {
		super(wsdlLocation, serviceName);
	}

	public CardServiceService() {
		super(CARDSERVICESERVICE_WSDL_LOCATION, new QName(
				"http://server.wei.com", "CardServiceService"));
	}

	/**
	 * 
	 * @return returns CardService
	 */
	@WebEndpoint(name = "CardService")
	public CardService getCardService() {
		return super.getPort(new QName("http://server.wei.com", "CardService"),
				CardService.class);
	}

}
