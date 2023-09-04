package Pages;

import Core.BasicSelenumPage;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class AssetsListPage extends BasicSelenumPage {
    @FindBy(xpath = "/html/body/nav/div/div[1]/ul/li[2]/a")
    private WebElement addItemBtn;

    public AssetsListPage(){
        PageFactory.initElements(driver, this);
    }

    public AddElementPage addElementPage(){
        addItemBtn.click();
        return new AddElementPage();
    }

}
