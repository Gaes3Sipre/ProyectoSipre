/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author alejozepol
 */
@Entity
@Table(name = "Gn_TipoIdentificaciones")
@NamedQueries({
    @NamedQuery(name = "GnTipoIdentificacion.findAll", query = "SELECT g FROM GnTipoIdentificacion g")
    , @NamedQuery(name = "GnTipoIdentificacion.findByCodTipoIdentificacion", query = "SELECT g FROM GnTipoIdentificacion g WHERE g.codTipoIdentificacion = :codTipoIdentificacion")
    , @NamedQuery(name = "GnTipoIdentificacion.findByNomTipoIdentificacion", query = "SELECT g FROM GnTipoIdentificacion g WHERE g.nomTipoIdentificacion = :nomTipoIdentificacion")})
public class GnTipoIdentificacion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codTipoIdentificacion", nullable = false)
    private Integer codTipoIdentificacion;
    @Size(max = 20)
    @Column(name = "nomTipoIdentificacion", length = 20)
    private String nomTipoIdentificacion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipIdentificacion")
    private List<BiTercero> biTerceroList;

    public GnTipoIdentificacion() {
    }

    public GnTipoIdentificacion(Integer codTipoIdentificacion) {
        this.codTipoIdentificacion = codTipoIdentificacion;
    }

    public Integer getCodTipoIdentificacion() {
        return codTipoIdentificacion;
    }

    public void setCodTipoIdentificacion(Integer codTipoIdentificacion) {
        this.codTipoIdentificacion = codTipoIdentificacion;
    }

    public String getNomTipoIdentificacion() {
        return nomTipoIdentificacion;
    }

    public void setNomTipoIdentificacion(String nomTipoIdentificacion) {
        this.nomTipoIdentificacion = nomTipoIdentificacion;
    }

    public List<BiTercero> getBiTerceroList() {
        return biTerceroList;
    }

    public void setBiTerceroList(List<BiTercero> biTerceroList) {
        this.biTerceroList = biTerceroList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codTipoIdentificacion != null ? codTipoIdentificacion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnTipoIdentificacion)) {
            return false;
        }
        GnTipoIdentificacion other = (GnTipoIdentificacion) object;
        if ((this.codTipoIdentificacion == null && other.codTipoIdentificacion != null) || (this.codTipoIdentificacion != null && !this.codTipoIdentificacion.equals(other.codTipoIdentificacion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnTipoIdentificacion[ codTipoIdentificacion=" + codTipoIdentificacion + " ]";
    }
    
}
