package Pages;

import Core.BasicSelenumPage;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class AddElementPage extends BasicSelenumPage {
    @FindBy(xpath = "//*[@id='plant']")
    private WebElement plantInput;
    @FindBy(xpath = "//*[@id='location']")
    private WebElement locationInput;
    @FindBy(xpath = "//*[@id='itemname']")
    private WebElement itemnameSelect;
    @FindBy(xpath = "//*[@id='itemname']/option[text()='Choose...']")
    private WebElement itemnameOption;

    @FindBy(xpath = "//*[@id='item_brand']")
    private WebElement itembrandSelect;
    @FindBy(xpath = "//*[@id='item_brand']/option[text()='Choose...']")
    private WebElement itembrandOption;

    @FindBy(xpath = "//*[@id='item_model']")
    private WebElement itemmodelSelect;
    @FindBy(xpath = "//*[@id='item_model']/option[text()='Choose...']")
    private WebElement itemmodelOption;

    @FindBy(xpath = "//*[@id='fae_number']")
    private WebElement faeNumberInput;
    @FindBy(xpath = "//*[@id='sis_number']")
    private WebElement sisNumberInput;
    @FindBy(xpath = "//*[@id='serial_number']")
    private WebElement serialNumberInput;

    @FindBy(xpath = "//*[@id='ip_address']")
    private WebElement ipAddressInput;
    @FindBy(xpath = "//*[@id='hostname']")
    private WebElement hostnameInput;
    @FindBy(xpath = "//*[@id='isDamaged']")
    private WebElement isDamagedSelect;
    @FindBy(xpath = "//*[@id='isDamaged']/option[text()='working']")
    private WebElement itemnameOption;

}
