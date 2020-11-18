@login
Feature: Remover Filme

             Para que eu possa manter o catálogo atualizado
             Sendo um gestor de catálogo que encontrou um título cancelado/indesejado ou que não tem uma boa aceitação pelo o publico
             Posso remover este item

        
        Scenario: Confirmar exclusão
            Given que "dbz" está no catálogo
             When eu removo este item
              And eu confirmo a solicitação
             Then este item deve ser removido do catálogo
        @rm_movie
        Scenario: Cancelar exclusão
            Given que "10_coisas" está no catálogo
             When eu solicito a exclusão
              But cancelo a solicitação
             Then este item deve permanecer no catálogo

