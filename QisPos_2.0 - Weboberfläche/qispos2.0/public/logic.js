$(document).ready(function() {
  $("#notenTable").DataTable({
    paging: false
  });
  $("#uebersichtTable").DataTable({
    paging: false
  });

  $("#rankingTable").DataTable({
    order: [[1, "asc"]]
  });

  $(".dataTables_length").addClass("bs-select");
});

$(function() {
  $("#Bestaetigen").click(function() {});
});

$(function() {
  window.location.hash &&
    $('ul.nav.nav-pills a[href="' + window.location.hash + '"]').tab("show");

  document.forms[0].hash.value = window.location.hash;

  $("ul.nav.nav-pills a").click(function(e) {
    $(this).tab("show");
    var scrollmem = $("body").scrollTop();

    window.location.hash = this.hash;

    document.forms[0].hash.value = this.hash;
  });
});

function createPDF() {
  var pdfVorname = document.getElementById("pdf.vorname").innerHTML;
  var pdfNachname = document.getElementById("pdf.nachname").innerHTML;
  var pdfMatrnr = document.getElementById("pdf.matrikelnummer").innerHTML;
  var pdfAlleNoten = document.getElementById("pdf.noten").innerHTML;
  var pdfStudiengang = document.getElementById("pdf.studiengang").innerHTML;
  var pdfAbschluss = document.getElementById("pdf.abschluss").innerHTML;
  var pdfNotenDurchschnitt = document.getElementById("pdf.durchschnitt")
    .innerHTML;

  var pdfDatum = new Date();

  var doc = new jsPDF();

  doc.setFontSize(12);

  // Hochschule Bremen
  doc.setFontStyle("bold");
  doc.text("Hochschule Bremen", 20, 20);
  doc.text("City University of Applied Sciences", 20, 25);

  // Leistungsübersicht
  doc.setFontStyle("bold");
  doc.text("Leistungsübersicht", 20, 80);

  // Datum
  doc.text(
    pdfDatum.getDate() +
      "." +
      pdfDatum.getMonth() +
      "." +
      pdfDatum.getFullYear(),
    170,
    80
  );

  doc.setFontStyle("normal");

  // Name
  doc.setTextColor(24, 188, 156);
  doc.text("Name: ", 20, 95);
  doc.setTextColor(0, 0, 0);
  doc.text(pdfVorname + " " + pdfNachname, 60, 95);

  // Matrikelnummer
  doc.setTextColor(24, 188, 156);
  doc.text("Matrikelnummer: ", 20, 100);
  doc.setTextColor(0, 0, 0);
  doc.text(pdfMatrnr, 60, 100);

  // Abschluss
  doc.setTextColor(24, 188, 156);
  doc.text("Abschluss: ", 20, 105);
  doc.setTextColor(0, 0, 0);
  doc.text(pdfAbschluss, 60, 105);

  // Studiengang
  doc.setFontStyle("bold");
  doc.setTextColor(24, 188, 156);
  doc.text(pdfStudiengang, 20, 130);

  doc.setFontStyle("normal");
  doc.setTextColor(0, 0, 0);

  // Tabellen Erstellung

  var zeile = 0;
  var spalte = 0;

  var wort = "";

  var wertAllerCredits = 0;

  var ueberschrift = false;

  doc.setFontSize(10);

  for (var i = 0; i < pdfAlleNoten.length; i++) {
    if (ueberschrift == false) {
      doc.setTextColor(24, 188, 156);

      doc.text("Prüfungsnr.", 20, 150);
      doc.text("Modul", 50, 150);
      doc.text("Semester", 80, 150);
      doc.text("Note", 110, 150);
      doc.text("Credits", 140, 150);
      doc.text("Versuch", 170, 150);

      ueberschrift = true;
      doc.setTextColor(0, 0, 0);
    }

    if (pdfAlleNoten[i] != "€") {
      wort += pdfAlleNoten[i];
    } else {
      doc.text(wort, 30 * spalte + 20, 10 * (zeile + 1) + 155);

      // Zusammenrechnung der Credits
      if (spalte == 3 && pdfAlleNoten[i] != null) {
        wertAllerCredits += Number(pdfAlleNoten[i + 1]);
      }

      if (spalte == 5) {
        zeile++;
        spalte = 0;
      } else {
        spalte++;
      }

      wort = "";
    }
  }

  // Alle Credits
  doc.text("Gesamtzahl der Credits: " + wertAllerCredits, 20, 140);

  // Notendurchschnitt
  doc.text("Notendurchschnitt: " + pdfNotenDurchschnitt, 120, 140);

  doc.save("leistungsuebersicht.pdf");
}


