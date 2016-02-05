<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <title><?php echo $titulo; ?></title>
    <meta charset="UTF-8" />
    <link type="text/css" rel="stylesheet" href="<?php echo base_url(); ?>assets/css/estilo.css"/>
</head>
<body>
    <?php echo form_open('substancia_gestacao/inserir', 'codigo_substancia="form-substancia_gestacao"'); ?>
    <h1>SUBSTÂNCIAS DA GESTAÇÃO DA MÃE</h1>
    <label for="nome">Nome:</label><br/>
    <input type="text" name="nome" value="<?php echo set_value('nome'); ?>"/>
    <div class="error"><?php echo form_error('nome'); ?></div>
    <input type="submit" name="cadastrar" value="Cadastrar" />
 
    <?php echo form_close(); ?>

    <!-- Lista as substancia_gestacao Cadastradas -->
    <div id="grid-substancia_gestacao">
        <ul>
        <?php foreach($substancia_gestacao as $substancia): ?>
        <li>
            <a title="Deletar" href="<?php echo base_url() . 'substancia_gestacao/deletar/' . $substancia->codigo_substancia; ?>" onclick="return confirm('Confirma a exclusão deste registro?')"><img src="<?php echo base_url(); ?>assets/img/lixo.png"/></a>
            <span> - </span>
            <a title="Editar" href="<?php echo base_url() . 'substancia_gestacao/editar/' . $substancia->codigo_substancia; ?>"><?php echo $substancia->nome; ?></a>
          
            
        </li>
        <?php endforeach ?>
        </ul>
    </div>
    <!-- Fim Lista -->

    
    <div id="body">
    
        <p><a href="welcome"> Retornar</a></p>
    
    </div>
    
</body>
</html>