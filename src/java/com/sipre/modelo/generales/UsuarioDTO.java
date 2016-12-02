/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sipre.modelo.generales;


import java.util.List;

/**
 *
 * @author
 */
public class UsuarioDTO {
    
    private String codUsuarios;
    private String clave;
    //private String codTercero; despues de crear la clase terceros se debe modificar a un arrayList
    private List<RolDTO> roles;

    public UsuarioDTO() {
     }

    public UsuarioDTO(String codUsuarios, String clave, List<RolDTO> roles) {
        this.codUsuarios = codUsuarios;
        this.clave = clave;
        this.roles = roles;
    }

    public String getCodUsuarios() {
        return codUsuarios;
    }

    public void setCodUsuarios(String codUsuarios) {
        this.codUsuarios = codUsuarios;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public List<RolDTO> getRoles() {
        return roles;
    }

    public void setRoles(List<RolDTO> roles) {
        this.roles = roles;
    }
    
    public void addRol(RolDTO r){
        this.roles.add(r);
    }
    
    public void removeRol(int idRol){
        for (int i = 0; i < roles.size(); i++) {
            if(roles.get(i).getCodRol()== idRol){
                roles.remove(i);
            }
        }
    }

   
    
}
