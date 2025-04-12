<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Driver Status Dashboard</title>
  <style>
    * {
      box-sizing: border-box;
    }
    body {
      margin: 0;
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      background-color: #e7f0f7;
      color: #333;
    }
    header {
      background-color: #1c75bc;
      color: white;
      padding: 16px;
      text-align: center;
      font-size: 24px;
      font-weight: 600;
      border-bottom: 4px solid #155a8a;
    }
    main {
      padding: 30px 10px;
      max-width: 1100px;
      margin: auto;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      border-radius: 8px;
      overflow: hidden;
    }
    th, td {
      padding: 12px;
      text-align: center;
      border-bottom: 1px solid #ddd;
    }
    th {
      background-color: #1c75bc;
      color: white;
    }
    select, input[type="text"], input[type="time"] {
      padding: 6px;
      font-size: 14px;
      width: 100%;
      border-radius: 4px;
      border: 1px solid #ccc;
    }
    .status-READY { background-color: #d4edda; font-weight: bold; }
    .status-LOADHAS { background-color: #fff3cd; font-weight: bold; }
    .status-OFF { background-color: #f8d7da; font-weight: bold; }
  </style>
</head>
<body>
  <header>
    🚛 TOKSSA EXPRESS LLC – DRIVER STATUS
  </header>
  <main>
    <table>
      <thead>
        <tr>
          <th>#</th>
          <th>Driver</th>
          <th>Status</th>
          <th>From</th>
          <th>Till</th>
          <th>Location</th>
          <th>Notes</th>
        </tr>
      </thead>
      <tbody id="driverTable"></tbody>
    </table>
  </main>
  <script>
    const statuses = ["READY", "LOAD HAS", "Completing", "OFF", "SLEEPING", "XRM", "NO INFO", "KIDALA", "IN HISTORY", "Deadhead"];
    const drivers = [
      "Rostyslav Yavorskyi", "Andriy Demianchuk", "Yaroslav Kramar", "Andrii Kloshnyk", "Yaroslav Baliant",
      "Ihor Hrytsyn", "Mykola Sydorenko", "Stanislav Korolyk", "Ruslan Viniarskyi", "Oleksandr Pryymachuk",
      "Anatoly Pentak", "Oleh Datsko", "Rostyslav Polovyy", "Dmytro Serebriakov", "Oksana Grokh",
      "Nazar Stelmakh", "Ivan Nykolaiuchk", "Mykola Slobodian", "Oleh Rudyy", "Sergii Grokh"
    ];

    const table = document.getElementById("driverTable");

    drivers.forEach((name, index) => {
      const row = document.createElement("tr");
      row.innerHTML = `
        <td>${index + 1}</td>
        <td>${name}</td>
        <td>
          <select onchange="updateRowStatus(this)">
            ${statuses.map(s => `<option value="${s}">${s}</option>`).join('')}
          </select>
        </td>
        <td><input type="time" /></td>
        <td><input type="time" /></td>
        <td><input type="text" placeholder="Location" /></td>
        <td><input type="text" placeholder="Notes" /></td>
      `;
      table.appendChild(row);
    });

    function updateRowStatus(select) {
      const cell = select.closest("td");
      const row = select.closest("tr");
      row.className = "";
      const val = select.value.replace(/\s/g, '').toUpperCase();
      row.classList.add(`status-${val}`);
    }
  </script>
</body>
</html>
