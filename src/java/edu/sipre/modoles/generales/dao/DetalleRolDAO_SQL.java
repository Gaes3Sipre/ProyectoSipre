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
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

/**
 *
 * @author alejozepol
 */
public class DetalleRolDAO_SQL extends DetalleRolDAO {

    
    @Override
    public List<String> buscarRolesUsuario(String codUsuario) {
        EntityManager em = Persistence.createEntityManagerFactory("SiprePU").createEntityManager();
        TypedQuery<GnDetalleRol> queryDetalleRol = em.createNamedQuery("GnDetalleRol.RolesUsuario", GnDetalleRol.class);
        queryDetalleRol.setParameter("codUsuario", codUsuario);
        List<GnRol> resultado = (List<GnRol>) queryDetalleRol.getSingleResult().getGnRol();
        List<String> nombreRoles = new ArrayList<>();

        for (int i = 0; resultado.size() <= i; i++) {
            nombreRoles.add(resultado.get(i).getNomRol());

        }
        return nombreRoles;
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
