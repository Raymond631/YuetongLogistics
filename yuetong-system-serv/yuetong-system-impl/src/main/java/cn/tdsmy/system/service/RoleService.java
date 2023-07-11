package cn.tdsmy.system.service;

import cn.tdsmy.system.beans.Role;
import cn.tdsmy.system.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService {
    @Autowired
    private RoleMapper roleMapper;

    public List<Role> getRoleList() {
        return roleMapper.selectRoleList();
    }

    public void insertRole(Role role) {
        roleMapper.insertRole(role);
    }

    public void deleteRole(int roleId) {
        roleMapper.deleteRole(roleId);
    }

    public void updateRole(Role role) {
        roleMapper.updateRole(role);
    }
}
