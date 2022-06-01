/**
 * Example of using Node.js with ODBC & Dataqueues
 *
 * Use ODBC with DB2 for i Services to pick up entries on a dataqueue
 *
 * For configuration a .env file is used for the ODBC connection
 * a sample of this file is included within this packaged, called env (Excluded from .gitignore!)
 *
 * Andy Youens - FormaServe
 * Twitter @AndyYouens
 *
 */

'use strict'

// required modules
const odbc = require('odbc')
const nodemailer = require('nodemailer')
let debug = require('debug')('odbc:index')
require('dotenv').config()

// Use environment vars to build ODBC connection object
const connectionConfig = {
  connectionString: `DSN=${process.env.DSN};UID=${process.env.DB_USER};PWD=${process.env.DB_PASS}`,
  connectionTimeout: 10,
  loginTimeout: 10
}

// Create a SMTP transporter object
let transporter = nodemailer.createTransport(
  {
    host: process.env.SMTP_HOST,
    port: process.env.SMTP_PORT,
    auth: {
      user: process.env.SMTP_USER,
      pass: process.env.SMTP_PASS
    },
    logger: true,
    transactionLog: true // include SMTP traffic in the logs
  },
  {
    // sender info
    from: 'FormaServe Support <info@formaserve.co.uk>',
    headers: {
      'X-Laziness-level': 1000 // just an example header, no need to use this
    }
  }
)

// Build DataQueue SQL statement - use a wait time of 1 to sit waiting for queue entries
const sql = `select MESSAGE_DATA from table (
    qsys2.receive_data_queue(
      data_queue => 'SUPPLIERS',
      data_queue_library => 'POWERWIRE',
      WAIT_TIME => 1)
  )`

// Can only use AWAIT in a async function, so all main processing is performed here
async function getFromDQ() {

  // make the ODBC connection
  const connection = await odbc.connect(connectionConfig)

  try {

    while (true) {

      // use DB2 for i Services to get DQ entry
      const result = await connection.query(sql)

      // anything in queue, if not wait for next entry
      if (result.count == 0) {
        debug('Dataqueue empty at the mo!')
        continue
      }

      // result contains an array of results, we only want the message data in first element
      debug(`Data Queue message is ${result[0].MESSAGE_DATA}`)

      // Check if end of processing detected
      if (result[0].MESSAGE_DATA == '*END') {
        debug('Stop processing signal received')
        return
      }

      // Got any results back?
      if (result.count == 0) {
        debug('Dataqueue empty at the mo!')
        continue
      }

      // Do further processing here ....
      let supplier = result[0].MESSAGE_DATA
      let email_address = supplier.split('#')[0]
      let company = supplier.split('#')[1]
      let country = supplier.split('#')[2]
      let order_number = supplier.split('#')[3]
      let email_message = `Thank you for your order number ${order_number}`

      // send mail with defined transport object
      let info = await transporter.sendMail({
        from: 'Info - FormaServe<info@formaserve.co.uk>', // sender address
        to: email_address,
        subject: "ODBC Example", 
        text: email_message
      })

      debug(`Email sent to ${email_address} at ${company}`)
      debug(`Message sent: ${info.messageId}`)

    }
  } catch (err) {
    console.error(`Error: ${err.stack}`)
  }
}

// all the async stuff
getFromDQ()