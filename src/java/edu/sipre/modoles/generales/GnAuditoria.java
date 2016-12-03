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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author alejozepol
 */
@Entity
@Table(name = "Gn_Auditoria")
@NamedQueries({
    @NamedQuery(name = "GnAuditoria.findAll", query = "SELECT g FROM GnAuditoria g")
    , @NamedQuery(name = "GnAuditoria.findByCodAuditoria", query = "SELECT g FROM GnAuditoria g WHERE g.codAuditoria = :codAuditoria")
    , @NamedQuery(name = "GnAuditoria.findByFecha", query = "SELECT g FROM GnAuditoria g WHERE g.fecha = :fecha")
    , @NamedQuery(name = "GnAuditoria.findByTipoModificacion", query = "SELECT g FROM GnAuditoria g WHERE g.tipoModificacion = :tipoModificacion")
    , @NamedQuery(name = "GnAuditoria.findByUsuario", query = "SELECT g FROM GnAuditoria g WHERE g.usuario = :usuario")
    , @NamedQuery(name = "GnAuditoria.findByTabla", query = "SELECT g FROM GnAuditoria g WHERE g.tabla = :tabla")
    , @NamedQuery(name = "GnAuditoria.findByTipTercero", query = "SELECT g FROM GnAuditoria g WHERE g.tipTercero = :tipTercero")
    , @NamedQuery(name = "GnAuditoria.findByCodTercero", query = "SELECT g FROM GnAuditoria g WHERE g.codTercero = :codTercero")
    , @NamedQuery(name = "GnAuditoria.findByTipIdentificacion", query = "SELECT g FROM GnAuditoria g WHERE g.tipIdentificacion = :tipIdentificacion")
    , @NamedQuery(name = "GnAuditoria.findByDesTercero", query = "SELECT g FROM GnAuditoria g WHERE g.desTercero = :desTercero")
    , @NamedQuery(name = "GnAuditoria.findByDescripcion", query = "SELECT g FROM GnAuditoria g WHERE g.descripcion = :descripcion")})
public class GnAuditoria implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "codAuditoria", nullable = false)
    private Integer codAuditoria;
    @Column(name = "fecha")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fecha;
    @Size(max = 10)
    @Column(name = "tipoModificacion", length = 10)
    private String tipoModificacion;
    @Size(max = 50)
    @Column(name = "usuario", length = 50)
    private String usuario;
    @Size(max = 50)
    @Column(name = "tabla", length = 50)
    private String tabla;
    @Size(max = 1)
    @Column(name = "tipTercero", length = 1)
    private String tipTercero;
    @Column(name = "codTercero")
    private Integer codTercero;
    @Size(max = 1)
    @Column(name = "TipIdentificacion", length = 1)
    private String tipIdentificacion;
    @Size(max = 2147483647)
    @Column(name = "DesTercero", length = 2147483647)
    private String desTercero;
    @Size(max = 2147483647)
    @Column(name = "descripcion", length = 2147483647)
    private String descripcion;

    public GnAuditoria() {
    }

    public GnAuditoria(Integer codAuditoria) {
        this.codAuditoria = codAuditoria;
    }

    public Integer getCodAuditoria() {
        return codAuditoria;
    }

    public void setCodAuditoria(Integer codAuditoria) {
        this.codAuditoria = codAuditoria;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getTipoModificacion() {
        return tipoModificacion;
    }

    public void setTipoModificacion(String tipoModificacion) {
        this.tipoModificacion = tipoModificacion;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getTabla() {
        return tabla;
    }

    public void setTabla(String tabla) {
        this.tabla = tabla;
    }

    public String getTipTercero() {
        return tipTercero;
    }

    public void setTipTercero(String tipTercero) {
        this.tipTercero = tipTercero;
    }

    public Integer getCodTercero() {
        return codTercero;
    }

    public void setCodTercero(Integer codTercero) {
        this.codTercero = codTercero;
    }

    public String getTipIdentificacion() {
        return tipIdentificacion;
    }

    public void setTipIdentificacion(String tipIdentificacion) {
        this.tipIdentificacion = tipIdentificacion;
    }

    public String getDesTercero() {
        return desTercero;
    }

    public void setDesTercero(String desTercero) {
        this.desTercero = desTercero;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codAuditoria != null ? codAuditoria.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GnAuditoria)) {
            return false;
        }
        GnAuditoria other = (GnAuditoria) object;
        if ((this.codAuditoria == null && other.codAuditoria != null) || (this.codAuditoria != null && !this.codAuditoria.equals(other.codAuditoria))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.sipre.modoles.GnAuditoria[ codAuditoria=" + codAuditoria + " ]";
    }
    
}
