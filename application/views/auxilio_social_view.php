<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
    <head>
        <title><?php echo $titulo; ?></title>
        <meta charset="utf-8">
        <link href="<?php echo base_url('assets/css/bootstrap.min.css') ?>" rel="stylesheet">
        <link href="<?php echo base_url('assets/css/font-awesome.min.css') ?>" rel="stylesheet">
        <script src="<?php echo base_url('assets/js/jquery.min.js') ?>"></script>
        <script src="<?php echo base_url('assets/js/bootstrap.min.js') ?>"></script>
        <link href="<?php echo base_url('assets/css/estilo.css') ?>" rel="stylesheet">
        
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a href="welcome"><span class="navbar-brand" href="welcome">CIAF</span></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        
                        <li><a href="#">OOI</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Área Restrita <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="substancia_gestacao">Cadastro Substância Gestação</a></li>
                                <li><a href="auxilio_social">Cadastro Auxilio Social</a></li>
                                <li><a href="doenca">Cadastro Doença</a></li>
                                <li><a href="habito_alimentar">Cadastro Habito Alimentar</a></li>
                                <li><a href="grau_parentesco">Cadastro Grau Parentesco</a></li>
                                <li><a href="renda_familiar">Cadastro Rendas</a></li>
                                <li><a href="grau_escolaridade">Cadastro Grau Escolaridade</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="responsavel">Cadastro Responsável</a></li>
                                <li><a href="paciente">Cadastro Paciente</a></li>
                            </ul>
                        </li>
                    </ul>    
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <div class="panel panel-default">
            <div class="panel-body">
                <?php echo form_open('auxilio_social/inserir', 'codigo_auxilio_social="form-auxilio_social"'); ?>
                <h1>CADASTRO AUXÍLIO SOCIAL</h1>
                <label for="nome">Nome:</label></br>
                <input class='form-control' type="text" name="nome" value="<?php echo set_value('nome'); ?>"/>
                <div class="error"><?php echo form_error('nome'); ?></div>
                <label for="origem">Origem:</label>
                <input class='form-control' type="text" name="origem" value="<?php echo set_value('origem'); ?>"/>
                <div class="error"><?php echo form_error('origem'); ?></div>
                <input class='btn btn-default' type="submit" name="cadastrar" value="Cadastrar" />

                <?php echo form_close(); ?>

                <!-- Lista as auxilio_social Cadastradas -->
                <div id="grid-auxilio_social">
                    <ul>
                        <?php foreach($auxilio_social as $auxilio_social): ?>
                        <li class="list-group-item">
                            <a title="Deletar" href="<?php echo base_url() . 'auxilio_social/deletar/' . $auxilio_social->codigo_auxilio_social; ?>" onclick="return confirm('Confirma a exclusão deste registro?')"><img src="<?php echo base_url(); ?>assets/img/lixo.png"/></a>
                            <span> - </span>
                            <a title="Editar" href="<?php echo base_url() . 'auxilio_social/editar/' . $auxilio_social->codigo_auxilio_social; ?>"><?php echo $auxilio_social->nome; ?></a>
                            <span> - </span>
                            <span><?php echo $auxilio_social->origem; ?></span>

                        </li>
                        <?php endforeach ?>
                    </ul>
                </div>
                <!-- Fim Lista -->
                <div id="body">
                    <p><a class='btn btn-default'href="welcome"> Retornar</a></p>
                </div>
            </div>
            <div class="panel-footer">
                Aline Sieczko e Maritza Silva &copy 2015
            </div>
        </div>
    </body>

</html>