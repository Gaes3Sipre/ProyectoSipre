/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.generales;

import edu.sipre.modoles.Biodata.BiTercero;
import edu.sipre.modoles.generales.GnTipoDocumento;
import edu.sipre.modoles.generales.*;
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
@Table(name = "Gn_DocAdjuntos")
@NamedQueries({
    @NamedQuery(name = "GnDocAdjunto.findAll", query = "SELECT g FROM GnDocAdjunto g")
    , @NamedQuery(name = "GnDocAdjunto.findByCodTercero", query = "SELECT g FROM GnDocAdjunto g WHERE g.gnDocAdjuntoPK.codTercero = :codTercero")
    , @NamedQuery(name = "GnDocAdjunto.findByCodDocumento", query = "SELECT g FROM GnDocAdjunto g WHERE g.gnDocAdjuntoPK.codDocumento = :codDocumento")
    , @NamedQuery(name = "GnDocAdjunto.findByRutArchivo", query = "SELECT g FROM GnDocAdjunto g WHERE g.rutArchivo = :rutArchivo")
    , @NamedQuery(name = "GnDocAdjunto.findByUsuActividad", query = "SELECT g FROM GnDocAdjunto g WHERE g.usuActividad = :usuActividad")
    , @NamedQuery(name = "GnDocAdjunto.findByTipActividad", query = "SELECT g FROM GnDocAdjunto g WHERE g.tipActividad = :tipActividad")
    , @NamedQuery(name = "GnDocAdjunto.findByHorActividad", query = "SELECT g FROM GnDocAdjunto g WHERE g.horActividad = :horActividad")})
public class GnDocAdjunto implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected GnDocAdjuntoPK gnDocAdjuntoPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "rutArchivo", nullable = false)
    private int rutArchivo;
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
    @JoinColumn(name = "codTercero", referencedColumnName = "codTercero", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private BiTercero biTercero;
    @JoinColumn(name = "tipDocumento", referencedColumnName = "codTipoDocumentos", nullable = false)
    @ManyToOne(optional = false)
    private GnTipoDocumento tipDocumento;

    public GnDocAdjunto() {
    }

    public GnDocAdjunto(GnDocAdjuntoPK gnDocAdjuntoPK) {
        this.gnDocAdjuntoPK = gnDocAdjuntoPK;
    }

    public GnDocAdjunto(GnDocAdjuntoPK gnDocAdjuntoPK, int rutArchivo, int usuActividad, String tipActividad, Date horActividad) {
        this.gnDocAdjuntoPK = gnDocAdjuntoPK;
        this.rutArchivo = rutArchivo;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public GnDocAdjunto(int codTercero, int codDocumento) {
        this.gnDocAdjuntoPK = new GnDocAdjuntoPK(codTercero, codDocumento);
    }

    public GnDocAdjuntoPK getGnDocAdjuntoPK() {
        return gnDocAdjuntoPK;
    }

    public void setGnDocAdjuntoPK(GnDocAdjuntoPK gnDocAdjuntoPK) {
        this.gnDocAdjuntoPK = gnDocAdjuntoPK;
    }

    public int getRutArchivo() {
        return rutArchivo;
    }

    public void setRutArchivo(int rutArchivo) {
        this.rutArchivo = rutArchivo;
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

    public BiTercero getBiTercero() {
        return biTercero;
    }

    public void setBiTercero(BiTercero biTercero) {
        this.biTercero = biTercero;
    }

    public GnTipoDocumento getTipDocumento() {
        return tipDocumento;
    }

    public void setTipDocumento(GnTipoDocumento tipDocumento) {
        this.tipDocumento = tipDocumento;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (gnDocAdjuntoPK != null ? gnDocAdjuntoPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnDocAdjunto)) {
            return false;
        }
        GnDocAdjunto other = (GnDocAdjunto) object;
        if ((this.gnDocAdjuntoPK == null && other.gnDocAdjuntoPK != null) || (this.gnDocAdjuntoPK != null && !this.gnDocAdjuntoPK.equals(other.gnDocAdjuntoPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnDocAdjunto[ gnDocAdjuntoPK=" + gnDocAdjuntoPK + " ]";
    }
    
}
