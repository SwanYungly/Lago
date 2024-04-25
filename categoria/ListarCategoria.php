<?php
    function pesquisarcat($buscanome){
        include_once '../conexao.php';
    
        if (empty($buscanome)) {
            $sql = "SELECT * FROM categoria";
        } else {
            $sql = "SELECT * FROM categoria WHERE nomeCategoria LIKE '%$buscanome%'";
        }
    
        $resultado = mysqli_query($conexao, $sql);

        if (mysqli_num_rows($resultado) > 0) {
            $cats = array();
    
            while ($linha = mysqli_fetch_assoc($resultado)) {
                $cats[] = $linha;
            }
            mysqli_close($conexao);
    
            return $cats;
        }
    }

    $buscanome = isset($_POST['nomeCategoria']) ? $_POST['nomeCategoria'] : '';

    $cats = pesquisarcat($buscanome);
?>

<!DOCTYPE html>
<html lang="pt-br">
    
<body>
    <main>
        <div class="principal">
            <h1>Categorias</h1> 
            <?php
                echo "<table>";
                foreach($cats as $cat){
                    echo "<tr>";
                    echo "<td>". $cat["nomeCategoria"] . "</td>";
                    echo "</tr>";
                }
                echo "</table>";
            ?>
        </div>
    </main>
</body>
</html>