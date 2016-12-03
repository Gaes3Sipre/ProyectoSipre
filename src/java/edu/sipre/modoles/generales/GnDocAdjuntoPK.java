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
public class GnDocAdjuntoPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "codTercero", nullable = false)
    private int codTercero;
    @Basic(optional = false)
    @NotNull
    @Column(name = "codDocumento", nullable = false)
    private int codDocumento;

    public GnDocAdjuntoPK() {
    }

    public GnDocAdjuntoPK(int codTercero, int codDocumento) {
        this.codTercero = codTercero;
        this.codDocumento = codDocumento;
    }

    public int getCodTercero() {
        return codTercero;
    }

    public void setCodTercero(int codTercero) {
        this.codTercero = codTercero;
    }

    public int getCodDocumento() {
        return codDocumento;
    }

    public void setCodDocumento(int codDocumento) {
        this.codDocumento = codDocumento;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) codTercero;
        hash += (int) codDocumento;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnDocAdjuntoPK)) {
            return false;
        }
        GnDocAdjuntoPK other = (GnDocAdjuntoPK) object;
        if (this.codTercero != other.codTercero) {
            return false;
        }
        if (this.codDocumento != other.codDocumento) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnDocAdjuntoPK[ codTercero=" + codTercero + ", codDocumento=" + codDocumento + " ]";
    }
    
}
