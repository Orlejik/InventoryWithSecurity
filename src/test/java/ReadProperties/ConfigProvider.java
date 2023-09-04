package ReadProperties;

import com.typesafe.config.Config;
import com.typesafe.config.ConfigFactory;

public interface ConfigProvider {

    Config config = readConfig();

    static Config readConfig(){
        return ConfigFactory.systemProperties().hasPath("TestProfile")
                ? ConfigFactory.load(ConfigFactory.systemProperties().getString("TestProfile"))
                : ConfigFactory.load("InventoryApp.conf");
    }

    String URL = readConfig().getString("url");
    Integer age = readConfig().getInt("age");

    String ADMIN_LOGIN = readConfig().getString("LoginUsersParams.admin.login");
    String ADMIN_PASS = readConfig().getString("LoginUsersParams.admin.password");
    Boolean IS_ADMIN_ADMIN = readConfig().getBoolean("LoginUsersParams.admin.isAdmin");

    String USER_LOGIN = readConfig().getString("LoginUsersParams.user.login");
    String USER_PASS = readConfig().getString("LoginUsersParams.user.password");
    Boolean IS_USER_ADMIN = readConfig().getBoolean("LoginUsersParams.user.isAdmin");
}
