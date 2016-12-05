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
@Table(name = "Gn_TipoDocumentos")
@NamedQueries({
    @NamedQuery(name = "GnTipoDocumento.findAll", query = "SELECT g FROM GnTipoDocumento g")
    , @NamedQuery(name = "GnTipoDocumento.findByCodTipoDocumentos", query = "SELECT g FROM GnTipoDocumento g WHERE g.codTipoDocumentos = :codTipoDocumentos")
    , @NamedQuery(name = "GnTipoDocumento.findByNomDocumento", query = "SELECT g FROM GnTipoDocumento g WHERE g.nomDocumento = :nomDocumento")
    , @NamedQuery(name = "GnTipoDocumento.findByUsuActividad", query = "SELECT g FROM GnTipoDocumento g WHERE g.usuActividad = :usuActividad")
    , @NamedQuery(name = "GnTipoDocumento.findByTipActividad", query = "SELECT g FROM GnTipoDocumento g WHERE g.tipActividad = :tipActividad")
    , @NamedQuery(name = "GnTipoDocumento.findByHorActividad", query = "SELECT g FROM GnTipoDocumento g WHERE g.horActividad = :horActividad")})
public class GnTipoDocumento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codTipoDocumentos", nullable = false)
    private Integer codTipoDocumentos;
    @Basic(optional = false)
    @NotNull
    @Column(name = "nomDocumento", nullable = false)
    private int nomDocumento;
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipDocumento")
    private List<GnDocAdjunto> gnDocAdjuntoList;

    public GnTipoDocumento() {
    }

    public GnTipoDocumento(Integer codTipoDocumentos) {
        this.codTipoDocumentos = codTipoDocumentos;
    }

    public GnTipoDocumento(Integer codTipoDocumentos, int nomDocumento, int usuActividad, String tipActividad, Date horActividad) {
        this.codTipoDocumentos = codTipoDocumentos;
        this.nomDocumento = nomDocumento;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public Integer getCodTipoDocumentos() {
        return codTipoDocumentos;
    }

    public void setCodTipoDocumentos(Integer codTipoDocumentos) {
        this.codTipoDocumentos = codTipoDocumentos;
    }

    public int getNomDocumento() {
        return nomDocumento;
    }

    public void setNomDocumento(int nomDocumento) {
        this.nomDocumento = nomDocumento;
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

    public List<GnDocAdjunto> getGnDocAdjuntoList() {
        return gnDocAdjuntoList;
    }

    public void setGnDocAdjuntoList(List<GnDocAdjunto> gnDocAdjuntoList) {
        this.gnDocAdjuntoList = gnDocAdjuntoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codTipoDocumentos != null ? codTipoDocumentos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnTipoDocumento)) {
            return false;
        }
        GnTipoDocumento other = (GnTipoDocumento) object;
        if ((this.codTipoDocumentos == null && other.codTipoDocumentos != null) || (this.codTipoDocumentos != null && !this.codTipoDocumentos.equals(other.codTipoDocumentos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnTipoDocumento[ codTipoDocumentos=" + codTipoDocumentos + " ]";
    }
    
}
