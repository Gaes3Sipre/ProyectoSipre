/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sipre.modelo.generales;

/**
 *
 * @author alejozepol
 */
public class ProgramasDTO {
    
    private int codPrograma;
    private String nomPrograma;
    private String dirProgama;

    public ProgramasDTO(int codPrograma, String nomPrograma, String dirProgama) {
        this.codPrograma = codPrograma;
        this.nomPrograma = nomPrograma;
        this.dirProgama = dirProgama;
    }

    public int getCodPrograma() {
        return codPrograma;
    }

    public void setCodPrograma(int codPrograma) {
        this.codPrograma = codPrograma;
    }

    public String getNomPrograma() {
        return nomPrograma;
    }

     public void setNomPrograma(String nomPrograma) {
        this.nomPrograma = nomPrograma;
    }

    public String getDirProgama() {
        return dirProgama;
    }

    public void setDirProgama(String dirProgama) {
        this.dirProgama = dirProgama;
    }
    
    
}
