package cn.tdsmy.system.mapper;

import cn.tdsmy.system.beans.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RoleMapper {

    List<Role> selectRoleList();

    void insertRole(Role role);

    void deleteRole(@Param("roleId") int roleId);

    void updateRole(Role role);
}
