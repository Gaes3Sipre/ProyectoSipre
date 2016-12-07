/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.Biodata;

import edu.sipre.modoles.generales.GnTipoIdentificacion;
import edu.sipre.modoles.beneficios.Besolicitud;
import edu.sipre.modoles.generales.GnDocAdjunto;
import edu.sipre.modoles.generales.GnMunicipio;
import edu.sipre.modoles.generales.GnUsuario;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
@Table(name = "Bi_Terceros", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codTercero"})})
@NamedQueries({
    @NamedQuery(name = "BiTercero.findAll", query = "SELECT b FROM BiTercero b")
    , @NamedQuery(name = "BiTercero.findByCodTercero", query = "SELECT b FROM BiTercero b WHERE b.codTercero = :codTercero")
    , @NamedQuery(name = "BiTercero.findByTipTercero", query = "SELECT b FROM BiTercero b WHERE b.tipTercero = :tipTercero")
    , @NamedQuery(name = "BiTercero.findByPriNombre", query = "SELECT b FROM BiTercero b WHERE b.priNombre = :priNombre")
    , @NamedQuery(name = "BiTercero.findBySegNombre", query = "SELECT b FROM BiTercero b WHERE b.segNombre = :segNombre")
    , @NamedQuery(name = "BiTercero.findByPriApellido", query = "SELECT b FROM BiTercero b WHERE b.priApellido = :priApellido")
    , @NamedQuery(name = "BiTercero.findBySegApellido", query = "SELECT b FROM BiTercero b WHERE b.segApellido = :segApellido")
    , @NamedQuery(name = "BiTercero.findByIndActividad", query = "SELECT b FROM BiTercero b WHERE b.indActividad = :indActividad")
    , @NamedQuery(name = "BiTercero.findByDirResidencia", query = "SELECT b FROM BiTercero b WHERE b.dirResidencia = :dirResidencia")
    , @NamedQuery(name = "BiTercero.findByTelResidencia", query = "SELECT b FROM BiTercero b WHERE b.telResidencia = :telResidencia")
    , @NamedQuery(name = "BiTercero.findByCorElectronico", query = "SELECT b FROM BiTercero b WHERE b.corElectronico = :corElectronico")
    , @NamedQuery(name = "BiTercero.findByActUsuario", query = "SELECT b FROM BiTercero b WHERE b.actUsuario = :actUsuario")
    , @NamedQuery(name = "BiTercero.findByActEsta", query = "SELECT b FROM BiTercero b WHERE b.actEsta = :actEsta")
    , @NamedQuery(name = "BiTercero.findByActHora", query = "SELECT b FROM BiTercero b WHERE b.actHora = :actHora")})
public class BiTercero implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codTercero", nullable = false)
    private Integer codTercero;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "tipTercero", nullable = false, length = 1)
    private String tipTercero;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "priNombre", nullable = false, length = 20)
    private String priNombre;
    @Size(max = 20)
    @Column(name = "segNombre", length = 20)
    private String segNombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "priApellido", nullable = false, length = 20)
    private String priApellido;
    @Size(max = 20)
    @Column(name = "segApellido", length = 20)
    private String segApellido;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "indActividad", nullable = false, length = 1)
    private String indActividad;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "dirResidencia", nullable = false, length = 15)
    private String dirResidencia;
    @Basic(optional = false)
    @NotNull
    @Column(name = "telResidencia", nullable = false)
    private int telResidencia;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "corElectronico", nullable = false, length = 45)
    private String corElectronico;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "actUsuario", nullable = false, length = 15)
    private String actUsuario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "actEsta", nullable = false, length = 1)
    private String actEsta;
    @Basic(optional = false)
    @NotNull
    @Column(name = "actHora", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date actHora;
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codTomador")
//    private List<Besolicitud> besolicitudList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codTercero")
    private List<GnUsuario> gnUsuarioList;
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "biTercero")
//    private List<GnDocAdjunto> gnDocAdjuntoList;
    @JoinColumn(name = "codMunicipio", referencedColumnName = "codMunicipio", nullable = false)
    @ManyToOne(optional = false)
    private GnMunicipio codMunicipio;
//    @JoinColumn(name = "tipIdentificacion", referencedColumnName = "codTipoIdentificacion", nullable = false)
//    @ManyToOne(optional = false)
//    private GnTipoIdentificacion tipIdentificacion;
//    @OneToOne(cascade = CascadeType.ALL, mappedBy = "biTercero")
//    private BiEmpleados biEmpleados;

    public BiTercero() {
    }

    public BiTercero(Integer codTercero) {
        this.codTercero = codTercero;
    }

    public BiTercero(Integer codTercero, String tipTercero, String priNombre, String priApellido, String indActividad, String dirResidencia, int telResidencia, String corElectronico, String actUsuario, String actEsta, Date actHora) {
        this.codTercero = codTercero;
        this.tipTercero = tipTercero;
        this.priNombre = priNombre;
        this.priApellido = priApellido;
        this.indActividad = indActividad;
        this.dirResidencia = dirResidencia;
        this.telResidencia = telResidencia;
        this.corElectronico = corElectronico;
        this.actUsuario = actUsuario;
        this.actEsta = actEsta;
        this.actHora = actHora;
    }

    public Integer getCodTercero() {
        return codTercero;
    }

    public void setCodTercero(Integer codTercero) {
        this.codTercero = codTercero;
    }

    public String getTipTercero() {
        return tipTercero;
    }

    public void setTipTercero(String tipTercero) {
        this.tipTercero = tipTercero;
    }

    public String getPriNombre() {
        return priNombre;
    }

    public void setPriNombre(String priNombre) {
        this.priNombre = priNombre;
    }

    public String getSegNombre() {
        return segNombre;
    }

    public void setSegNombre(String segNombre) {
        this.segNombre = segNombre;
    }

    public String getPriApellido() {
        return priApellido;
    }

    public void setPriApellido(String priApellido) {
        this.priApellido = priApellido;
    }

    public String getSegApellido() {
        return segApellido;
    }

    public void setSegApellido(String segApellido) {
        this.segApellido = segApellido;
    }

    public String getIndActividad() {
        return indActividad;
    }

    public void setIndActividad(String indActividad) {
        this.indActividad = indActividad;
    }

    public String getDirResidencia() {
        return dirResidencia;
    }

    public void setDirResidencia(String dirResidencia) {
        this.dirResidencia = dirResidencia;
    }

    public int getTelResidencia() {
        return telResidencia;
    }

    public void setTelResidencia(int telResidencia) {
        this.telResidencia = telResidencia;
    }

    public String getCorElectronico() {
        return corElectronico;
    }

    public void setCorElectronico(String corElectronico) {
        this.corElectronico = corElectronico;
    }

    public String getActUsuario() {
        return actUsuario;
    }

    public void setActUsuario(String actUsuario) {
        this.actUsuario = actUsuario;
    }

    public String getActEsta() {
        return actEsta;
    }

    public void setActEsta(String actEsta) {
        this.actEsta = actEsta;
    }

    public Date getActHora() {
        return actHora;
    }

    public void setActHora(Date actHora) {
        this.actHora = actHora;
    }

//    public List<Besolicitud> getBesolicitudList() {
//        return besolicitudList;
//    }
//
//    public void setBesolicitudList(List<Besolicitud> besolicitudList) {
//        this.besolicitudList = besolicitudList;
//    }

    public List<GnUsuario> getGnUsuarioList() {
        return gnUsuarioList;
    }

    public void setGnUsuarioList(List<GnUsuario> gnUsuarioList) {
        this.gnUsuarioList = gnUsuarioList;
    }
//
//    public List<GnDocAdjunto> getGnDocAdjuntoList() {
//        return gnDocAdjuntoList;
//    }
//
//    public void setGnDocAdjuntoList(List<GnDocAdjunto> gnDocAdjuntoList) {
//        this.gnDocAdjuntoList = gnDocAdjuntoList;
//    }

    public GnMunicipio getCodMunicipio() {
        return codMunicipio;
    }

    public void setCodMunicipio(GnMunicipio codMunicipio) {
        this.codMunicipio = codMunicipio;
    }

//    public GnTipoIdentificacion getTipIdentificacion() {
//        return tipIdentificacion;
//    }
//
//    public void setTipIdentificacion(GnTipoIdentificacion tipIdentificacion) {
//        this.tipIdentificacion = tipIdentificacion;
//    }
//
//    public BiEmpleados getBiEmpleados() {
//        return biEmpleados;
//    }
//
//    public void setBiEmpleados(BiEmpleados biEmpleados) {
//        this.biEmpleados = biEmpleados;
//    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codTercero != null ? codTercero.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BiTercero)) {
            return false;
        }
        BiTercero other = (BiTercero) object;
        if ((this.codTercero == null && other.codTercero != null) || (this.codTercero != null && !this.codTercero.equals(other.codTercero))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.BiTercero[ codTercero=" + codTercero + " ]";
    }
    
}
