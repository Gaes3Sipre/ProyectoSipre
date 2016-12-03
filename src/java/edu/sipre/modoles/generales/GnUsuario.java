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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author alejozepol
 */
@Entity
@Table(name = "Gn_Usuarios")
@NamedQueries({
    @NamedQuery(name = "GnUsuario.findAll", query = "SELECT g FROM GnUsuario g")
    , @NamedQuery(name = "GnUsuario.findByCodUsuario", query = "SELECT g FROM GnUsuario g WHERE g.codUsuario = :codUsuario")
    , @NamedQuery(name = "GnUsuario.findByClave", query = "SELECT g FROM GnUsuario g WHERE g.clave = :clave")
    , @NamedQuery(name = "GnUsuario.findByUsuActividad", query = "SELECT g FROM GnUsuario g WHERE g.usuActividad = :usuActividad")
    , @NamedQuery(name = "GnUsuario.findByTipActividad", query = "SELECT g FROM GnUsuario g WHERE g.tipActividad = :tipActividad")
    , @NamedQuery(name = "GnUsuario.findByHorActividad", query = "SELECT g FROM GnUsuario g WHERE g.horActividad = :horActividad")})
public class GnUsuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "codUsuario", nullable = false, length = 15)
    private String codUsuario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "Clave", nullable = false, length = 15)
    private String clave;
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codUsuario")
    private List<GnDetalleRol> gnDetalleRolList;
    @JoinColumn(name = "codTercero", referencedColumnName = "codTercero", nullable = false)
    @ManyToOne(optional = false)
    private BiTercero codTercero;

    public GnUsuario() {
    }

    public GnUsuario(String codUsuario) {
        this.codUsuario = codUsuario;
    }

    public GnUsuario(String codUsuario, String clave, int usuActividad, String tipActividad, Date horActividad) {
        this.codUsuario = codUsuario;
        this.clave = clave;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public String getCodUsuario() {
        return codUsuario;
    }

    public void setCodUsuario(String codUsuario) {
        this.codUsuario = codUsuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
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

    public List<GnDetalleRol> getGnDetalleRolList() {
        return gnDetalleRolList;
    }

    public void setGnDetalleRolList(List<GnDetalleRol> gnDetalleRolList) {
        this.gnDetalleRolList = gnDetalleRolList;
    }

    public BiTercero getCodTercero() {
        return codTercero;
    }

    public void setCodTercero(BiTercero codTercero) {
        this.codTercero = codTercero;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codUsuario != null ? codUsuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnUsuario)) {
            return false;
        }
        GnUsuario other = (GnUsuario) object;
        if ((this.codUsuario == null && other.codUsuario != null) || (this.codUsuario != null && !this.codUsuario.equals(other.codUsuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnUsuario[ codUsuario=" + codUsuario + " ]";
    }
    
}
