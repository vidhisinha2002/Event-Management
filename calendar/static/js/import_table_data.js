$(document).ready(function() {
  function format (data) {
      return '<div class="details-container" style="padding:5% 5% 5% 5%">'+data.event_desc+'</div>';
  };
  
  


// alert(data);


    var table = $('.datatables').DataTable({
    // Column definitions
    ajax: 'return.php',
    columns : [
      {data : 'event_name'},
      {data : 'start_date'},
      {data : 'end_date'},
      {data : 'location'}
    ],
    
    pagingType : 'full_numbers',

  });




 
  $('.datatables tbody').on('click', 'td', function () {
     var tr  = $(this).closest('tr'),
         row = table.row(tr);
    
     if (row.child.isShown()) {
       tr.next('tr').removeClass('details-row');
       row.child.hide();
       tr.removeClass('shown');
     }
     else {
       row.child(format(row.data())).show();
       tr.next('tr').addClass('details-row');
       tr.addClass('shown');
     }
  });
 
});