/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author alejozepol
 */
@Entity
@Table(name = "Gn_Pais", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codPais"})})
@NamedQueries({
    @NamedQuery(name = "GnPais.findAll", query = "SELECT g FROM GnPais g")
    , @NamedQuery(name = "GnPais.findByCodPais", query = "SELECT g FROM GnPais g WHERE g.codPais = :codPais")
    , @NamedQuery(name = "GnPais.findByNomPais", query = "SELECT g FROM GnPais g WHERE g.nomPais = :nomPais")
    , @NamedQuery(name = "GnPais.findByUsuActividad", query = "SELECT g FROM GnPais g WHERE g.usuActividad = :usuActividad")
    , @NamedQuery(name = "GnPais.findByTipActividad", query = "SELECT g FROM GnPais g WHERE g.tipActividad = :tipActividad")
    , @NamedQuery(name = "GnPais.findByHorActividad", query = "SELECT g FROM GnPais g WHERE g.horActividad = :horActividad")})
public class GnPais implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codPais", nullable = false)
    private Integer codPais;
    @Size(max = 30)
    @Column(name = "nomPais", length = 30)
    private String nomPais;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "usuActividad", nullable = false, length = 15)
    private String usuActividad;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "tipActividad", nullable = false, length = 1)
    private String tipActividad;
    @Basic(optional = false)
    @NotNull
    @Column(name = "horActividad", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date horActividad;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codPais")
    private List<GnDepartamento> gnDepartamentoList;

    public GnPais() {
    }

    public GnPais(Integer codPais) {
        this.codPais = codPais;
    }

    public GnPais(Integer codPais, String usuActividad, String tipActividad, Date horActividad) {
        this.codPais = codPais;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public Integer getCodPais() {
        return codPais;
    }

    public void setCodPais(Integer codPais) {
        this.codPais = codPais;
    }

    public String getNomPais() {
        return nomPais;
    }

    public void setNomPais(String nomPais) {
        this.nomPais = nomPais;
    }

    public String getUsuActividad() {
        return usuActividad;
    }

    public void setUsuActividad(String usuActividad) {
        this.usuActividad = usuActividad;
    }

    public String getTipActividad() {
        return tipActividad;
    }

    public void setTipActividad(String tipActividad) {
        this.tipActividad = tipActividad;
    }

    public Date getHorActividad() {
        return horActividad;
    }

    public void setHorActividad(Date horActividad) {
        this.horActividad = horActividad;
    }

    public List<GnDepartamento> getGnDepartamentoList() {
        return gnDepartamentoList;
    }

    public void setGnDepartamentoList(List<GnDepartamento> gnDepartamentoList) {
        this.gnDepartamentoList = gnDepartamentoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codPais != null ? codPais.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnPais)) {
            return false;
        }
        GnPais other = (GnPais) object;
        if ((this.codPais == null && other.codPais != null) || (this.codPais != null && !this.codPais.equals(other.codPais))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnPais[ codPais=" + codPais + " ]";
    }
    
}
