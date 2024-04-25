<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Categoria</title>
</head>
<body>
    <h1> Cadastro de Categoria </h1>
    <form action="" method="post" id="formCategoria">
        <div class="campos">
            <label for="nome">Nome categoria</label>
            <input id="nome" type="text" name="nome" placeholder="Use apenas letras e '-'" id="inputCategoria">
            <?php
                if(isset($_POST["btn-cadastrar"])) {

                    include("../conexao.php");
        
                    $nomeCategoria = $_POST["nome"];
                    $nomeCadastrado = 0;
                
                    $sqlChecar = "SELECT * FROM categoria WHERE nomeCategoria LIKE '".$nomeCategoria."'";
                
                    $resultadoChecar = mysqli_query($conexao, $sqlChecar);
                
                    if(mysqli_num_rows($resultadoChecar) > 0) {
                        echo "<p>Categoria já cadastrada</p>";
                        $nomeCadastrado = 1;
                    } else {
                        $nomeCadastrado = 0;
                    }
                }
            ?>
        </div>
        <button type="submit" id="btn-cadastrar" name="btn-cadastrar">Cadastrar</button>
    </form>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- jQuery Validate -->
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <!-- jQuery mascara -->
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
    <script src="scriptCategoria.js"></script>
</body>
</html>

<?php
if(isset($_POST["btn-cadastrar"])) {

    include("../conexao.php");

    $nome = $_POST["nome"];

    if($nomeCadastrado == 0) {

        $sql = "INSERT INTO categoria (nomeCategoria) VALUES ('$nome')";
        
        if(mysqli_query($conexao, $sql)) {
            echo "<p>Categoria cadastrada com Sucesso</p>";
        }else {
            echo "<p>Erro ao Cadastrar categoria</p>";
        }
    }
}
?>