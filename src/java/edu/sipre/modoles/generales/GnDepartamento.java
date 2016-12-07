/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.generales;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "Gn_Departamentos", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codDepartamento"})})
@NamedQueries({
    @NamedQuery(name = "GnDepartamento.findAll", query = "SELECT g FROM GnDepartamento g")
    , @NamedQuery(name = "GnDepartamento.findByCodDepartamento", query = "SELECT g FROM GnDepartamento g WHERE g.codDepartamento = :codDepartamento")
    , @NamedQuery(name = "GnDepartamento.findByNomDepartamento", query = "SELECT g FROM GnDepartamento g WHERE g.nomDepartamento = :nomDepartamento")
    , @NamedQuery(name = "GnDepartamento.findByUsuActividad", query = "SELECT g FROM GnDepartamento g WHERE g.usuActividad = :usuActividad")
    , @NamedQuery(name = "GnDepartamento.findByTipActividad", query = "SELECT g FROM GnDepartamento g WHERE g.tipActividad = :tipActividad")
    , @NamedQuery(name = "GnDepartamento.findByHorActividad", query = "SELECT g FROM GnDepartamento g WHERE g.horActividad = :horActividad")})
public class GnDepartamento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codDepartamento", nullable = false)
    private Integer codDepartamento;
    @Size(max = 30)
    @Column(name = "nomDepartamento", length = 30)
    private String nomDepartamento;
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
    @JoinColumn(name = "codPais", referencedColumnName = "codPais", nullable = false)
    @ManyToOne(optional = false)
    private GnPais codPais;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codDepartamento")
    private List<GnMunicipio> gnMunicipioList;

    public GnDepartamento() {
    }

    public GnDepartamento(Integer codDepartamento) {
        this.codDepartamento = codDepartamento;
    }

    public GnDepartamento(Integer codDepartamento, String usuActividad, String tipActividad, Date horActividad) {
        this.codDepartamento = codDepartamento;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public Integer getCodDepartamento() {
        return codDepartamento;
    }

    public void setCodDepartamento(Integer codDepartamento) {
        this.codDepartamento = codDepartamento;
    }

    public String getNomDepartamento() {
        return nomDepartamento;
    }

    public void setNomDepartamento(String nomDepartamento) {
        this.nomDepartamento = nomDepartamento;
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

    public GnPais getCodPais() {
        return codPais;
    }

    public void setCodPais(GnPais codPais) {
        this.codPais = codPais;
    }

    public List<GnMunicipio> getGnMunicipioList() {
        return gnMunicipioList;
    }

    public void setGnMunicipioList(List<GnMunicipio> gnMunicipioList) {
        this.gnMunicipioList = gnMunicipioList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codDepartamento != null ? codDepartamento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnDepartamento)) {
            return false;
        }
        GnDepartamento other = (GnDepartamento) object;
        if ((this.codDepartamento == null && other.codDepartamento != null) || (this.codDepartamento != null && !this.codDepartamento.equals(other.codDepartamento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnDepartamento[ codDepartamento=" + codDepartamento + " ]";
    }
    
}
