/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sipre.modelo.generales;



/**
 *
 * @author
 */
public class RolDTO {
    private int codRol;
    private String nomRol;
    private String tipRol;
    

    public RolDTO() {
    }

    public RolDTO(int codRol, String nomRol, String tipRol) {
        this.codRol = codRol;
        this.nomRol = nomRol;
        this.tipRol = tipRol;
    }

    public int getCodRol() {
        return codRol;
    }

    public void setCodRol(int codRol) {
        this.codRol = codRol;
    }

    public String getNomRol() {
        return nomRol;
    }

    public void setNomRol(String nomRol) {
        this.nomRol = nomRol;
    }

    public String getTipRol() {
        return tipRol;
    }

    public void setTipRol(String tipRol) {
        this.tipRol = tipRol;
    }

   
    
    

    
    

    
}
