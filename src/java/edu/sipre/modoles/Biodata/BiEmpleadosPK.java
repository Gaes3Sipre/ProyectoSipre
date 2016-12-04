/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.Biodata;

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
public class BiEmpleadosPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "codEmpleado", nullable = false)
    private int codEmpleado;
    @Basic(optional = false)
    @NotNull
    @Column(name = "numContrato", nullable = false)
    private int numContrato;

    public BiEmpleadosPK() {
    }

    public BiEmpleadosPK(int codEmpleado, int numContrato) {
        this.codEmpleado = codEmpleado;
        this.numContrato = numContrato;
    }

    public int getCodEmpleado() {
        return codEmpleado;
    }

    public void setCodEmpleado(int codEmpleado) {
        this.codEmpleado = codEmpleado;
    }

    public int getNumContrato() {
        return numContrato;
    }

    public void setNumContrato(int numContrato) {
        this.numContrato = numContrato;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) codEmpleado;
        hash += (int) numContrato;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BiEmpleadosPK)) {
            return false;
        }
        BiEmpleadosPK other = (BiEmpleadosPK) object;
        if (this.codEmpleado != other.codEmpleado) {
            return false;
        }
        if (this.numContrato != other.numContrato) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.BiEmpleadosPK[ codEmpleado=" + codEmpleado + ", numContrato=" + numContrato + " ]";
    }
    
}
