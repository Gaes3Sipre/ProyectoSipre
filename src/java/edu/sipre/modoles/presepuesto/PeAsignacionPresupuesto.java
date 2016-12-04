/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.presepuesto;

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
@Table(name = "Pe_AsignacionPresupuestos", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codPresupuesto"})})
@NamedQueries({
    @NamedQuery(name = "PeAsignacionPresupuesto.findAll", query = "SELECT p FROM PeAsignacionPresupuesto p")
    , @NamedQuery(name = "PeAsignacionPresupuesto.findByCodPresupuesto", query = "SELECT p FROM PeAsignacionPresupuesto p WHERE p.codPresupuesto = :codPresupuesto")
    , @NamedQuery(name = "PeAsignacionPresupuesto.findByAnoPresupuesto", query = "SELECT p FROM PeAsignacionPresupuesto p WHERE p.anoPresupuesto = :anoPresupuesto")
    , @NamedQuery(name = "PeAsignacionPresupuesto.findByValInicial", query = "SELECT p FROM PeAsignacionPresupuesto p WHERE p.valInicial = :valInicial")
    , @NamedQuery(name = "PeAsignacionPresupuesto.findByValEjecutado", query = "SELECT p FROM PeAsignacionPresupuesto p WHERE p.valEjecutado = :valEjecutado")
    , @NamedQuery(name = "PeAsignacionPresupuesto.findByValPendiente", query = "SELECT p FROM PeAsignacionPresupuesto p WHERE p.valPendiente = :valPendiente")
    , @NamedQuery(name = "PeAsignacionPresupuesto.findByUsuActividad", query = "SELECT p FROM PeAsignacionPresupuesto p WHERE p.usuActividad = :usuActividad")
    , @NamedQuery(name = "PeAsignacionPresupuesto.findByTipActividad", query = "SELECT p FROM PeAsignacionPresupuesto p WHERE p.tipActividad = :tipActividad")
    , @NamedQuery(name = "PeAsignacionPresupuesto.findByHorActividad", query = "SELECT p FROM PeAsignacionPresupuesto p WHERE p.horActividad = :horActividad")})
public class PeAsignacionPresupuesto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codPresupuesto", nullable = false)
    private Integer codPresupuesto;
    @Basic(optional = false)
    @NotNull
    @Column(name = "anoPresupuesto", nullable = false)
    private int anoPresupuesto;
    @Basic(optional = false)
    @NotNull
    @Column(name = "valInicial", nullable = false)
    private double valInicial;
    @Basic(optional = false)
    @NotNull
    @Column(name = "valEjecutado", nullable = false)
    private double valEjecutado;
    @Basic(optional = false)
    @NotNull
    @Column(name = "valPendiente", nullable = false)
    private double valPendiente;
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codPresupuesto")
    private List<PeDetallePresupuesto> peDetallePresupuestoList;

    public PeAsignacionPresupuesto() {
    }

    public PeAsignacionPresupuesto(Integer codPresupuesto) {
        this.codPresupuesto = codPresupuesto;
    }

    public PeAsignacionPresupuesto(Integer codPresupuesto, int anoPresupuesto, double valInicial, double valEjecutado, double valPendiente, int usuActividad, String tipActividad, Date horActividad) {
        this.codPresupuesto = codPresupuesto;
        this.anoPresupuesto = anoPresupuesto;
        this.valInicial = valInicial;
        this.valEjecutado = valEjecutado;
        this.valPendiente = valPendiente;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public Integer getCodPresupuesto() {
        return codPresupuesto;
    }

    public void setCodPresupuesto(Integer codPresupuesto) {
        this.codPresupuesto = codPresupuesto;
    }

    public int getAnoPresupuesto() {
        return anoPresupuesto;
    }

    public void setAnoPresupuesto(int anoPresupuesto) {
        this.anoPresupuesto = anoPresupuesto;
    }

    public double getValInicial() {
        return valInicial;
    }

    public void setValInicial(double valInicial) {
        this.valInicial = valInicial;
    }

    public double getValEjecutado() {
        return valEjecutado;
    }

    public void setValEjecutado(double valEjecutado) {
        this.valEjecutado = valEjecutado;
    }

    public double getValPendiente() {
        return valPendiente;
    }

    public void setValPendiente(double valPendiente) {
        this.valPendiente = valPendiente;
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

    public List<PeDetallePresupuesto> getPeDetallePresupuestoList() {
        return peDetallePresupuestoList;
    }

    public void setPeDetallePresupuestoList(List<PeDetallePresupuesto> peDetallePresupuestoList) {
        this.peDetallePresupuestoList = peDetallePresupuestoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codPresupuesto != null ? codPresupuesto.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PeAsignacionPresupuesto)) {
            return false;
        }
        PeAsignacionPresupuesto other = (PeAsignacionPresupuesto) object;
        if ((this.codPresupuesto == null && other.codPresupuesto != null) || (this.codPresupuesto != null && !this.codPresupuesto.equals(other.codPresupuesto))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.PeAsignacionPresupuesto[ codPresupuesto=" + codPresupuesto + " ]";
    }
    
}
