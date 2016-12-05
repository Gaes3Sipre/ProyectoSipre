/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.beneficios;


import edu.sipre.modoles.Biodata.BiBeneficiario;
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
@Table(name = "Be_TipoServicios", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codTipoServicio"})})
@NamedQueries({
    @NamedQuery(name = "BeTipoServicio.findAll", query = "SELECT b FROM BeTipoServicio b")
    , @NamedQuery(name = "BeTipoServicio.findByCodTipoServicio", query = "SELECT b FROM BeTipoServicio b WHERE b.codTipoServicio = :codTipoServicio")
    , @NamedQuery(name = "BeTipoServicio.findByNomServicio", query = "SELECT b FROM BeTipoServicio b WHERE b.nomServicio = :nomServicio")
    , @NamedQuery(name = "BeTipoServicio.findByIndActividad", query = "SELECT b FROM BeTipoServicio b WHERE b.indActividad = :indActividad")
    , @NamedQuery(name = "BeTipoServicio.findByNatServicio", query = "SELECT b FROM BeTipoServicio b WHERE b.natServicio = :natServicio")
    , @NamedQuery(name = "BeTipoServicio.findByIndFactura", query = "SELECT b FROM BeTipoServicio b WHERE b.indFactura = :indFactura")
    , @NamedQuery(name = "BeTipoServicio.findByActUsuario", query = "SELECT b FROM BeTipoServicio b WHERE b.actUsuario = :actUsuario")
    , @NamedQuery(name = "BeTipoServicio.findByEstActividad", query = "SELECT b FROM BeTipoServicio b WHERE b.estActividad = :estActividad")
    , @NamedQuery(name = "BeTipoServicio.findByActHora", query = "SELECT b FROM BeTipoServicio b WHERE b.actHora = :actHora")})
public class BeTipoServicio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codTipoServicio", nullable = false)
    private Integer codTipoServicio;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "nomServicio", nullable = false, length = 20)
    private String nomServicio;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "indActividad", nullable = false, length = 1)
    private String indActividad;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "natServicio", nullable = false, length = 1)
    private String natServicio;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "indFactura", nullable = false, length = 1)
    private String indFactura;
    @Basic(optional = false)
    @NotNull
    @Column(name = "actUsuario", nullable = false)
    private int actUsuario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "estActividad", nullable = false, length = 1)
    private String estActividad;
    @Basic(optional = false)
    @NotNull
    @Column(name = "actHora", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date actHora;
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "beTipoServicio")
//    private List<BeTipobeneficio> beTipobeneficioList;
//    @OneToMany(mappedBy = "tipBeneficiario")
//    private List<BiBeneficiario> biBeneficiarioList;

    public BeTipoServicio() {
    }

    public BeTipoServicio(Integer codTipoServicio) {
        this.codTipoServicio = codTipoServicio;
    }

    public BeTipoServicio(Integer codTipoServicio, String nomServicio, String indActividad, String natServicio, String indFactura, int actUsuario, String estActividad, Date actHora) {
        this.codTipoServicio = codTipoServicio;
        this.nomServicio = nomServicio;
        this.indActividad = indActividad;
        this.natServicio = natServicio;
        this.indFactura = indFactura;
        this.actUsuario = actUsuario;
        this.estActividad = estActividad;
        this.actHora = actHora;
    }

    public Integer getCodTipoServicio() {
        return codTipoServicio;
    }

    public void setCodTipoServicio(Integer codTipoServicio) {
        this.codTipoServicio = codTipoServicio;
    }

    public String getNomServicio() {
        return nomServicio;
    }

    public void setNomServicio(String nomServicio) {
        this.nomServicio = nomServicio;
    }

    public String getIndActividad() {
        return indActividad;
    }

    public void setIndActividad(String indActividad) {
        this.indActividad = indActividad;
    }

    public String getNatServicio() {
        return natServicio;
    }

    public void setNatServicio(String natServicio) {
        this.natServicio = natServicio;
    }

    public String getIndFactura() {
        return indFactura;
    }

    public void setIndFactura(String indFactura) {
        this.indFactura = indFactura;
    }

    public int getActUsuario() {
        return actUsuario;
    }

    public void setActUsuario(int actUsuario) {
        this.actUsuario = actUsuario;
    }

    public String getEstActividad() {
        return estActividad;
    }

    public void setEstActividad(String estActividad) {
        this.estActividad = estActividad;
    }

    public Date getActHora() {
        return actHora;
    }

    public void setActHora(Date actHora) {
        this.actHora = actHora;
    }
//
//    public List<BeTipobeneficio> getBeTipobeneficioList() {
//        return beTipobeneficioList;
//    }
//
//    public void setBeTipobeneficioList(List<BeTipobeneficio> beTipobeneficioList) {
//        this.beTipobeneficioList = beTipobeneficioList;
//    }
//
//    public List<BiBeneficiario> getBiBeneficiarioList() {
//        return biBeneficiarioList;
//    }
//
//    public void setBiBeneficiarioList(List<BiBeneficiario> biBeneficiarioList) {
//        this.biBeneficiarioList = biBeneficiarioList;
//    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codTipoServicio != null ? codTipoServicio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BeTipoServicio)) {
            return false;
        }
        BeTipoServicio other = (BeTipoServicio) object;
        if ((this.codTipoServicio == null && other.codTipoServicio != null) || (this.codTipoServicio != null && !this.codTipoServicio.equals(other.codTipoServicio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.BeTipoServicio[ codTipoServicio=" + codTipoServicio + " ]";
    }
    
}
