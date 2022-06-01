// Drag in ODBC
const odbc = require('odbc')

// Debug for explaning
const debug = require('debug')('odbc:index')

// Create connection object
const connectionConfig = {
  connectionString: 'DSN=Galatea',
  connectionTimeout: 10,
  loginTimeout: 10
}

// Quick debug to log
debug('--> into index.js')

// Create connection anonymous function
const connection = odbc.connect(connectionConfig, (error, connection) => {
  // Got any probs?
  if (error) {
    console.error(error)
  }
  // Run SQL in anonymous function
  connection.query('select * from hrdata.employee order by emid', (error, result) => {
    // Check for errors
    if (error) {
      console.error(error)
    }
    debug(result) // dump results out
  })
})



