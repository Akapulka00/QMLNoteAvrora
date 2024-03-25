function dbInit() {
    var db = LocalStorage.openDatabaseSync("Notes_DB", "", "Database for Notes", 1000000);
    try {
        db.transaction(function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS notes ( date text, message TEXT)');
        });
    } catch (err) {
        console.log("Error creating table in database: " + err)
    };
    console.log("БД создана");
}


function openExistingDB() {
    try {
       var db = LocalStorage.openDatabaseSync("Notes_DB", "", "Database for Notes", 1000000)
    console.log("БД открыта");
    } catch (err) {
        console.log("Error opening database: " + err)
    }

    return db


}
function dbInsert(Pdate,message) {
    var db = openExistingDB();
    var rowid = 0;
    db.transaction(function(tx) {
        tx.executeSql('INSERT INTO notes (date, message) VALUES (?, ?)', [Pdate, message]);
        var result = tx.executeSql('SELECT last_insert_rowid()');
        rowid = result.insertId;
    });
}
function dbClear() {
    var db = openExistingDB();
    db.transaction(function(tx) {
        tx.executeSql('DELETE FROM notes');
    });
    console.log("БД очищена");
}

function dbReadAll() {
    var db = openExistingDB();
    db.transaction(function(tx) {
        var rs = tx.executeSql('SELECT * FROM notes ORDER BY id DESC');
        for (var i = 0; i < rs.rows.length; i++) {
            console.log(rs.rows.item(i).message);
            noteModel.append({
                date: rs.rows.item(i).date,
                message: rs.rows.item(i).message
            });
            console.log("Данные выгружены");
        }
    });
}
function dbClear() {
    var db = openExistingDB();
    db.transaction(function(tx) {
        tx.executeSql('DELETE FROM notes');
    });
    console.log("БД очищена");
}
