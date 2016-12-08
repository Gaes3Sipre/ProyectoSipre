/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.generales.dao;

import edu.sipre.modoles.generales.GnDetalleRol;
import edu.sipre.modoles.generales.GnRol;
import edu.sipre.modoles.generales.GnUsuario;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author alejozepol
 */
public class DetalleRolDAO_SQL extends DetalleRolDAO {

    @Override
    public List<GnDetalleRol> buscarRolesUsuario(String codUsuario) {
        EntityManager em = Persistence.createEntityManagerFactory("SiprePU").createEntityManager();
        
        TypedQuery<GnUsuario> queryUSuario = em.createNamedQuery("GnUsuario.codUsuario", GnUsuario.class);
        queryUSuario.setParameter("codUsuario", codUsuario);
        GnUsuario usuario = queryUSuario.getSingleResult();
        
        TypedQuery<GnDetalleRol> queryDRol = em.createNamedQuery("GnDetalleRol.codUsuario", GnDetalleRol.class);
        queryDRol.setParameter("codUsuario", usuario);
        List<GnDetalleRol> detalleRol = queryDRol.getResultList();
 
        return  detalleRol;
    }

    @Override
    public GnDetalleRol buscarPorPK(Integer pk) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<GnDetalleRol> buscarTodos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int contar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void registrar(GnDetalleRol o) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizar(GnDetalleRol o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Integer pk) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
