<%-- 
    Document   : Head
    Created on : 7/12/2016, 02:05:14 PM
    Author     : alejozepol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8" lang="es">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>SIPRE</title>
    <link rel="shortcut icon" href="../img/favico.jpg" type="image/x-icon">
    <!-- CSS-->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/estilos.css" rel="stylesheet">
    <link href="../css/themes/theme-1-forgedsteel-danger/bemat-admin.css" rel="stylesheet" id="info-bg">
    <link rel="stylesheet" href="../css/validationEngine.jquery.css" type="text/css"/>
    <!-- Core Scripts - Include with every page -->
    <script src="../js/jquery-1.12.2.min.js" type="text/javascript"></script>
    <script src="../js/jquery-ui.custom.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/modernizr-custom-3.3.1.js" type="text/javascript"></script>
    <script src="../js/LABjs/LAB.min.js" type="text/javascript"></script>
    <script src="../js/bemat-admin-common.min.js" type="text/javascript"></script>
    <script src= "../js/jquery.validationEngine-es.js"  type= "text/javascript"  charset= "utf-8" ></script> 
    <script src= "../js/jquery.validationEngine.js"  type= "text/javascript"  charset= "utf-8" ></script>
    <style type="text/css">
        .input-field div.error{
            position: relative;
            top: -1rem;
            left: 0rem;
            font-size: 0.8rem;
            color:#FF4081;
            -webkit-transform: translateY(0%);
            -ms-transform: translateY(0%);
            -o-transform: translateY(0%);
            transform: translateY(0%);
        }
        .input-field label.active{
            width:100%;
        }
        .left-alert input[type=text] + label:after, 
        .left-alert input[type=password] + label:after, 
        .left-alert input[type=email] + label:after, 
        .left-alert input[type=url] + label:after, 
        .left-alert input[type=time] + label:after,
        .left-alert input[type=date] + label:after, 
        .left-alert input[type=datetime-local] + label:after, 
        .left-alert input[type=tel] + label:after, 
        .left-alert input[type=number] + label:after, 
        .left-alert input[type=search] + label:after, 
        .left-alert textarea.materialize-textarea + label:after{
            left:0px;
        }
        .right-alert input[type=text] + label:after, 
        .right-alert input[type=password] + label:after, 
        .right-alert input[type=email] + label:after, 
        .right-alert input[type=url] + label:after, 
        .right-alert input[type=time] + label:after,
        .right-alert input[type=date] + label:after, 
        .right-alert input[type=datetime-local] + label:after, 
        .right-alert input[type=tel] + label:after, 
        .right-alert input[type=number] + label:after, 
        .right-alert input[type=search] + label:after, 
        .right-alert textarea.materialize-textarea + label:after{
            right:70px;
        }
    </style>
</head>