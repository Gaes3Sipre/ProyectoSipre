/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.beneficios;

import edu.sipre.modoles.Biodata.BiProveedor;
import edu.sipre.modoles.Biodata.BiTercero;
import edu.sipre.modoles.beneficios.BeTipobeneficio;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
@Table(name = "Be_solicitud")
@NamedQueries({
    @NamedQuery(name = "Besolicitud.findAll", query = "SELECT b FROM Besolicitud b")
    , @NamedQuery(name = "Besolicitud.findByCodSolicitud", query = "SELECT b FROM Besolicitud b WHERE b.codSolicitud = :codSolicitud")
    , @NamedQuery(name = "Besolicitud.findByEstSolicitud", query = "SELECT b FROM Besolicitud b WHERE b.estSolicitud = :estSolicitud")
    , @NamedQuery(name = "Besolicitud.findByFecSolicitud", query = "SELECT b FROM Besolicitud b WHERE b.fecSolicitud = :fecSolicitud")
    , @NamedQuery(name = "Besolicitud.findByObservaciones", query = "SELECT b FROM Besolicitud b WHERE b.observaciones = :observaciones")
    , @NamedQuery(name = "Besolicitud.findByUsuActividad", query = "SELECT b FROM Besolicitud b WHERE b.usuActividad = :usuActividad")
    , @NamedQuery(name = "Besolicitud.findByTipActividad", query = "SELECT b FROM Besolicitud b WHERE b.tipActividad = :tipActividad")
    , @NamedQuery(name = "Besolicitud.findByHorActividad", query = "SELECT b FROM Besolicitud b WHERE b.horActividad = :horActividad")})
public class Besolicitud implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codSolicitud", nullable = false)
    private Integer codSolicitud;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "estSolicitud", nullable = false, length = 1)
    private String estSolicitud;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecSolicitud", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fecSolicitud;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "observaciones", nullable = false, length = 255)
    private String observaciones;
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
//    @JoinColumn(name = "codservicios", referencedColumnName = "codServicio", nullable = false)
//    @ManyToOne(optional = false)
//    private BeTipobeneficio codservicios;
    @JoinColumn(name = "codProveedor", referencedColumnName = "codProveedor", nullable = false)
    @ManyToOne(optional = false)
    private BiProveedor codProveedor;
    @JoinColumn(name = "codTomador", referencedColumnName = "codTercero", nullable = false)
    @ManyToOne(optional = false)
    private BiTercero codTomador;

    public Besolicitud() {
    }

    public Besolicitud(Integer codSolicitud) {
        this.codSolicitud = codSolicitud;
    }

    public Besolicitud(Integer codSolicitud, String estSolicitud, Date fecSolicitud, String observaciones, int usuActividad, String tipActividad, Date horActividad) {
        this.codSolicitud = codSolicitud;
        this.estSolicitud = estSolicitud;
        this.fecSolicitud = fecSolicitud;
        this.observaciones = observaciones;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public Integer getCodSolicitud() {
        return codSolicitud;
    }

    public void setCodSolicitud(Integer codSolicitud) {
        this.codSolicitud = codSolicitud;
    }

    public String getEstSolicitud() {
        return estSolicitud;
    }

    public void setEstSolicitud(String estSolicitud) {
        this.estSolicitud = estSolicitud;
    }

    public Date getFecSolicitud() {
        return fecSolicitud;
    }

    public void setFecSolicitud(Date fecSolicitud) {
        this.fecSolicitud = fecSolicitud;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
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
//
//    public BeTipobeneficio getCodservicios() {
//        return codservicios;
//    }
//
//    public void setCodservicios(BeTipobeneficio codservicios) {
//        this.codservicios = codservicios;
//    }
    
    public BiProveedor getCodProveedor() {
        return codProveedor;
    }

    public void setCodProveedor(BiProveedor codProveedor) {
        this.codProveedor = codProveedor;
    }

    public BiTercero getCodTomador() {
        return codTomador;
    }

    public void setCodTomador(BiTercero codTomador) {
        this.codTomador = codTomador;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codSolicitud != null ? codSolicitud.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Besolicitud)) {
            return false;
        }
        Besolicitud other = (Besolicitud) object;
        if ((this.codSolicitud == null && other.codSolicitud != null) || (this.codSolicitud != null && !this.codSolicitud.equals(other.codSolicitud))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.Besolicitud[ codSolicitud=" + codSolicitud + " ]";
    }
    
}
