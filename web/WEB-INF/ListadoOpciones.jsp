<%-- 
    Document   : ListadoOpciones
    Created on : 7/12/2016, 03:12:57 PM
    Author     : alejozepol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="theme-options-settings" class="theme-options">
    <div class="theme-options-panel layout-align-start-start layout-row">
        <div class="theme-options-panel-toggle"><i class="material-icons">settings</i></div>
        <div class="theme-options-list">
            <div class="theme-option">
                <div class="option-title">Lista de Opciones:</div>
                <div class="radio-group">
                    <label>
                        <input id="themeOpt1" class="switch switch-primary" type="checkbox" />
                        <span>Cabecera Oscura</span>
                    </label>
                    <label>
                        <input id="themeOpt2" class="switch switch-primary" type="checkbox" />
                        <span>Barra Oscura</span>
                    </label>
                    <label>
                        <input id="themeOpt3" class="switch switch-primary" type="checkbox" />
                        <span>Barra Lateral Oscura</span>
                    </label>
                    <label>
                        <input id="themeOpt4" class="switch switch-primary" type="checkbox" />
                        <span>Contraer Barra<small><abbr title="Experimental State"></abbr></small></span>
                    </label>
                    <label>
                        <input id="themeOpt5" class="switch switch-primary" type="checkbox" checked />
                        <span>Encabezado verde</span>
                    </label>

                    <label>
                        <input id="themeOpt6" class="switch switch-primary" type="checkbox" />
                        <span>Pie de Pagina Fija</span>
                    </label>
                    <label>
                        <input id="themeOpt7" class="switch switch-success" type="checkbox" />
                        <span>Marco Lateral</span>
                    </label>
                </div>
            </div><!-- /.theme-option -->
        </div><!-- /.theme-options-list -->
    </div><!-- /.theme-options-panel -->
</div>