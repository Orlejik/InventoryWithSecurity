package com.fuji.inventory.fujiInv.models;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "inventory_of_assets")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder(toBuilder = true)
@EntityListeners(AuditingEntityListener.class)
public class InvItem {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "plant")
    private String plant;
    @Column(name = "fae_number")
    private String faenumber;
    @Column(name = "sis_number")
    private String sisnumber;
    @Column(name = "item_name")
    private String itemname;
    @Column(name = "item_brand")
    private String itembrand;
    @Column(name = "item_model")
    private String itemmodel;
    @Column(name = "serial_number")
    private String serialnumber;
    @Column(name = "location")
    private String location;
    @Column(name = "hostname")
    private String hostname;
    @Column(name = "ip_address")
    private String ip_address;
    @Column(name = "isDamaged")
    private boolean isDamaged;
    @Column(name = "user_name")
    private String user_name;
    @Column(name="departmetn")
    private String department;
    @Column(name = "operator_namber")
    private String operator_number;

    @Column(name = "user_added")
    private String user_added_item;

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private ItemName itemName;

    @ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private List<Image> image;

    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private List<Logs> logs = new ArrayList<>();

   public void addLogToInvItem(Logs log){
       log.setItem(this);
       logs.add(log);
   }

    @PrePersist
    public void init(){
        if (ip_address==null){
            ip_address = "No IP Address";
        }
        if (hostname == null){
            hostname = "No HostNAme";
        }
    }

}
