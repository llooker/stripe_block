- dashboard: invoice_lookup
  title: Invoice Lookup
  layout: tile
  tile_size: 100

#  filters:

  elements:

  - name: add_a_unique_name_1462219740461
    title: Invoice Detail
    type: looker_single_record
    model: segment_stripe
    explore: calendar
    dimensions: [customers.email, invoices.total, invoices.amount_due, charges.currency,
      invoices.paid, invoices.attempted, invoices.closed, invoices.attempt_count, invoices.ending_balance]
    filters:
      invoices.id: in^_80bEWMNEErTWfo
    sorts: [customers.email, invoices.total]
    limit: 500
    column_limit: 50
    show_view_names: false
  
  - name: add_a_unique_name_1462219742897
    title: Invoice Charges
    type: table
    model: segment_stripe
    explore: calendar
    dimensions: [charges.created_date, charges.received_date, charges.failure_code,
      charges.currency, charges.paid, charges.days_until_received, charges.status, charges.refunded]
    measures: [charges.total_gross_amount, charges.total_refunds, charges.total_failed_charges,
      charges.total_net_amount]
    filters:
      invoices.id: in^_80bEWMNEErTWfo
    sorts: [charges.created_date desc]
    limit: 500
  
  - name: add_a_unique_name_1462219744885
    title: Total Net Charges
    type: single_value
    model: segment_stripe
    explore: calendar
    measures: [charges.total_net_amount]
    filters:
      invoices.id: in^_80bEWMNEErTWfo
    sorts: [charges.total_net_amount desc]
    limit: 500
    font_size: small
    value_format: ''
    text_color: black
  
  - name: add_a_unique_name_1462219746929
    title: Total Gross Charges
    type: single_value
    model: segment_stripe
    explore: calendar
    measures: [charges.total_gross_amount]
    filters:
      invoices.id: in^_80bEWMNEErTWfo
    sorts: [charges.total_gross_amount desc]
    limit: 500
    font_size: small
    value_format: ''
    text_color: black
  
  - name: add_a_unique_name_1462219749096
    title: Total Failed Charges Amount
    type: single_value
    model: segment_stripe
    explore: calendar
    measures: [charges.charge_count]
    filters:
      charges.status: failed
      invoices.id: in^_80bEWMNEErTWfo
    sorts: [charges.charge_count desc]
    limit: 500
    font_size: small
    value_format: ''
    text_color: black
  
  - name: add_a_unique_name_1462219750792
    title: Total Unpaid Invoices Amount
    type: single_value
    model: segment_stripe
    explore: calendar
    measures: [invoices.total_amount_due]
    filters:
      invoices.id: in^_80bEWMNEErTWfo
      invoices.paid: 'No'
    sorts: [invoices.total_amount_due desc]
    limit: 500
    font_size: small
    value_format: ''
    text_color: black
  
  - name: add_a_unique_name_1462219752421
    title: Average Days Until Payment Received
    type: single_value
    model: segment_stripe
    explore: calendar
    measures: [charges.avg_days_until_received]
    filters:
      invoices.id: in^_80bEWMNEErTWfo
    sorts: [charges.outstanding_charge_time desc, charges.avg_days_until_received desc]
    limit: 500
    font_size: small
    text_color: black
  
  - name: add_a_unique_name_1462219754125
    title: Total Charges
    type: single_value
    model: segment_stripe
    explore: calendar
    measures: [charges.charge_count]
    filters:
      invoices.id: in^_80bEWMNEErTWfo
    sorts: [charges.charge_count desc]
    limit: 500
    font_size: small
    value_format: ''
    text_color: black
  
  - name: add_a_unique_name_1462219755769
    title: Total Failed Charges
    type: single_value
    model: segment_stripe
    explore: calendar
    measures: [charges.total_failed_charges]
    filters:
      invoices.id: in^_80bEWMNEErTWfo
    sorts: [charges.total_failed_charges desc]
    limit: 500
    font_size: small
    value_format: ''
    text_color: black


