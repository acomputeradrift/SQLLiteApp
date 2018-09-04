//
//  DataManager.swift
//  
//
//  Created by Jamie on 2018-09-04.
//

import Foundation
import FMDB

    // 1
    enum DatabaseError: Error {
        case open
        case executeStatement
    }
    
    class Database {
        
        // 2
        let db: FMDatabase
        
        init() throws {
            // 3
            let dbName = "database.db"
            let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dbName)
            
            // 4
            db = FMDatabase(url: fileURL)
            if !db.open() {
                throw DatabaseError.open
            }
        }
        
        deinit {
            // 5
            db.close()
        }
        
        func setupTables() throws {
            // 1
            let sql = """
    CREATE TABLE famous_people (
      id INTEGER PRIMARY KEY,
      first_name VARCHAR(50),
      last_name VARCHAR(50),
      birthdate VARCHAR(10)
    );

    INSERT INTO famous_people (first_name, last_name, birthdate)
      VALUES ('Abraham', 'Lincoln', '1809-02-12');
    INSERT INTO famous_people (first_name, last_name, birthdate)
      VALUES ('Mahatma', 'Gandhi', '1869-10-02');
    INSERT INTO famous_people (first_name, last_name, birthdate)
      VALUES ('Paul', 'Rudd', '1969-04-06');
  """
            
            // 2
            if !db.executeStatements(sql) {
                throw DatabaseError.executeStatement
            }
        }
    }

