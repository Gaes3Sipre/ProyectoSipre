/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
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
@Table(name = "Gn_Menu", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codMenu"})})
@NamedQueries({
    @NamedQuery(name = "GnMenu.findAll", query = "SELECT g FROM GnMenu g")
    , @NamedQuery(name = "GnMenu.findByCodMenu", query = "SELECT g FROM GnMenu g WHERE g.codMenu = :codMenu")
    , @NamedQuery(name = "GnMenu.findByNomMenu", query = "SELECT g FROM GnMenu g WHERE g.nomMenu = :nomMenu")
    , @NamedQuery(name = "GnMenu.findByUsuActividad", query = "SELECT g FROM GnMenu g WHERE g.usuActividad = :usuActividad")
    , @NamedQuery(name = "GnMenu.findByTipActividad", query = "SELECT g FROM GnMenu g WHERE g.tipActividad = :tipActividad")
    , @NamedQuery(name = "GnMenu.findByHorActividad", query = "SELECT g FROM GnMenu g WHERE g.horActividad = :horActividad")})
public class GnMenu implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codMenu", nullable = false)
    private Integer codMenu;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "nomMenu", nullable = false, length = 40)
    private String nomMenu;
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
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "gnMenu")
    private GnDetalleMenu gnDetalleMenu;

    public GnMenu() {
    }

    public GnMenu(Integer codMenu) {
        this.codMenu = codMenu;
    }

    public GnMenu(Integer codMenu, String nomMenu, int usuActividad, String tipActividad, Date horActividad) {
        this.codMenu = codMenu;
        this.nomMenu = nomMenu;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public Integer getCodMenu() {
        return codMenu;
    }

    public void setCodMenu(Integer codMenu) {
        this.codMenu = codMenu;
    }

    public String getNomMenu() {
        return nomMenu;
    }

    public void setNomMenu(String nomMenu) {
        this.nomMenu = nomMenu;
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

    public GnDetalleMenu getGnDetalleMenu() {
        return gnDetalleMenu;
    }

    public void setGnDetalleMenu(GnDetalleMenu gnDetalleMenu) {
        this.gnDetalleMenu = gnDetalleMenu;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codMenu != null ? codMenu.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnMenu)) {
            return false;
        }
        GnMenu other = (GnMenu) object;
        if ((this.codMenu == null && other.codMenu != null) || (this.codMenu != null && !this.codMenu.equals(other.codMenu))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnMenu[ codMenu=" + codMenu + " ]";
    }
    
}
