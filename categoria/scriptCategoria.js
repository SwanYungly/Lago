$.validator.addMethod("Categoria", function(value, element) {
    let regexCategoria = /^[a-zA-ZÀ-ú\s]+$/;
    return this.optional(element) || regexCategoria.test(value);
});

$(document).ready(function(){
    $("#formCategoria").validate({
        rules: {
            nome: {
                required: true,
                minlength: 3,
                Categoria: true
            },
        },
        messages: {
            nome: {
                required: "Por favor, informe uma categoria.",
                minlength: "Categoria inválida (mínimo 3 caracteres)",
                Categoria: "Categoria inválida (use apenas letras e espaços)"
            },
        }
    });
});