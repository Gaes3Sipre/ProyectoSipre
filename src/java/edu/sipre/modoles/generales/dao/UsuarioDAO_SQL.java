/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.generales.dao;

import edu.sipre.modoles.generales.GnUsuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

/**
 *
 * @author Ismael
 */
public class UsuarioDAO_SQL extends UsuarioDAO {

    @Override
    public GnUsuario login(String usuario, String clave) {
        EntityManager em = Persistence.createEntityManagerFactory("SiprePU").createEntityManager();
//         GnUsuario usuario = null;
        TypedQuery<GnUsuario> queryUSuario = em.createNamedQuery("GnUsuario.loguin", GnUsuario.class);
        queryUSuario.setParameter("codUsuario", usuario);
        queryUSuario.setParameter("clave", clave);
        List<GnUsuario> resultado = queryUSuario.getResultList();
        if (resultado.size() == 1) {
            return resultado.get(0);
        }
        return null;

    }

    @Override
    public GnUsuario buscarPorPK(Integer pk) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<GnUsuario> buscarTodos() {
        EntityManager em = Persistence.createEntityManagerFactory("SiprePU").createEntityManager();
//         GnUsuario usuario = null;
        TypedQuery<GnUsuario> queryUSuario = em.createNamedQuery("GnUsuario.findAll", GnUsuario.class);
        List<GnUsuario> resultado = queryUSuario.getResultList();
        
    return resultado;
    }

    @Override
    public int contar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void registrar(GnUsuario o) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizar(GnUsuario o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Integer pk) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}
