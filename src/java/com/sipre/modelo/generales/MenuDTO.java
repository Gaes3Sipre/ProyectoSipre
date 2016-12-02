/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sipre.modelo.generales;

/**
 *
 * @author alejozepol
 */
public class MenuDTO {
    private int codMenu;
    private String nomMenu;
    
public MenuDTO() {

}

    public MenuDTO(int codMenu, String nomMenu) {
        this.codMenu = codMenu;
        this.nomMenu = nomMenu;
    }

    public int getCodMenu() {
        return codMenu;
    }

    public void setCodMenu(int codMenu) {
        this.codMenu = codMenu;
    }

    public String getNomMenu() {
        return nomMenu;
    }

    public void setNomMenu(String nomMenu) {
        this.nomMenu = nomMenu;
    }
    
    
}

