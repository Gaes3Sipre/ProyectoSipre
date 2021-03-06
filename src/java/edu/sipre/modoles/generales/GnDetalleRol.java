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
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
@Table(name = "Gn_DetalleRol", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codRol"})})
@NamedQueries({
    @NamedQuery(name = "GnDetalleRol.todos", query = "SELECT g FROM GnDetalleRol g")
    , @NamedQuery(name = "GnDetalleRol.codRol", query = "SELECT g FROM GnDetalleRol g WHERE g.codRol = :codRol")
    , @NamedQuery(name = "GnDetalleRol.usuActividad", query = "SELECT g FROM GnDetalleRol g WHERE g.usuActividad = :usuActividad")
    , @NamedQuery(name = "GnDetalleRol.tipActividad", query = "SELECT g FROM GnDetalleRol g WHERE g.tipActividad = :tipActividad")
    , @NamedQuery(name = "GnDetalleRol.codUsuario", query = "SELECT g FROM GnDetalleRol g WHERE g.codUsuario = :codUsuario")
    , @NamedQuery(name = "GnDetalleRol.horActividad", query = "SELECT g FROM GnDetalleRol g WHERE g.horActividad = :horActividad")})
public class GnDetalleRol implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codDetalleRol", nullable = false)
    private Integer codDetalleRol;
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
    @JoinColumn(name = "codUsuario", referencedColumnName = "codUsuario", nullable = false)
    @ManyToOne(optional = false)
    private GnUsuario codUsuario;
    @JoinColumn(name = "codRol", referencedColumnName = "codRol", nullable = false)
    @ManyToOne(optional = false)
    private GnRol codRol;

    public GnDetalleRol() {
    }

    public GnDetalleRol(Integer codDetalleRol) {
        this.codDetalleRol = codDetalleRol;
    }

    public GnDetalleRol(Integer codDetalleRol, int usuActividad, String tipActividad, Date horActividad) {
        this.codDetalleRol = codDetalleRol;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public Integer getCodDetalleRol() {
        return codDetalleRol;
    }

    public void setCodDetalleRol(Integer codDetalleRol) {
        this.codDetalleRol = codDetalleRol;
    }

    public GnRol getCodRol() {
        return codRol;
    }

    public void setCodRol(GnRol codRol) {
        this.codRol = codRol;
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

    public GnUsuario getCodUsuario() {
        return codUsuario;
    }

    public void setCodUsuario(GnUsuario codUsuario) {
        this.codUsuario = codUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codRol != null ? codRol.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnDetalleRol)) {
            return false;
        }
        GnDetalleRol other = (GnDetalleRol) object;
        if ((this.codRol == null && other.codRol != null) || (this.codRol != null && !this.codRol.equals(other.codRol))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnDetalleRol[ codRol=" + codRol + " ]";
    }
    
}
