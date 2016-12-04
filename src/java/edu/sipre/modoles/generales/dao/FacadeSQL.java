/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.modoles.generales.dao;

/**
 *
 * @author SENA
 */
public class FacadeSQL extends AbstractFacadeDAO{

    @Override
    public UsuarioDAO getUsuarioDAO() {
        return new UsuarioDAO_SQL();
    }

    
}
