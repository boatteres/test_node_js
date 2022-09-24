import mysql from "mysql";

const db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'product',
    connectionLimit: 10,
});

export default db;