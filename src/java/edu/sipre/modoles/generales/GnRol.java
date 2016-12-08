/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.generales;

import edu.sipre.modoles.generales.GnDetalleMenu;
import edu.sipre.modoles.generales.GnDetalleRol;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
@Table(name = "Gn_Roles", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codRol"})})
@NamedQueries({
    @NamedQuery(name = "GnRol.todos", query = "SELECT g FROM GnRol g")
    , @NamedQuery(name = "GnRol.codRol", query = "SELECT g FROM GnRol g WHERE g.codRol = :codRol")
    , @NamedQuery(name = "GnRol.nomRol", query = "SELECT g FROM GnRol g WHERE g.nomRol = :nomRol")
    , @NamedQuery(name = "GnRol.tipRol", query = "SELECT g FROM GnRol g WHERE g.tipRol = :tipRol")
    , @NamedQuery(name = "GnRol.usuActividad", query = "SELECT g FROM GnRol g WHERE g.usuActividad = :usuActividad")
    , @NamedQuery(name = "GnRol.tipActividad", query = "SELECT g FROM GnRol g WHERE g.tipActividad = :tipActividad")
    , @NamedQuery(name = "GnRol.codDetalleRol", query = "SELECT g FROM GnRol g WHERE g.codDetalleRolList = :codDetalleRolList")
    , @NamedQuery(name = "GnRol.horActividad", query = "SELECT g FROM GnRol g WHERE g.horActividad = :horActividad")})
public class GnRol implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codRol", nullable = false)
    private Integer codRol;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "nomRol", nullable = false, length = 20)
    private String nomRol;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "TipRol", nullable = false, length = 1)
    private String tipRol;
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codRol")
    private List<GnDetalleRol> codDetalleRolList;
//    @OneToOne(cascade = CascadeType.ALL, mappedBy = "gnRol")
//    private GnDetalleMenu gnDetalleMenu;

    public GnRol() {
    }

    public GnRol(Integer codRol) {
        this.codRol = codRol;
    }

    public GnRol(Integer codRol, String nomRol, String tipRol, int usuActividad, String tipActividad, Date horActividad) {
        this.codRol = codRol;
        this.nomRol = nomRol;
        this.tipRol = tipRol;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public Integer getCodRol() {
        return codRol;
    }

    public void setCodRol(Integer codRol) {
        this.codRol = codRol;
    }

    public String getNomRol() {
        return nomRol;
    }

    public void setNomRol(String nomRol) {
        this.nomRol = nomRol;
    }

    public String getTipRol() {
        return tipRol;
    }

    public void setTipRol(String tipRol) {
        this.tipRol = tipRol;
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

    public List<GnDetalleRol> getCodDetalleRol() {
        return codDetalleRolList;
    }

    public void setCodDetalleRol(List<GnDetalleRol> codDetalleRol) {
        this.codDetalleRolList = codDetalleRol;
    }   
//
//    public GnDetalleMenu getGnDetalleMenu() {
//        return gnDetalleMenu;
//    }
//
//    public void setGnDetalleMenu(GnDetalleMenu gnDetalleMenu) {
//        this.gnDetalleMenu = gnDetalleMenu;
//    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codRol != null ? codRol.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnRol)) {
            return false;
        }
        GnRol other = (GnRol) object;
        if ((this.codRol == null && other.codRol != null) || (this.codRol != null && !this.codRol.equals(other.codRol))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnRol[ codRol=" + codRol + " ]";
    }
    
}
