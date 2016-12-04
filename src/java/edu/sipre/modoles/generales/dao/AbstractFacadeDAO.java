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
public abstract class AbstractFacadeDAO {
    
    public final static int MySQL = 0;
    public final static int SQL = 1;
    
    public static AbstractFacadeDAO getFacadeDAO(int type){
        switch(type){
//            case 0: return new FacadeMySQL();
            case 1: return new FacadeSQL();
        }
        return null;
    }
    
    public abstract UsuarioDAO getUsuarioDAO();
}
