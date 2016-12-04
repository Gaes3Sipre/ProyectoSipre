/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.beneficios;

import edu.sipre.modoles.BiProveedor;
import edu.sipre.modoles.PrValoresServicio;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "Be_Tipobeneficios", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codServicio"})})
@NamedQueries({
    @NamedQuery(name = "BeTipobeneficio.findAll", query = "SELECT b FROM BeTipobeneficio b")
    , @NamedQuery(name = "BeTipobeneficio.findByCodServicio", query = "SELECT b FROM BeTipobeneficio b WHERE b.beTipobeneficioPK.codServicio = :codServicio")
    , @NamedQuery(name = "BeTipobeneficio.findByCodProveedor", query = "SELECT b FROM BeTipobeneficio b WHERE b.beTipobeneficioPK.codProveedor = :codProveedor")
    , @NamedQuery(name = "BeTipobeneficio.findByCodTipoServicio", query = "SELECT b FROM BeTipobeneficio b WHERE b.beTipobeneficioPK.codTipoServicio = :codTipoServicio")
    , @NamedQuery(name = "BeTipobeneficio.findByTipContrato", query = "SELECT b FROM BeTipobeneficio b WHERE b.beTipobeneficioPK.tipContrato = :tipContrato")
    , @NamedQuery(name = "BeTipobeneficio.findByIndActividad", query = "SELECT b FROM BeTipobeneficio b WHERE b.indActividad = :indActividad")
    , @NamedQuery(name = "BeTipobeneficio.findByIndPrescipciones", query = "SELECT b FROM BeTipobeneficio b WHERE b.indPrescipciones = :indPrescipciones")
    , @NamedQuery(name = "BeTipobeneficio.findByPorEmpleado", query = "SELECT b FROM BeTipobeneficio b WHERE b.porEmpleado = :porEmpleado")
    , @NamedQuery(name = "BeTipobeneficio.findByPorEmpresa", query = "SELECT b FROM BeTipobeneficio b WHERE b.porEmpresa = :porEmpresa")
    , @NamedQuery(name = "BeTipobeneficio.findByActUsuario", query = "SELECT b FROM BeTipobeneficio b WHERE b.actUsuario = :actUsuario")
    , @NamedQuery(name = "BeTipobeneficio.findByActEstado", query = "SELECT b FROM BeTipobeneficio b WHERE b.actEstado = :actEstado")
    , @NamedQuery(name = "BeTipobeneficio.findByActHora", query = "SELECT b FROM BeTipobeneficio b WHERE b.actHora = :actHora")})
public class BeTipobeneficio implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected BeTipobeneficioPK beTipobeneficioPK;
    @Size(max = 1)
    @Column(name = "indActividad", length = 1)
    private String indActividad;
    @Size(max = 1)
    @Column(name = "indPrescipciones", length = 1)
    private String indPrescipciones;
    @Basic(optional = false)
    @NotNull
    @Column(name = "porEmpleado", nullable = false)
    private double porEmpleado;
    @Basic(optional = false)
    @NotNull
    @Column(name = "porEmpresa", nullable = false)
    private double porEmpresa;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "actUsuario", nullable = false, length = 15)
    private String actUsuario;
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codservicios")
    private List<Besolicitud> besolicitudList;
    @JoinColumn(name = "codTipoServicio", referencedColumnName = "codTipoServicio", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private BeTipoServicio beTipoServicio;
    @JoinColumn(name = "codProveedor", referencedColumnName = "codProveedor", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private BiProveedor biProveedor;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipBeneficio")
    private List<PrValoresServicio> prValoresServicioList;

    public BeTipobeneficio() {
    }

    public BeTipobeneficio(BeTipobeneficioPK beTipobeneficioPK) {
        this.beTipobeneficioPK = beTipobeneficioPK;
    }

    public BeTipobeneficio(BeTipobeneficioPK beTipobeneficioPK, double porEmpleado, double porEmpresa, String actUsuario, String actEstado, Date actHora) {
        this.beTipobeneficioPK = beTipobeneficioPK;
        this.porEmpleado = porEmpleado;
        this.porEmpresa = porEmpresa;
        this.actUsuario = actUsuario;
        this.actEstado = actEstado;
        this.actHora = actHora;
    }

    public BeTipobeneficio(int codServicio, int codProveedor, int codTipoServicio, String tipContrato) {
        this.beTipobeneficioPK = new BeTipobeneficioPK(codServicio, codProveedor, codTipoServicio, tipContrato);
    }

    public BeTipobeneficioPK getBeTipobeneficioPK() {
        return beTipobeneficioPK;
    }

    public void setBeTipobeneficioPK(BeTipobeneficioPK beTipobeneficioPK) {
        this.beTipobeneficioPK = beTipobeneficioPK;
    }

    public String getIndActividad() {
        return indActividad;
    }

    public void setIndActividad(String indActividad) {
        this.indActividad = indActividad;
    }

    public String getIndPrescipciones() {
        return indPrescipciones;
    }

    public void setIndPrescipciones(String indPrescipciones) {
        this.indPrescipciones = indPrescipciones;
    }

    public double getPorEmpleado() {
        return porEmpleado;
    }

    public void setPorEmpleado(double porEmpleado) {
        this.porEmpleado = porEmpleado;
    }

    public double getPorEmpresa() {
        return porEmpresa;
    }

    public void setPorEmpresa(double porEmpresa) {
        this.porEmpresa = porEmpresa;
    }

    public String getActUsuario() {
        return actUsuario;
    }

    public void setActUsuario(String actUsuario) {
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

    public BeTipoServicio getBeTipoServicio() {
        return beTipoServicio;
    }

    public void setBeTipoServicio(BeTipoServicio beTipoServicio) {
        this.beTipoServicio = beTipoServicio;
    }

    public BiProveedor getBiProveedor() {
        return biProveedor;
    }

    public void setBiProveedor(BiProveedor biProveedor) {
        this.biProveedor = biProveedor;
    }

    public List<PrValoresServicio> getPrValoresServicioList() {
        return prValoresServicioList;
    }

    public void setPrValoresServicioList(List<PrValoresServicio> prValoresServicioList) {
        this.prValoresServicioList = prValoresServicioList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (beTipobeneficioPK != null ? beTipobeneficioPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BeTipobeneficio)) {
            return false;
        }
        BeTipobeneficio other = (BeTipobeneficio) object;
        if ((this.beTipobeneficioPK == null && other.beTipobeneficioPK != null) || (this.beTipobeneficioPK != null && !this.beTipobeneficioPK.equals(other.beTipobeneficioPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.BeTipobeneficio[ beTipobeneficioPK=" + beTipobeneficioPK + " ]";
    }
    
}
