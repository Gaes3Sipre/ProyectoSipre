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
@Table(name = "Gn_Municipios", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codMunicipio"})})
@NamedQueries({
    @NamedQuery(name = "GnMunicipio.findAll", query = "SELECT g FROM GnMunicipio g")
    , @NamedQuery(name = "GnMunicipio.findByCodMunicipio", query = "SELECT g FROM GnMunicipio g WHERE g.codMunicipio = :codMunicipio")
    , @NamedQuery(name = "GnMunicipio.findByCodSuip", query = "SELECT g FROM GnMunicipio g WHERE g.codSuip = :codSuip")
    , @NamedQuery(name = "GnMunicipio.findByNomMunicipio", query = "SELECT g FROM GnMunicipio g WHERE g.nomMunicipio = :nomMunicipio")
    , @NamedQuery(name = "GnMunicipio.findByUsuActividad", query = "SELECT g FROM GnMunicipio g WHERE g.usuActividad = :usuActividad")
    , @NamedQuery(name = "GnMunicipio.findByTipActividad", query = "SELECT g FROM GnMunicipio g WHERE g.tipActividad = :tipActividad")
    , @NamedQuery(name = "GnMunicipio.findByHorActividad", query = "SELECT g FROM GnMunicipio g WHERE g.horActividad = :horActividad")})
public class GnMunicipio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codMunicipio", nullable = false)
    private Integer codMunicipio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "codSuip", nullable = false)
    private int codSuip;
    @Size(max = 30)
    @Column(name = "nomMunicipio", length = 30)
    private String nomMunicipio;
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "munNacimiento")
    private List<BiBeneficiario> biBeneficiarioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codMunicipio")
    private List<BiTercero> biTerceroList;
    @JoinColumn(name = "codDepartamento", referencedColumnName = "codDepartamento", nullable = false)
    @ManyToOne(optional = false)
    private GnDepartamento codDepartamento;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "munNacimiento")
    private List<BiEmpleados> biEmpleadosList;

    public GnMunicipio() {
    }

    public GnMunicipio(Integer codMunicipio) {
        this.codMunicipio = codMunicipio;
    }

    public GnMunicipio(Integer codMunicipio, int codSuip, String usuActividad, String tipActividad, Date horActividad) {
        this.codMunicipio = codMunicipio;
        this.codSuip = codSuip;
        this.usuActividad = usuActividad;
        this.tipActividad = tipActividad;
        this.horActividad = horActividad;
    }

    public Integer getCodMunicipio() {
        return codMunicipio;
    }

    public void setCodMunicipio(Integer codMunicipio) {
        this.codMunicipio = codMunicipio;
    }

    public int getCodSuip() {
        return codSuip;
    }

    public void setCodSuip(int codSuip) {
        this.codSuip = codSuip;
    }

    public String getNomMunicipio() {
        return nomMunicipio;
    }

    public void setNomMunicipio(String nomMunicipio) {
        this.nomMunicipio = nomMunicipio;
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

    public List<BiBeneficiario> getBiBeneficiarioList() {
        return biBeneficiarioList;
    }

    public void setBiBeneficiarioList(List<BiBeneficiario> biBeneficiarioList) {
        this.biBeneficiarioList = biBeneficiarioList;
    }

    public List<BiTercero> getBiTerceroList() {
        return biTerceroList;
    }

    public void setBiTerceroList(List<BiTercero> biTerceroList) {
        this.biTerceroList = biTerceroList;
    }

    public GnDepartamento getCodDepartamento() {
        return codDepartamento;
    }

    public void setCodDepartamento(GnDepartamento codDepartamento) {
        this.codDepartamento = codDepartamento;
    }

    public List<BiEmpleados> getBiEmpleadosList() {
        return biEmpleadosList;
    }

    public void setBiEmpleadosList(List<BiEmpleados> biEmpleadosList) {
        this.biEmpleadosList = biEmpleadosList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codMunicipio != null ? codMunicipio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnMunicipio)) {
            return false;
        }
        GnMunicipio other = (GnMunicipio) object;
        if ((this.codMunicipio == null && other.codMunicipio != null) || (this.codMunicipio != null && !this.codMunicipio.equals(other.codMunicipio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnMunicipio[ codMunicipio=" + codMunicipio + " ]";
    }
    
}
