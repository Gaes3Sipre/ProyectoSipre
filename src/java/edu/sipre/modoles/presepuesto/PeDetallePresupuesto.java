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
@Table(name = "Pe_DetallePresupuesto", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codDetallePresupuesto"})})
@NamedQueries({
    @NamedQuery(name = "PeDetallePresupuesto.findAll", query = "SELECT p FROM PeDetallePresupuesto p")
    , @NamedQuery(name = "PeDetallePresupuesto.findByCodDetallePresupuesto", query = "SELECT p FROM PeDetallePresupuesto p WHERE p.codDetallePresupuesto = :codDetallePresupuesto")
    , @NamedQuery(name = "PeDetallePresupuesto.findByCodTomador", query = "SELECT p FROM PeDetallePresupuesto p WHERE p.codTomador = :codTomador")
    , @NamedQuery(name = "PeDetallePresupuesto.findByValEmpresa", query = "SELECT p FROM PeDetallePresupuesto p WHERE p.valEmpresa = :valEmpresa")
    , @NamedQuery(name = "PeDetallePresupuesto.findByUsuActividad", query = "SELECT p FROM PeDetallePresupuesto p WHERE p.usuActividad = :usuActividad")
    , @NamedQuery(name = "PeDetallePresupuesto.findByTipActividad", query = "SELECT p FROM PeDetallePresupuesto p WHERE p.tipActividad = :tipActividad")
    , @NamedQuery(name = "PeDetallePresupuesto.findByHorActividad", query = "SELECT p FROM PeDetallePresupuesto p WHERE p.horActividad = :horActividad")})
public class PeDetallePresupuesto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codDetallePresupuesto", nullable = false)
    private Integer codDetallePresupuesto;
    @Basic(optional = false)
    @NotNull
    @Column(name = "codTomador", nullable = false)
    private int codTomador;
    @Basic(optional = false)
    @NotNull
    @Column(name = "valEmpresa", nullable = false)
    private double valEmpresa;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "usuActividad", nullable = false, length = 15)
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
    @JoinColumn(name = "codProveedor", referencedColumnName = "codProveedor", nullable = false)
    @ManyToOne(optional = false)
    private BiProveedor codProveedor;
    @JoinColumn(name = "codPresupuesto", referencedColumnName = "codPresupuesto", nullable = false)
    @ManyToOne(optional = false)
    private PeAsignacionPresupuesto codPresupuesto;
    @JoinColumn(name = "codFactura", referencedColumnName = "codFactura", nullable = false)
    @ManyToOne(optional = false)
    private PrFacturacion codFactura;

    public PeDetallePresupuesto() {
    }

    public PeDetallePresupuesto(Integer codDetallePresupuesto) {
        this.codDetallePresupuesto = codDetallePresupuesto;
    }

    public PeDetallePresupuesto(Integer codDetallePresupuesto, int codTomador, double valEmpresa, String usuActividad, String tipActividad, Date horActividad) {
        this.codDetallePresupuesto = codDetallePresupuesto;
        this.codTomador = codTomador;
        this.valEmpresa = valEmpresa;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public Integer getCodDetallePresupuesto() {
        return codDetallePresupuesto;
    }

    public void setCodDetallePresupuesto(Integer codDetallePresupuesto) {
        this.codDetallePresupuesto = codDetallePresupuesto;
    }

    public int getCodTomador() {
        return codTomador;
    }

    public void setCodTomador(int codTomador) {
        this.codTomador = codTomador;
    }

    public double getValEmpresa() {
        return valEmpresa;
    }

    public void setValEmpresa(double valEmpresa) {
        this.valEmpresa = valEmpresa;
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

    public BiProveedor getCodProveedor() {
        return codProveedor;
    }

    public void setCodProveedor(BiProveedor codProveedor) {
        this.codProveedor = codProveedor;
    }

    public PeAsignacionPresupuesto getCodPresupuesto() {
        return codPresupuesto;
    }

    public void setCodPresupuesto(PeAsignacionPresupuesto codPresupuesto) {
        this.codPresupuesto = codPresupuesto;
    }

    public PrFacturacion getCodFactura() {
        return codFactura;
    }

    public void setCodFactura(PrFacturacion codFactura) {
        this.codFactura = codFactura;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codDetallePresupuesto != null ? codDetallePresupuesto.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PeDetallePresupuesto)) {
            return false;
        }
        PeDetallePresupuesto other = (PeDetallePresupuesto) object;
        if ((this.codDetallePresupuesto == null && other.codDetallePresupuesto != null) || (this.codDetallePresupuesto != null && !this.codDetallePresupuesto.equals(other.codDetallePresupuesto))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.PeDetallePresupuesto[ codDetallePresupuesto=" + codDetallePresupuesto + " ]";
    }
    
}
