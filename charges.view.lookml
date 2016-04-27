- view: charges
  sql_table_name: stripe.charges
  fields:

## Dimensions
  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: amount_refunded
    type: number
    sql: ${TABLE}.amount_refunded

  - dimension: captured
    type: yesno
    sql: ${TABLE}.captured

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: currency
    type: string
    sql: ${TABLE}.currency

  - dimension: customer_id
    type: string
    # hidden: true
    sql: ${TABLE}.customer_id

  - dimension: dispute_id
    type: string
    sql: ${TABLE}.dispute_id

  - dimension: failure_code
    type: string
    sql: ${TABLE}.failure_code

  - dimension: invoice_id
    type: string
    # hidden: true
    sql: ${TABLE}.invoice_id

  - dimension: paid
    type: yesno
    sql: ${TABLE}.paid

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension: refunded
    type: yesno
    sql: ${TABLE}.refunded

  - dimension: status
    type: string
    sql: ${TABLE}.status

## Measures
  - dimension: days_until_received
    type: number
    sql: datediff('days',${created_date},${received_date})
  
  - measure: avg_days_until_received
    type: avg
    sql: ${days_until_received}
    value_format: '#0.00'
  
  - measure: total_gross_amount
    type: sum
    sql: ${TABLE}.amount
    value_format: '[>=1000000]$0.00,,"M";[>=1000]$0.00,"K";$0.00'
    drill_fields: [id, customers.id, invoices.id, invoices.count, refunds.count]

  - measure: total_failed_charges
    type: sum
    sql: ${TABLE}.amount
    value_format: '[>=1000000]$0.00,,"M";[>=1000]$0.00,"K";$0.00'
    drill_fields: [id, customers.id, invoices.id, invoices.count, refunds.count]
    filters:
      status: 'failed'
      
  - measure: total_refunds
    type: sum
    sql: ${TABLE}.amount_refunded
    value_format: '[>=1000000]$0.00,,"M";[>=1000]$0.00,"K";$0.00'
    drill_fields: [id, customers.id, invoices.id, invoices.count, refunds.count]
      
  - measure: total_net_amount
    type: number
    sql: ${total_gross_amount} - ${total_refunds} - ${total_failed_charges}
    value_format: '[>=1000000]$0.00,,"M";[>=1000]$0.00,"K";$0.00'
    drill_fields: [id, customers.id, invoices.id, invoices.count, refunds.count]

  - measure: cumulative_gross
    type: running_total
    sql: ${total_gross_amount}
    value_format: '[>=1000000]$0.00,,"M";[>=1000]$0.00,"K";$0.00'
    
  - measure: cumulative_refunds
    type: running_total
    sql: ${total_refunds}
    value_format: '[>=1000000]$0.00,,"M";[>=1000]$0.00,"K";$0.00'

  - measure: cumulative_net
    type: running_total
    sql: ${total_net_amount}
    value_format: '[>=1000000]$0.00,,"M";[>=1000]$0.00,"K";$0.00'

  - measure: avg_charge_amount
    type: avg
    sql: ${total_gross_amount} - ${total_refunds} - ${total_failed_charges}
    value_format: '[>=1000000]$0.00,,"M";[>=1000]$0.00,"K";$0.00'

  - measure: charge_count
    type: count
    drill_fields: [id, customers.id, invoices.id, invoices.count, refunds.count]

  - measure: refund_count
    type: count
    drill_fields: [id, customers.id, invoices.id, invoices.count, refunds.count]
    filters:
      refunded: 'Yes'
