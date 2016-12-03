/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author alejozepol
 */
@Entity
@Table(name = "Gn_TipoBeneficiarios")
@NamedQueries({
    @NamedQuery(name = "GnTipoBeneficiario.findAll", query = "SELECT g FROM GnTipoBeneficiario g")
    , @NamedQuery(name = "GnTipoBeneficiario.findByCodTipoBeneficiario", query = "SELECT g FROM GnTipoBeneficiario g WHERE g.codTipoBeneficiario = :codTipoBeneficiario")
    , @NamedQuery(name = "GnTipoBeneficiario.findByNomTipoBeneficiario", query = "SELECT g FROM GnTipoBeneficiario g WHERE g.nomTipoBeneficiario = :nomTipoBeneficiario")})
public class GnTipoBeneficiario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codTipoBeneficiario", nullable = false)
    private Integer codTipoBeneficiario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "nomTipoBeneficiario", nullable = false, length = 15)
    private String nomTipoBeneficiario;

    public GnTipoBeneficiario() {
    }

    public GnTipoBeneficiario(Integer codTipoBeneficiario) {
        this.codTipoBeneficiario = codTipoBeneficiario;
    }

    public GnTipoBeneficiario(Integer codTipoBeneficiario, String nomTipoBeneficiario) {
        this.codTipoBeneficiario = codTipoBeneficiario;
        this.nomTipoBeneficiario = nomTipoBeneficiario;
    }

    public Integer getCodTipoBeneficiario() {
        return codTipoBeneficiario;
    }

    public void setCodTipoBeneficiario(Integer codTipoBeneficiario) {
        this.codTipoBeneficiario = codTipoBeneficiario;
    }

    public String getNomTipoBeneficiario() {
        return nomTipoBeneficiario;
    }

    public void setNomTipoBeneficiario(String nomTipoBeneficiario) {
        this.nomTipoBeneficiario = nomTipoBeneficiario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codTipoBeneficiario != null ? codTipoBeneficiario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnTipoBeneficiario)) {
            return false;
        }
        GnTipoBeneficiario other = (GnTipoBeneficiario) object;
        if ((this.codTipoBeneficiario == null && other.codTipoBeneficiario != null) || (this.codTipoBeneficiario != null && !this.codTipoBeneficiario.equals(other.codTipoBeneficiario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnTipoBeneficiario[ codTipoBeneficiario=" + codTipoBeneficiario + " ]";
    }
    
}
