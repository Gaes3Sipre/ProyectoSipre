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
@Table(name = "Bi_Proveedores", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codProveedor"})})
@NamedQueries({
    @NamedQuery(name = "BiProveedor.findAll", query = "SELECT b FROM BiProveedor b")
    , @NamedQuery(name = "BiProveedor.findByCodProveedor", query = "SELECT b FROM BiProveedor b WHERE b.codProveedor = :codProveedor")
    , @NamedQuery(name = "BiProveedor.findByTipProveedor", query = "SELECT b FROM BiProveedor b WHERE b.tipProveedor = :tipProveedor")
    , @NamedQuery(name = "BiProveedor.findByFecInicio", query = "SELECT b FROM BiProveedor b WHERE b.fecInicio = :fecInicio")
    , @NamedQuery(name = "BiProveedor.findByFecFinal", query = "SELECT b FROM BiProveedor b WHERE b.fecFinal = :fecFinal")
    , @NamedQuery(name = "BiProveedor.findByActUsuario", query = "SELECT b FROM BiProveedor b WHERE b.actUsuario = :actUsuario")
    , @NamedQuery(name = "BiProveedor.findByActEstado", query = "SELECT b FROM BiProveedor b WHERE b.actEstado = :actEstado")
    , @NamedQuery(name = "BiProveedor.findByActHora", query = "SELECT b FROM BiProveedor b WHERE b.actHora = :actHora")})
public class BiProveedor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codProveedor", nullable = false)
    private Integer codProveedor;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "tipProveedor", nullable = false, length = 1)
    private String tipProveedor;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecInicio", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fecInicio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecFinal", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fecFinal;
    @Basic(optional = false)
    @NotNull
    @Column(name = "actUsuario", nullable = false)
    private int actUsuario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "actEstado", nullable = false, length = 1)
    private String actEstado;
    @Basic(optional = false)
    @NotNull
    @Column(name = "actHora", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date actHora;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codProveedor")
    private List<Besolicitud> besolicitudList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "biProveedor")
    private List<BeTipobeneficio> beTipobeneficioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codProveedor")
    private List<PeDetallePresupuesto> peDetallePresupuestoList;

    public BiProveedor() {
    }

    public BiProveedor(Integer codProveedor) {
        this.codProveedor = codProveedor;
    }

    public BiProveedor(Integer codProveedor, String tipProveedor, Date fecInicio, Date fecFinal, int actUsuario, String actEstado, Date actHora) {
        this.codProveedor = codProveedor;
        this.tipProveedor = tipProveedor;
        this.fecInicio = fecInicio;
        this.fecFinal = fecFinal;
        this.actUsuario = actUsuario;
        this.actEstado = actEstado;
        this.actHora = actHora;
    }

    public Integer getCodProveedor() {
        return codProveedor;
    }

    public void setCodProveedor(Integer codProveedor) {
        this.codProveedor = codProveedor;
    }

    public String getTipProveedor() {
        return tipProveedor;
    }

    public void setTipProveedor(String tipProveedor) {
        this.tipProveedor = tipProveedor;
    }

    public Date getFecInicio() {
        return fecInicio;
    }

    public void setFecInicio(Date fecInicio) {
        this.fecInicio = fecInicio;
    }

    public Date getFecFinal() {
        return fecFinal;
    }

    public void setFecFinal(Date fecFinal) {
        this.fecFinal = fecFinal;
    }

    public int getActUsuario() {
        return actUsuario;
    }

    public void setActUsuario(int actUsuario) {
        this.actUsuario = actUsuario;
    }

    public String getActEstado() {
        return actEstado;
    }

    public void setActEstado(String actEstado) {
        this.actEstado = actEstado;
    }

    public Date getActHora() {
        return actHora;
    }

    public void setActHora(Date actHora) {
        this.actHora = actHora;
    }

    public List<Besolicitud> getBesolicitudList() {
        return besolicitudList;
    }

    public void setBesolicitudList(List<Besolicitud> besolicitudList) {
        this.besolicitudList = besolicitudList;
    }

    public List<BeTipobeneficio> getBeTipobeneficioList() {
        return beTipobeneficioList;
    }

    public void setBeTipobeneficioList(List<BeTipobeneficio> beTipobeneficioList) {
        this.beTipobeneficioList = beTipobeneficioList;
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
        hash += (codProveedor != null ? codProveedor.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BiProveedor)) {
            return false;
        }
        BiProveedor other = (BiProveedor) object;
        if ((this.codProveedor == null && other.codProveedor != null) || (this.codProveedor != null && !this.codProveedor.equals(other.codProveedor))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.BiProveedor[ codProveedor=" + codProveedor + " ]";
    }
    
}
