/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.proveedores;

import edu.sipre.modoles.presepuesto.PeDetallePresupuesto;
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
@Table(name = "Pr_Facturacion", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codFactura"})})
@NamedQueries({
    @NamedQuery(name = "PrFacturacion.findAll", query = "SELECT p FROM PrFacturacion p")
    , @NamedQuery(name = "PrFacturacion.findByCodFactura", query = "SELECT p FROM PrFacturacion p WHERE p.codFactura = :codFactura")
    , @NamedQuery(name = "PrFacturacion.findByCodServicio", query = "SELECT p FROM PrFacturacion p WHERE p.codServicio = :codServicio")
    , @NamedQuery(name = "PrFacturacion.findByValEmpleado", query = "SELECT p FROM PrFacturacion p WHERE p.valEmpleado = :valEmpleado")
    , @NamedQuery(name = "PrFacturacion.findByValEmpresa", query = "SELECT p FROM PrFacturacion p WHERE p.valEmpresa = :valEmpresa")
    , @NamedQuery(name = "PrFacturacion.findByUsuActividad", query = "SELECT p FROM PrFacturacion p WHERE p.usuActividad = :usuActividad")
    , @NamedQuery(name = "PrFacturacion.findByTipActividad", query = "SELECT p FROM PrFacturacion p WHERE p.tipActividad = :tipActividad")
    , @NamedQuery(name = "PrFacturacion.findByHorActividad", query = "SELECT p FROM PrFacturacion p WHERE p.horActividad = :horActividad")})
public class PrFacturacion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codFactura", nullable = false)
    private Integer codFactura;
    @Basic(optional = false)
    @NotNull
    @Column(name = "codServicio", nullable = false)
    private int codServicio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "valEmpleado", nullable = false)
    private double valEmpleado;
    @Basic(optional = false)
    @NotNull
    @Column(name = "valEmpresa", nullable = false)
    private double valEmpresa;
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codFactura")
    private List<PeDetallePresupuesto> peDetallePresupuestoList;

    public PrFacturacion() {
    }

    public PrFacturacion(Integer codFactura) {
        this.codFactura = codFactura;
    }

    public PrFacturacion(Integer codFactura, int codServicio, double valEmpleado, double valEmpresa, int usuActividad, String tipActividad, Date horActividad) {
        this.codFactura = codFactura;
        this.codServicio = codServicio;
        this.valEmpleado = valEmpleado;
        this.valEmpresa = valEmpresa;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public Integer getCodFactura() {
        return codFactura;
    }

    public void setCodFactura(Integer codFactura) {
        this.codFactura = codFactura;
    }

    public int getCodServicio() {
        return codServicio;
    }

    public void setCodServicio(int codServicio) {
        this.codServicio = codServicio;
    }

    public double getValEmpleado() {
        return valEmpleado;
    }

    public void setValEmpleado(double valEmpleado) {
        this.valEmpleado = valEmpleado;
    }

    public double getValEmpresa() {
        return valEmpresa;
    }

    public void setValEmpresa(double valEmpresa) {
        this.valEmpresa = valEmpresa;
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
        hash += (codFactura != null ? codFactura.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PrFacturacion)) {
            return false;
        }
        PrFacturacion other = (PrFacturacion) object;
        if ((this.codFactura == null && other.codFactura != null) || (this.codFactura != null && !this.codFactura.equals(other.codFactura))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.PrFacturacion[ codFactura=" + codFactura + " ]";
    }
    
}
