/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.generales.dao;

import edu.sipre.modoles.generales.GnUsuario;



/**
 *
 * @author Ismael
 */
public abstract class UsuarioDAO implements DAO<Integer, GnUsuario>{
    
    public abstract GnUsuario login(String usuario, String clave);
   
    
}
