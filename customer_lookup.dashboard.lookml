- dashboard: customer_lookup
  title: Customer Lookup
  layout: tile
  tile_size: 100

#  filters:

  elements:

  - name: add_a_unique_name_1462199859857
    title: Customer Detail
    type: looker_single_record
    model: segment_stripe
    explore: customer
    dimensions: [customers.email, customers.created_date, customers.delinquent, customers.currency]
    filters:
      customers.email: 8624702d9c382858919e0b9005e85b64cfa2bc92@gmail.com
    sorts: [customers.email]
    limit: 1
    show_view_names: false
  
  - name: add_a_unique_name_1462199864893
    title: Total Gross Charges
    type: single_value
    model: segment_stripe
    explore: calendar
    measures: [charges.total_gross_amount]
    filters:
      customers.email: 8624702d9c382858919e0b9005e85b64cfa2bc92@gmail.com
    sorts: [charges.total_gross_amount desc]
    limit: 500
    font_size: small
    value_format: ''
    text_color: black
  
  - name: add_a_unique_name_1462199867389
    title: Total Net Charges
    type: single_value
    model: segment_stripe
    explore: calendar
    measures: [charges.total_net_amount]
    filters:
      customers.email: 8624702d9c382858919e0b9005e85b64cfa2bc92@gmail.com
    sorts: [charges.total_net_amount desc]
    limit: 500
    font_size: small
    value_format: ''
    text_color: black
  
  - name: add_a_unique_name_1462199869537
    title: Total Charges
    type: single_value
    model: segment_stripe
    explore: calendar
    measures: [charges.charge_count]
    filters:
      customers.email: 8624702d9c382858919e0b9005e85b64cfa2bc92@gmail.com
    sorts: [charges.charge_count desc]
    limit: 500
    font_size: small
    value_format: ''
    text_color: black
  
  - name: add_a_unique_name_1462199871781
    title: Total Refund Count
    type: single_value
    model: segment_stripe
    explore: calendar
    measures: [charges.refund_count]
    filters:
      customers.email: 8624702d9c382858919e0b9005e85b64cfa2bc92@gmail.com
    sorts: [charges.refund_count desc]
    limit: 500
    font_size: small
    value_format: ''
    text_color: black
  
  - name: add_a_unique_name_1462199873959
    title: Total Failed Charges Count
    type: single_value
    model: segment_stripe
    explore: calendar
    measures: [charges.charge_count]
    filters:
      charges.status: failed
      customers.email: 8624702d9c382858919e0b9005e85b64cfa2bc92@gmail.com
    sorts: [charges.charge_count desc]
    limit: 500
    font_size: small
    value_format: ''
    text_color: black
  
  - name: add_a_unique_name_1462199876088
    title: Total Failed Charges
    type: single_value
    model: segment_stripe
    explore: calendar
    measures: [charges.total_failed_charges]
    filters:
      customers.email: 8624702d9c382858919e0b9005e85b64cfa2bc92@gmail.com
    sorts: [charges.total_failed_charges desc]
    limit: 500
    font_size: small
    value_format: ''
    text_color: black
  
  - name: add_a_unique_name_1462199878233
    title: Total Refunded Charges
    type: single_value
    model: segment_stripe
    explore: calendar
    measures: [charges.total_refunds]
    filters:
      customers.email: 8624702d9c382858919e0b9005e85b64cfa2bc92@gmail.com
    sorts: [charges.total_refunds desc]
    limit: 500
    font_size: small
    value_format: ''
    text_color: black
  
  - name: add_a_unique_name_1462199880688
    title: Customer Invoices
    type: table
    model: segment_stripe
    explore: calendar
    dimensions: [invoices.id, invoices.date_date, invoices.closed, invoices.paid, invoices.attempt_count]
    measures: [invoices.total_amount_due]
    filters:
      customers.email: 8624702d9c382858919e0b9005e85b64cfa2bc92@gmail.com
    sorts: [invoices.paid, invoices.date_date]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    table_theme: white
    limit_displayed_rows: false
  
  - name: add_a_unique_name_1462199883129
    title: Charges Over Time
    type: looker_column
    model: segment_stripe
    explore: calendar
    dimensions: [calendar.cal_date_date]
    measures: [charges.total_net_amount, charges.charge_count]
    filters:
      calendar.cal_date_month: 90 days ago for 45 days
      customers.email: 8624702d9c382858919e0b9005e85b64cfa2bc92@gmail.com
    sorts: [calendar.cal_date_date]
    limit: 500
    stacking: ''
    colors: ['#a6cee3', '#1f78b4', '#b2df8a', '#33a02c', '#fb9a99', '#e31a1c', '#fdbf6f',
      '#ff7f00', '#cab2d6', '#6a3d9a', '#edbc0e', '#b15928']
    show_value_labels: false
    label_density: 2
    font_size: small
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    series_types:
      charges.total_net_amount: line
    limit_displayed_rows: false
    y_axis_combined: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_labels: false




