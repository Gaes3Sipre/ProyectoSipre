/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author alejozepol
 */
@Embeddable
public class GnDetalleMenuPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "codMenu", nullable = false)
    private int codMenu;
    @Basic(optional = false)
    @NotNull
    @Column(name = "codPrograma", nullable = false)
    private int codPrograma;
    @Basic(optional = false)
    @NotNull
    @Column(name = "codRol", nullable = false)
    private int codRol;

    public GnDetalleMenuPK() {
    }

    public GnDetalleMenuPK(int codMenu, int codPrograma, int codRol) {
        this.codMenu = codMenu;
        this.codPrograma = codPrograma;
        this.codRol = codRol;
    }

    public int getCodMenu() {
        return codMenu;
    }

    public void setCodMenu(int codMenu) {
        this.codMenu = codMenu;
    }

    public int getCodPrograma() {
        return codPrograma;
    }

    public void setCodPrograma(int codPrograma) {
        this.codPrograma = codPrograma;
    }

    public int getCodRol() {
        return codRol;
    }

    public void setCodRol(int codRol) {
        this.codRol = codRol;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) codMenu;
        hash += (int) codPrograma;
        hash += (int) codRol;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnDetalleMenuPK)) {
            return false;
        }
        GnDetalleMenuPK other = (GnDetalleMenuPK) object;
        if (this.codMenu != other.codMenu) {
            return false;
        }
        if (this.codPrograma != other.codPrograma) {
            return false;
        }
        if (this.codRol != other.codRol) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnDetalleMenuPK[ codMenu=" + codMenu + ", codPrograma=" + codPrograma + ", codRol=" + codRol + " ]";
    }
    
}
