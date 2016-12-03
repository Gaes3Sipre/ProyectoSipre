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
@Table(name = "Gn_Programas", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codPrograma"})})
@NamedQueries({
    @NamedQuery(name = "GnPrograma.findAll", query = "SELECT g FROM GnPrograma g")
    , @NamedQuery(name = "GnPrograma.findByCodPrograma", query = "SELECT g FROM GnPrograma g WHERE g.codPrograma = :codPrograma")
    , @NamedQuery(name = "GnPrograma.findByNomPrograma", query = "SELECT g FROM GnPrograma g WHERE g.nomPrograma = :nomPrograma")
    , @NamedQuery(name = "GnPrograma.findByDirPrograma", query = "SELECT g FROM GnPrograma g WHERE g.dirPrograma = :dirPrograma")
    , @NamedQuery(name = "GnPrograma.findByUsuActividad", query = "SELECT g FROM GnPrograma g WHERE g.usuActividad = :usuActividad")
    , @NamedQuery(name = "GnPrograma.findByTipActividad", query = "SELECT g FROM GnPrograma g WHERE g.tipActividad = :tipActividad")
    , @NamedQuery(name = "GnPrograma.findByHorActividad", query = "SELECT g FROM GnPrograma g WHERE g.horActividad = :horActividad")})
public class GnPrograma implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codPrograma", nullable = false)
    private Integer codPrograma;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "nomPrograma", nullable = false, length = 40)
    private String nomPrograma;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "dirPrograma", nullable = false, length = 40)
    private String dirPrograma;
    @Basic(optional = false)
    @NotNull
    @Column(name = "usuActividad", nullable = false)
    private int usuActividad;
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "gnPrograma")
    private List<GnDetalleMenu> gnDetalleMenuList;

    public GnPrograma() {
    }

    public GnPrograma(Integer codPrograma) {
        this.codPrograma = codPrograma;
    }

    public GnPrograma(Integer codPrograma, String nomPrograma, String dirPrograma, int usuActividad, String tipActividad, Date horActividad) {
        this.codPrograma = codPrograma;
        this.nomPrograma = nomPrograma;
        this.dirPrograma = dirPrograma;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public Integer getCodPrograma() {
        return codPrograma;
    }

    public void setCodPrograma(Integer codPrograma) {
        this.codPrograma = codPrograma;
    }

    public String getNomPrograma() {
        return nomPrograma;
    }

    public void setNomPrograma(String nomPrograma) {
        this.nomPrograma = nomPrograma;
    }

    public String getDirPrograma() {
        return dirPrograma;
    }

    public void setDirPrograma(String dirPrograma) {
        this.dirPrograma = dirPrograma;
    }

    public int getUsuActividad() {
        return usuActividad;
    }

    public void setUsuActividad(int usuActividad) {
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

    public List<GnDetalleMenu> getGnDetalleMenuList() {
        return gnDetalleMenuList;
    }

    public void setGnDetalleMenuList(List<GnDetalleMenu> gnDetalleMenuList) {
        this.gnDetalleMenuList = gnDetalleMenuList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codPrograma != null ? codPrograma.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnPrograma)) {
            return false;
        }
        GnPrograma other = (GnPrograma) object;
        if ((this.codPrograma == null && other.codPrograma != null) || (this.codPrograma != null && !this.codPrograma.equals(other.codPrograma))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnPrograma[ codPrograma=" + codPrograma + " ]";
    }
    
}
