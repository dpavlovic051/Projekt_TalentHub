const express = require("express");
const bodyParser = require("body-parser");
const mysql = require("mysql");

// Inicijalizacija Express aplikacije
const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Konfiguracija baze podataka
const dbConfig = {
  host: "ucka.veleri.hr",
  user: "dpavlovic",
  password: "11",
  database: "dpavlovic",
  port: 3306,
};

const db = mysql.createConnection(dbConfig);

// Povezivanje na bazu
db.connect((err) => {
  if (err) {
    console.error("Greška pri povezivanju na bazu:", err.message);
    process.exit(1);
  }
  console.log("Uspješno spojeno na bazu!");
});

// Middleware za rukovanje CORS-om (Cross-Origin Resource Sharing)
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
  res.header("Access-Control-Allow-Headers", "Content-Type");
  next();
});

// Rute za API

// Dohvati sve freelancere
app.get("/freelanceri", (req, res) => {
  db.query("SELECT * FROM freelanceri", (err, results) => {
    if (err) {
      console.error("Greška pri dohvaćanju freelancera:", err.message);
      return res.status(500).json({ error: "Greška na serveru" });
    }
    res.json(results);
  });
});

// Dohvati sve narudžbe
app.get("/narudzbe", (req, res) => {
  const query = `
    SELECT narudzbe.id, narudzbe.opis_posla, freelanceri.ime AS freelancer, narudzbe.datum_vrijeme
    FROM narudzbe 
    JOIN freelanceri ON narudzbe.freelancer_id = freelanceri.id
  `;
  db.query(query, (err, results) => {
    if (err) {
      console.error("Greška pri dohvaćanju narudžbi:", err.message);
      return res.status(500).json({ error: "Greška na serveru" });
    }
    res.json(results);
  });
});

// Dodaj novog freelancera
app.post("/freelanceri", (req, res) => {
  const { ime, usluga } = req.body;
  if (!ime || !usluga) {
    return res.status(400).json({ error: "Nedostaju obavezni podaci" });
  }
  db.query(
    "INSERT INTO freelanceri (ime, usluga) VALUES (?, ?)",
    [ime, usluga],
    (err, result) => {
      if (err) {
        console.error("Greška pri dodavanju freelancera:", err.message);
        return res.status(500).json({ error: "Greška na serveru" });
      }
      res.json({ id: result.insertId, ime, usluga });
    }
  );
});

app.post("/narudzbe", (req, res) => {
  const { freelancer_id, opis_posla, korisnik_id } = req.body;

  console.log("Primljeni podaci za novu narudžbu:", req.body);

  if (!freelancer_id || !opis_posla || !korisnik_id) {
    console.warn("Nedostaju obavezni podaci:", req.body);
    return res.status(400).json({ error: "Nedostaju obavezni podaci" });
  }

  const query = `
    INSERT INTO narudzbe (freelancer_id, opis_posla, korisnik_id, datum_vrijeme) 
    VALUES (?, ?, ?, NOW())
  `;

  db.query(query, [freelancer_id, opis_posla, korisnik_id], (err, result) => {
    if (err) {
      console.error("Greška pri dodavanju narudžbe:", err.message);
      return res.status(500).json({ error: "Greška na serveru" });
    }

    console.log("Uspješno dodana narudžba s ID-om:", result.insertId);
    res.json({
      success: true,
      id: result.insertId,
      freelancer_id,
      opis_posla,
      korisnik_id,
      datum_vrijeme: new Date(),
    });
  });
});

// Registracija novog korisnika
app.post("/registracija", (req, res) => {
  const { ime, email, lozinka } = req.body;
  console.log("Primljeni podaci za registraciju:", req.body); // Dodano za praćenje

  if (!ime || !email || !lozinka) {
    console.warn("Nedostaju obavezni podaci:", req.body); // Dodano za dijagnostiku
    return res.status(400).json({ error: "Nedostaju obavezni podaci" });
  }

  db.query(
    "INSERT INTO korisnici (ime, email, lozinka) VALUES (?, ?, ?)",
    [ime, email, lozinka],
    (err, result) => {
      if (err) {
        console.error("Greška pri registraciji:", err.message); // Dodano za praćenje greške
        return res.status(500).json({ error: "Greška na serveru" });
      }
      console.log("Uspješno registriran korisnik s ID-om:", result.insertId); // Dodano za praćenje
      res.json({ success: true, id: result.insertId });
    }
  );
});

// Prijava korisnika
app.post("/login", (req, res) => {
  const { email, lozinka } = req.body;
  if (!email || !lozinka) {
    return res
      .status(400)
      .json({ success: false, message: "Nedostaju podaci" });
  }

  db.query(
    "SELECT * FROM korisnici WHERE email = ? AND lozinka = ?",
    [email, lozinka],
    (err, results) => {
      if (err) {
        console.error("Greška pri prijavi:", err.message);
        return res
          .status(500)
          .json({ success: false, message: "Greška na serveru" });
      }

      if (results.length > 0) {
        res.json({ success: true, user: results[0] });
      } else {
        res.json({ success: false, message: "Neispravni podaci za prijavu" });
      }
    }
  );
});

// Pokretanje servera
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Backend server running on http://localhost:${PORT}`);
});

app.get("/kategorije", (req, res) => {
  db.query("SELECT * FROM kategorije", (err, results) => {
    if (err) {
      console.error("Greška pri dohvaćanju kategorija:", err.message);
      return res.status(500).json({ error: "Greška na serveru" });
    }
    res.json(results);
  });
});

app.post("/kategorije", (req, res) => {
  const { naziv } = req.body;

  if (!naziv) {
    return res.status(400).json({ error: "Naziv kategorije je obavezan!" });
  }

  db.query(
    "INSERT INTO kategorije (naziv) VALUES (?)",
    [naziv],
    (err, result) => {
      if (err) {
        console.error("Greška pri dodavanju kategorije:", err.message);
        return res.status(500).json({ error: "Greška na serveru" });
      }
      res.json({ success: true, id: result.insertId, naziv });
    }
  );
});

app.get("/freelanceri", (req, res) => {
  const kategorijaId = req.query.kategorija; // Dohvati ID kategorije iz URL parametra

  let query = `
      SELECT freelanceri.*, kategorije.id as kategorija_id
      FROM freelanceri
      JOIN kategorije ON freelanceri.usluga = kategorije.naziv
    `;

  if (kategorijaId) {
    query += ` WHERE kategorije.id = ${db.escape(kategorijaId)}`;
  }

  db.query(query, (err, results) => {
    if (err) {
      console.error("Greška pri dohvaćanju freelancera:", err.message);
      return res.status(500).json({ error: "Greška na serveru" });
    }
    res.json(results);
  });
});
