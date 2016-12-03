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
import javax.validation.constraints.Size;

/**
 *
 * @author alejozepol
 */
@Embeddable
public class BeTipobeneficioPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "codServicio", nullable = false)
    private int codServicio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "codProveedor", nullable = false)
    private int codProveedor;
    @Basic(optional = false)
    @NotNull
    @Column(name = "codTipoServicio", nullable = false)
    private int codTipoServicio;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "tipContrato", nullable = false, length = 1)
    private String tipContrato;

    public BeTipobeneficioPK() {
    }

    public BeTipobeneficioPK(int codServicio, int codProveedor, int codTipoServicio, String tipContrato) {
        this.codServicio = codServicio;
        this.codProveedor = codProveedor;
        this.codTipoServicio = codTipoServicio;
        this.tipContrato = tipContrato;
    }

    public int getCodServicio() {
        return codServicio;
    }

    public void setCodServicio(int codServicio) {
        this.codServicio = codServicio;
    }

    public int getCodProveedor() {
        return codProveedor;
    }

    public void setCodProveedor(int codProveedor) {
        this.codProveedor = codProveedor;
    }

    public int getCodTipoServicio() {
        return codTipoServicio;
    }

    public void setCodTipoServicio(int codTipoServicio) {
        this.codTipoServicio = codTipoServicio;
    }

    public String getTipContrato() {
        return tipContrato;
    }

    public void setTipContrato(String tipContrato) {
        this.tipContrato = tipContrato;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) codServicio;
        hash += (int) codProveedor;
        hash += (int) codTipoServicio;
        hash += (tipContrato != null ? tipContrato.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BeTipobeneficioPK)) {
            return false;
        }
        BeTipobeneficioPK other = (BeTipobeneficioPK) object;
        if (this.codServicio != other.codServicio) {
            return false;
        }
        if (this.codProveedor != other.codProveedor) {
            return false;
        }
        if (this.codTipoServicio != other.codTipoServicio) {
            return false;
        }
        if ((this.tipContrato == null && other.tipContrato != null) || (this.tipContrato != null && !this.tipContrato.equals(other.tipContrato))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.BeTipobeneficioPK[ codServicio=" + codServicio + ", codProveedor=" + codProveedor + ", codTipoServicio=" + codTipoServicio + ", tipContrato=" + tipContrato + " ]";
    }
    
}
