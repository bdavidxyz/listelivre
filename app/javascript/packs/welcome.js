import $ from 'jquery'
import dt from 'datatables.net'
import "datatables.mark.js";

// require('datatables.mark.js/dist/datatables.mark.es6.js');

$(document).ready( function () {

    $('#main_table').DataTable({
      mark: true,
      paging: false,
      language: {
        search: "Rechercher :"
      }
    });

} );

