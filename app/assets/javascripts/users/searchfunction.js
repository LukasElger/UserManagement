function SearchFunction() {
  // Declare variables
  var input, filter, table, tr, i, txtValue;
  input = document.getElementById("SearchInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("SearchableTable");
  tr = table.getElementsByTagName("tr");

  var name, mail;

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    name = tr[i].getElementsByTagName("td")[1];
    mail = tr[i].getElementsByTagName("td")[2];
    SearchInsideRow(tr, i, name, filter);
  }
}

function SearchInsideRow(tr, i, td, filter) {
  if (td) {
    txtValue = td.textContent || td.innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      tr[i].style.display = "";
    } else {
      tr[i].style.display = "none";
    }
  }
}
