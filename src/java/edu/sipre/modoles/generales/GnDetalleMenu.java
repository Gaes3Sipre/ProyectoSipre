/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.generales;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "Gn_DetalleMenu", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codRol"})
    , @UniqueConstraint(columnNames = {"codMenu"})})
@NamedQueries({
    @NamedQuery(name = "GnDetalleMenu.findAll", query = "SELECT g FROM GnDetalleMenu g")
    , @NamedQuery(name = "GnDetalleMenu.findByCodMenu", query = "SELECT g FROM GnDetalleMenu g WHERE g.gnDetalleMenuPK.codMenu = :codMenu")
    , @NamedQuery(name = "GnDetalleMenu.findByCodPrograma", query = "SELECT g FROM GnDetalleMenu g WHERE g.gnDetalleMenuPK.codPrograma = :codPrograma")
    , @NamedQuery(name = "GnDetalleMenu.findByCodRol", query = "SELECT g FROM GnDetalleMenu g WHERE g.gnDetalleMenuPK.codRol = :codRol")
    , @NamedQuery(name = "GnDetalleMenu.findByUsuActividad", query = "SELECT g FROM GnDetalleMenu g WHERE g.usuActividad = :usuActividad")
    , @NamedQuery(name = "GnDetalleMenu.findByTipActividad", query = "SELECT g FROM GnDetalleMenu g WHERE g.tipActividad = :tipActividad")
    , @NamedQuery(name = "GnDetalleMenu.findByHorActividad", query = "SELECT g FROM GnDetalleMenu g WHERE g.horActividad = :horActividad")})
public class GnDetalleMenu implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected GnDetalleMenuPK gnDetalleMenuPK;
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
    @JoinColumn(name = "codMenu", referencedColumnName = "codMenu", nullable = false, insertable = false, updatable = false)
    @OneToOne(optional = false)
    private GnMenu gnMenu;
    @JoinColumn(name = "codPrograma", referencedColumnName = "codPrograma", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private GnPrograma gnPrograma;
    @JoinColumn(name = "codRol", referencedColumnName = "codRol", nullable = false, insertable = false, updatable = false)
    @OneToOne(optional = false)
    private GnRol gnRol;

    public GnDetalleMenu() {
    }

    public GnDetalleMenu(GnDetalleMenuPK gnDetalleMenuPK) {
        this.gnDetalleMenuPK = gnDetalleMenuPK;
    }

    public GnDetalleMenu(GnDetalleMenuPK gnDetalleMenuPK, int usuActividad, String tipActividad, Date horActividad) {
        this.gnDetalleMenuPK = gnDetalleMenuPK;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public GnDetalleMenu(int codMenu, int codPrograma, int codRol) {
        this.gnDetalleMenuPK = new GnDetalleMenuPK(codMenu, codPrograma, codRol);
    }

    public GnDetalleMenuPK getGnDetalleMenuPK() {
        return gnDetalleMenuPK;
    }

    public void setGnDetalleMenuPK(GnDetalleMenuPK gnDetalleMenuPK) {
        this.gnDetalleMenuPK = gnDetalleMenuPK;
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

    public GnMenu getGnMenu() {
        return gnMenu;
    }

    public void setGnMenu(GnMenu gnMenu) {
        this.gnMenu = gnMenu;
    }

    public GnPrograma getGnPrograma() {
        return gnPrograma;
    }

    public void setGnPrograma(GnPrograma gnPrograma) {
        this.gnPrograma = gnPrograma;
    }

    public GnRol getGnRol() {
        return gnRol;
    }

    public void setGnRol(GnRol gnRol) {
        this.gnRol = gnRol;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (gnDetalleMenuPK != null ? gnDetalleMenuPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnDetalleMenu)) {
            return false;
        }
        GnDetalleMenu other = (GnDetalleMenu) object;
        if ((this.gnDetalleMenuPK == null && other.gnDetalleMenuPK != null) || (this.gnDetalleMenuPK != null && !this.gnDetalleMenuPK.equals(other.gnDetalleMenuPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnDetalleMenu[ gnDetalleMenuPK=" + gnDetalleMenuPK + " ]";
    }
    
}
