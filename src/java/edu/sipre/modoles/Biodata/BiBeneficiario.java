/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.Biodata;

import edu.sipre.modoles.BeTipoServicio;
import edu.sipre.modoles.GnMunicipio;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;

/**
 *
 * @author alejozepol
 */
@Entity
@Table(name = "Bi_Beneficiarios", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codBeneficiario"})
    , @UniqueConstraint(columnNames = {"codEmpleado"})})
@NamedQueries({
    @NamedQuery(name = "BiBeneficiario.findAll", query = "SELECT b FROM BiBeneficiario b")
    , @NamedQuery(name = "BiBeneficiario.findByCodBeneficiario", query = "SELECT b FROM BiBeneficiario b WHERE b.codBeneficiario = :codBeneficiario")
    , @NamedQuery(name = "BiBeneficiario.findByFecNacimiento", query = "SELECT b FROM BiBeneficiario b WHERE b.fecNacimiento = :fecNacimiento")
    , @NamedQuery(name = "BiBeneficiario.findByFecInicioContrato", query = "SELECT b FROM BiBeneficiario b WHERE b.fecInicioContrato = :fecInicioContrato")
    , @NamedQuery(name = "BiBeneficiario.findByFecFinContrato", query = "SELECT b FROM BiBeneficiario b WHERE b.fecFinContrato = :fecFinContrato")
    , @NamedQuery(name = "BiBeneficiario.findByActUsuario", query = "SELECT b FROM BiBeneficiario b WHERE b.actUsuario = :actUsuario")
    , @NamedQuery(name = "BiBeneficiario.findByActHora", query = "SELECT b FROM BiBeneficiario b WHERE b.actHora = :actHora")})
public class BiBeneficiario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codBeneficiario", nullable = false)
    private Integer codBeneficiario;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecNacimiento", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fecNacimiento;
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
    @Column(name = "actUsuario", nullable = false)
    private int actUsuario;
    @Basic(optional = false)
    @NotNull
    @Column(name = "actHora", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date actHora;
    @JoinColumn(name = "tipBeneficiario", referencedColumnName = "codTipoServicio")
    @ManyToOne
    private BeTipoServicio tipBeneficiario;
    @JoinColumn(name = "codEmpleado", referencedColumnName = "codEmpleado", nullable = false)
    @OneToOne(optional = false)
    private BiEmpleados codEmpleado;
    @JoinColumn(name = "munNacimiento", referencedColumnName = "codMunicipio", nullable = false)
    @ManyToOne(optional = false)
    private GnMunicipio munNacimiento;

    public BiBeneficiario() {
    }

    public BiBeneficiario(Integer codBeneficiario) {
        this.codBeneficiario = codBeneficiario;
    }

    public BiBeneficiario(Integer codBeneficiario, Date fecNacimiento, Date fecInicioContrato, Date fecFinContrato, int actUsuario, Date actHora) {
        this.codBeneficiario = codBeneficiario;
        this.fecNacimiento = fecNacimiento;
        this.fecInicioContrato = fecInicioContrato;
        this.fecFinContrato = fecFinContrato;
        this.actUsuario = actUsuario;
        this.actHora = actHora;
    }

    public Integer getCodBeneficiario() {
        return codBeneficiario;
    }

    public void setCodBeneficiario(Integer codBeneficiario) {
        this.codBeneficiario = codBeneficiario;
    }

    public Date getFecNacimiento() {
        return fecNacimiento;
    }

    public void setFecNacimiento(Date fecNacimiento) {
        this.fecNacimiento = fecNacimiento;
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

    public int getActUsuario() {
        return actUsuario;
    }

    public void setActUsuario(int actUsuario) {
        this.actUsuario = actUsuario;
    }

    public Date getActHora() {
        return actHora;
    }

    public void setActHora(Date actHora) {
        this.actHora = actHora;
    }

    public BeTipoServicio getTipBeneficiario() {
        return tipBeneficiario;
    }

    public void setTipBeneficiario(BeTipoServicio tipBeneficiario) {
        this.tipBeneficiario = tipBeneficiario;
    }

    public BiEmpleados getCodEmpleado() {
        return codEmpleado;
    }

    public void setCodEmpleado(BiEmpleados codEmpleado) {
        this.codEmpleado = codEmpleado;
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
        hash += (codBeneficiario != null ? codBeneficiario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BiBeneficiario)) {
            return false;
        }
        BiBeneficiario other = (BiBeneficiario) object;
        if ((this.codBeneficiario == null && other.codBeneficiario != null) || (this.codBeneficiario != null && !this.codBeneficiario.equals(other.codBeneficiario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.BiBeneficiario[ codBeneficiario=" + codBeneficiario + " ]";
    }
    
}
