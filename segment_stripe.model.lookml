- connection: segment_sources

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: accounts

- explore: charges
  joins:
    - join: customers
      type: left_outer 
      sql_on: ${charges.customer_id} = ${customers.id}
      relationship: many_to_one

    - join: invoices
      type: left_outer 
      sql_on: ${charges.invoice_id} = ${invoices.id}
      relationship: many_to_one

    - join: discounts
      type: left_outer 
      sql_on: ${customers.discount_id} = ${discounts.id}
      relationship: many_to_one

    - join: subscriptions
      type: left_outer 
      sql_on: ${invoices.subscription_id} = ${subscriptions.id}
      relationship: many_to_one

    - join: plans
      type: left_outer 
      sql_on: ${subscriptions.plan_id} = ${plans.id}
      relationship: many_to_one


- explore: customers
  joins:
    - join: discounts
      type: left_outer 
      sql_on: ${customers.discount_id} = ${discounts.id}
      relationship: many_to_one


- explore: discounts
  joins:
    - join: customers
      type: left_outer 
      sql_on: ${discounts.customer_id} = ${customers.id}
      relationship: many_to_one


- explore: invoice_items
  joins:
    - join: customers
      type: left_outer 
      sql_on: ${invoice_items.customer_id} = ${customers.id}
      relationship: many_to_one

    - join: invoices
      type: left_outer 
      sql_on: ${invoice_items.invoice_id} = ${invoices.id}
      relationship: many_to_one

    - join: plans
      type: left_outer 
      sql_on: ${invoice_items.plan_id} = ${plans.id}
      relationship: many_to_one

    - join: subscriptions
      type: left_outer 
      sql_on: ${invoice_items.subscription_id} = ${subscriptions.id}
      relationship: many_to_one

    - join: discounts
      type: left_outer 
      sql_on: ${customers.discount_id} = ${discounts.id}
      relationship: many_to_one

    - join: charges
      type: left_outer 
      sql_on: ${invoices.charge_id} = ${charges.id}
      relationship: many_to_one


- explore: invoice_lines
  joins:
    - join: subscriptions
      type: left_outer 
      sql_on: ${invoice_lines.subscription_id} = ${subscriptions.id}
      relationship: many_to_one

    - join: customers
      type: left_outer 
      sql_on: ${subscriptions.customer_id} = ${customers.id}
      relationship: many_to_one

    - join: discounts
      type: left_outer 
      sql_on: ${subscriptions.discount_id} = ${discounts.id}
      relationship: many_to_one

    - join: plans
      type: left_outer 
      sql_on: ${subscriptions.plan_id} = ${plans.id}
      relationship: many_to_one


- explore: invoices
  joins:
    - join: charges
      type: left_outer 
      sql_on: ${invoices.charge_id} = ${charges.id}
      relationship: many_to_one

    - join: customers
      type: left_outer 
      sql_on: ${invoices.customer_id} = ${customers.id}
      relationship: many_to_one

    - join: subscriptions
      type: left_outer 
      sql_on: ${invoices.subscription_id} = ${subscriptions.id}
      relationship: many_to_one

    - join: discounts
      type: left_outer 
      sql_on: ${customers.discount_id} = ${discounts.id}
      relationship: many_to_one

    - join: plans
      type: left_outer 
      sql_on: ${subscriptions.plan_id} = ${plans.id}
      relationship: many_to_one


- explore: plans

- explore: refunds
  joins:
    - join: charges
      type: left_outer 
      sql_on: ${refunds.charge_id} = ${charges.id}
      relationship: many_to_one

    - join: customers
      type: left_outer 
      sql_on: ${charges.customer_id} = ${customers.id}
      relationship: many_to_one

    - join: invoices
      type: left_outer 
      sql_on: ${charges.invoice_id} = ${invoices.id}
      relationship: many_to_one

    - join: discounts
      type: left_outer 
      sql_on: ${customers.discount_id} = ${discounts.id}
      relationship: many_to_one

    - join: subscriptions
      type: left_outer 
      sql_on: ${invoices.subscription_id} = ${subscriptions.id}
      relationship: many_to_one

    - join: plans
      type: left_outer 
      sql_on: ${subscriptions.plan_id} = ${plans.id}
      relationship: many_to_one


- explore: subscriptions
  joins:
    - join: customers
      type: left_outer 
      sql_on: ${subscriptions.customer_id} = ${customers.id}
      relationship: many_to_one

    - join: discounts
      type: left_outer 
      sql_on: ${subscriptions.discount_id} = ${discounts.id}
      relationship: many_to_one

    - join: plans
      type: left_outer 
      sql_on: ${subscriptions.plan_id} = ${plans.id}
      relationship: many_to_one


