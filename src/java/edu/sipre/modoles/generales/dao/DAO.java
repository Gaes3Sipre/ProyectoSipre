/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.generales.dao;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Ismael
 */
public interface DAO<PK,E> {
    
    public E buscarPorPK(PK pk);
    public List<E> buscarTodos();
    public int contar();
    public void registrar(E o) throws SQLException;
    public boolean actualizar(E o);
    public boolean eliminar(PK pk);
    
}
