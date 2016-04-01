- view: accounts
  sql_table_name: stripe.accounts
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: charges_enabled
    type: yesno
    sql: ${TABLE}.charges_enabled

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: currencies_supported
    type: string
    sql: ${TABLE}.currencies_supported

  - dimension: default_currency
    type: string
    sql: ${TABLE}.default_currency

  - dimension: details_submitted
    type: yesno
    sql: ${TABLE}.details_submitted

  - dimension: managed
    type: yesno
    sql: ${TABLE}.managed

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension: transfers_enabled
    type: yesno
    sql: ${TABLE}.transfers_enabled

  - measure: count
    type: count
    drill_fields: [id]

