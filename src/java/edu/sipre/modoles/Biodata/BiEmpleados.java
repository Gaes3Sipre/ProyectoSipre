/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.Biodata;

import edu.sipre.modoles.generales.GnMunicipio;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
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
@Table(name = "Bi_Empleados", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codEmpleado"})})
@NamedQueries({
    @NamedQuery(name = "BiEmpleados.findAll", query = "SELECT b FROM BiEmpleados b")
    , @NamedQuery(name = "BiEmpleados.findByCodEmpleado", query = "SELECT b FROM BiEmpleados b WHERE b.biEmpleadosPK.codEmpleado = :codEmpleado")
    , @NamedQuery(name = "BiEmpleados.findByNumContrato", query = "SELECT b FROM BiEmpleados b WHERE b.biEmpleadosPK.numContrato = :numContrato")
    , @NamedQuery(name = "BiEmpleados.findByFecNacimiento", query = "SELECT b FROM BiEmpleados b WHERE b.fecNacimiento = :fecNacimiento")
    , @NamedQuery(name = "BiEmpleados.findByTipContrato", query = "SELECT b FROM BiEmpleados b WHERE b.tipContrato = :tipContrato")
    , @NamedQuery(name = "BiEmpleados.findByFecInicioContrato", query = "SELECT b FROM BiEmpleados b WHERE b.fecInicioContrato = :fecInicioContrato")
    , @NamedQuery(name = "BiEmpleados.findByFecFinContrato", query = "SELECT b FROM BiEmpleados b WHERE b.fecFinContrato = :fecFinContrato")
    , @NamedQuery(name = "BiEmpleados.findBySueBasico", query = "SELECT b FROM BiEmpleados b WHERE b.sueBasico = :sueBasico")
    , @NamedQuery(name = "BiEmpleados.findByActUsuario", query = "SELECT b FROM BiEmpleados b WHERE b.actUsuario = :actUsuario")
    , @NamedQuery(name = "BiEmpleados.findByActEstado", query = "SELECT b FROM BiEmpleados b WHERE b.actEstado = :actEstado")
    , @NamedQuery(name = "BiEmpleados.findByActHora", query = "SELECT b FROM BiEmpleados b WHERE b.actHora = :actHora")})
public class BiEmpleados implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected BiEmpleadosPK biEmpleadosPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecNacimiento", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fecNacimiento;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "tipContrato", nullable = false, length = 1)
    private String tipContrato;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecInicioContrato", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fecInicioContrato;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecFinContrato", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fecFinContrato;
    @Basic(optional = false)
    @NotNull
    @Column(name = "sueBasico", nullable = false)
    private int sueBasico;
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
//    @OneToOne(cascade = CascadeType.ALL, mappedBy = "codEmpleado")
//    private BiBeneficiario biBeneficiario;
    @JoinColumn(name = "codEmpleado", referencedColumnName = "codTercero", nullable = false, insertable = false, updatable = false)
    @OneToOne(optional = false)
    private BiTercero biTercero;
    @JoinColumn(name = "munNacimiento", referencedColumnName = "codMunicipio", nullable = false)
    @ManyToOne(optional = false)
    private GnMunicipio munNacimiento;

    public BiEmpleados() {
    }

    public BiEmpleados(BiEmpleadosPK biEmpleadosPK) {
        this.biEmpleadosPK = biEmpleadosPK;
    }

    public BiEmpleados(BiEmpleadosPK biEmpleadosPK, Date fecNacimiento, String tipContrato, Date fecInicioContrato, Date fecFinContrato, int sueBasico, String actUsuario, String actEstado, Date actHora) {
        this.biEmpleadosPK = biEmpleadosPK;
        this.fecNacimiento = fecNacimiento;
        this.tipContrato = tipContrato;
        this.fecInicioContrato = fecInicioContrato;
        this.fecFinContrato = fecFinContrato;
        this.sueBasico = sueBasico;
        this.actUsuario = actUsuario;
        this.actEstado = actEstado;
        this.actHora = actHora;
    }

    public BiEmpleados(int codEmpleado, int numContrato) {
        this.biEmpleadosPK = new BiEmpleadosPK(codEmpleado, numContrato);
    }

    public BiEmpleadosPK getBiEmpleadosPK() {
        return biEmpleadosPK;
    }

    public void setBiEmpleadosPK(BiEmpleadosPK biEmpleadosPK) {
        this.biEmpleadosPK = biEmpleadosPK;
    }

    public Date getFecNacimiento() {
        return fecNacimiento;
    }

    public void setFecNacimiento(Date fecNacimiento) {
        this.fecNacimiento = fecNacimiento;
    }

    public String getTipContrato() {
        return tipContrato;
    }

    public void setTipContrato(String tipContrato) {
        this.tipContrato = tipContrato;
    }

    public Date getFecInicioContrato() {
        return fecInicioContrato;
    }

    public void setFecInicioContrato(Date fecInicioContrato) {
        this.fecInicioContrato = fecInicioContrato;
    }

    public Date getFecFinContrato() {
        return fecFinContrato;
    }

    public void setFecFinContrato(Date fecFinContrato) {
        this.fecFinContrato = fecFinContrato;
    }

    public int getSueBasico() {
        return sueBasico;
    }

    public void setSueBasico(int sueBasico) {
        this.sueBasico = sueBasico;
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

//    public BiBeneficiario getBiBeneficiario() {
//        return biBeneficiario;
//    }
//
//    public void setBiBeneficiario(BiBeneficiario biBeneficiario) {
//        this.biBeneficiario = biBeneficiario;
//    }

    public BiTercero getBiTercero() {
        return biTercero;
    }

    public void setBiTercero(BiTercero biTercero) {
        this.biTercero = biTercero;
    }

    public GnMunicipio getMunNacimiento() {
        return munNacimiento;
    }

    public void setMunNacimiento(GnMunicipio munNacimiento) {
        this.munNacimiento = munNacimiento;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (biEmpleadosPK != null ? biEmpleadosPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BiEmpleados)) {
            return false;
        }
        BiEmpleados other = (BiEmpleados) object;
        if ((this.biEmpleadosPK == null && other.biEmpleadosPK != null) || (this.biEmpleadosPK != null && !this.biEmpleadosPK.equals(other.biEmpleadosPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.BiEmpleados[ biEmpleadosPK=" + biEmpleadosPK + " ]";
    }
    
}
