package com.fuji.inventory.fujiInv.repositories;//package com.fuji.inventory.fujiInv.repositories;
//
//import com.fuji.inventory.fujiInv.models.Role;
//import com.fuji.inventory.fujiInv.models.User;
//import org.springframework.data.jpa.repository.JpaRepository;
//
//import java.util.List;
//
//
//public interface RoleRespository extends JpaRepository<Role, Long> {
//    default List<Role> findAllByRole_name(String role_name) {
//        return null;
//    }
//
//    default List<Role> findAllByRole_id(Long role_id) {
//        return null;
//    }
//}
