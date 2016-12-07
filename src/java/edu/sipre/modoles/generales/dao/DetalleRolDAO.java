/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.generales.dao;

import edu.sipre.modoles.generales.GnDetalleRol;
import edu.sipre.modoles.generales.GnRol;
import java.sql.SQLException;
import java.util.List;


/**
 *
 * @author alejozepol
 */
public abstract class DetalleRolDAO implements DAO<Integer, GnDetalleRol>{
    
 public abstract List<String> buscarRolesUsuario(String codUsuario);

}
