package Pages;

import Core.BasicSelenumPage;
import ReadProperties.ConfigProvider;
import org.junit.Assert;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class LoginPage extends BasicSelenumPage {
    @FindBy(xpath = "/html/body/div/form/div")
    private WebElement messageBox;
    @FindBy(xpath = "/html/body/div/form/p[1]/input")
    private WebElement usernameInput;
    @FindBy(xpath = "/html/body/div/form/p[2]/input")
    private WebElement userpassInput;
    @FindBy(xpath = "/html/body/div/form/button")
    private WebElement signinBtn;

    public LoginPage() {
        driver.get(ConfigProvider.URL);
        PageFactory.initElements(driver, this);
    }

    public AssetsListPage pageInv(String login, String password) {

        usernameInput.sendKeys(login);
        userpassInput.sendKeys(password, Keys.ENTER);

        if (messageBox.isDisplayed()) {
            System.out.println(messageBox.getText());
            if (messageBox.getText().equals("Bad credentials")) {
                Assert.fail();
            }
        }
        return new AssetsListPage();

    }

}
