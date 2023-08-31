package com.fuji.inventory.fujiInv;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class FujiInvApplication {

	public static void main(String[] args) {
		SpringApplication.run(FujiInvApplication.class, args);
	}

}
