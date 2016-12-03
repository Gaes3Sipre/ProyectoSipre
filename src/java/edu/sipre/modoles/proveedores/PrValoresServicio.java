/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles;

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
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author alejozepol
 */
@Entity
@Table(name = "Pr_ValoresServicios", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codValor"})})
@NamedQueries({
    @NamedQuery(name = "PrValoresServicio.findAll", query = "SELECT p FROM PrValoresServicio p")
    , @NamedQuery(name = "PrValoresServicio.findByCodValor", query = "SELECT p FROM PrValoresServicio p WHERE p.codValor = :codValor")
    , @NamedQuery(name = "PrValoresServicio.findByObservacion", query = "SELECT p FROM PrValoresServicio p WHERE p.observacion = :observacion")
    , @NamedQuery(name = "PrValoresServicio.findByFecFinalVigencia", query = "SELECT p FROM PrValoresServicio p WHERE p.fecFinalVigencia = :fecFinalVigencia")
    , @NamedQuery(name = "PrValoresServicio.findByValServicio", query = "SELECT p FROM PrValoresServicio p WHERE p.valServicio = :valServicio")
    , @NamedQuery(name = "PrValoresServicio.findByUsuActividad", query = "SELECT p FROM PrValoresServicio p WHERE p.usuActividad = :usuActividad")
    , @NamedQuery(name = "PrValoresServicio.findByTipActividad", query = "SELECT p FROM PrValoresServicio p WHERE p.tipActividad = :tipActividad")
    , @NamedQuery(name = "PrValoresServicio.findByHorActividad", query = "SELECT p FROM PrValoresServicio p WHERE p.horActividad = :horActividad")})
public class PrValoresServicio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codValor", nullable = false)
    private Integer codValor;
    @Size(max = 2147483647)
    @Column(name = "observacion", length = 2147483647)
    private String observacion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecFinalVigencia", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fecFinalVigencia;
    @Basic(optional = false)
    @NotNull
    @Column(name = "valServicio", nullable = false)
    private double valServicio;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 11)
    @Column(name = "usuActividad", nullable = false, length = 11)
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
    @JoinColumn(name = "tipBeneficio", referencedColumnName = "codServicio", nullable = false)
    @ManyToOne(optional = false)
    private BeTipobeneficio tipBeneficio;

    public PrValoresServicio() {
    }

    public PrValoresServicio(Integer codValor) {
        this.codValor = codValor;
    }

    public PrValoresServicio(Integer codValor, Date fecFinalVigencia, double valServicio, String usuActividad, String tipActividad, Date horActividad) {
        this.codValor = codValor;
        this.fecFinalVigencia = fecFinalVigencia;
        this.valServicio = valServicio;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public Integer getCodValor() {
        return codValor;
    }

    public void setCodValor(Integer codValor) {
        this.codValor = codValor;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public Date getFecFinalVigencia() {
        return fecFinalVigencia;
    }

    public void setFecFinalVigencia(Date fecFinalVigencia) {
        this.fecFinalVigencia = fecFinalVigencia;
    }

    public double getValServicio() {
        return valServicio;
    }

    public void setValServicio(double valServicio) {
        this.valServicio = valServicio;
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

    public BeTipobeneficio getTipBeneficio() {
        return tipBeneficio;
    }

    public void setTipBeneficio(BeTipobeneficio tipBeneficio) {
        this.tipBeneficio = tipBeneficio;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codValor != null ? codValor.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PrValoresServicio)) {
            return false;
        }
        PrValoresServicio other = (PrValoresServicio) object;
        if ((this.codValor == null && other.codValor != null) || (this.codValor != null && !this.codValor.equals(other.codValor))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.PrValoresServicio[ codValor=" + codValor + " ]";
    }
    
}
