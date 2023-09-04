package Core;

import org.openqa.selenium.WebDriver;

abstract public class BasicSelenumPage {

    protected static WebDriver driver;

    public static void setWebDriver(WebDriver webDriver){
        driver=webDriver;
    }

}
