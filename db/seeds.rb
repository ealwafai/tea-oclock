# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer_1 = Customer.create!(id: 1, first_name: 'Rick', last_name: 'Sanchez', email: 'rick@email.com', address: '111 Main St. Denver, CO 80123')
customer_2 = Customer.create!(id: 2, first_name: 'Morty', last_name: 'Smith', email: 'morty@email.com', address: '222 Main St. Denver, CO 80123')
customer_3 = Customer.create!(id: 3, first_name: 'Jerry', last_name: 'Smith', email: 'jerry@email.com', address: '333 Main St. Denver, CO 80123')

tea_1 = Tea.create!(id: 1, title: 'Green', description: 'A Green Tea', temperature: 200, brew_time: 120)
tea_2 = Tea.create!(id: 2, title: 'Black', description: 'A black Tea', temperature: 210, brew_time: 120)
tea_3 = Tea.create!(id: 3, title: 'White', description: 'A white Tea', temperature: 220, brew_time: 180)
tea_4 = Tea.create!(id: 4, title: 'Oolong', description: 'An oolong Tea', temperature: 230, brew_time: 150)
tea_5 = Tea.create!(id: 5, title: 'Puerh', description: 'A puerh Tea', temperature: 240, brew_time: 160)

subscription_1 = Subscription.create!(id: 1, title: 'Weekly subscription', price: 7.99, frequency: 0)
subscription_2 = Subscription.create!(id: 2, title: 'Monthly subscription', price: 5.99, frequency: 2)

customer_1.memberships.create!(tea_id: tea_1.id, subscription_id: subscription_1.id )
customer_1.memberships.create!(tea_id: tea_2.id, subscription_id: subscription_1.id )
customer_1.memberships.create!(tea_id: tea_3.id, subscription_id: subscription_2.id )
customer_1.memberships.create!(tea_id: tea_4.id, subscription_id: subscription_2.id )
customer_1.memberships.create!(tea_id: tea_5.id, subscription_id: subscription_2.id )
customer_2.memberships.create!(tea_id: tea_1.id, subscription_id: subscription_1.id )
customer_2.memberships.create!(tea_id: tea_1.id, subscription_id: subscription_2.id )
customer_3.memberships.create!(tea_id: tea_4.id, subscription_id: subscription_1.id )
customer_3.memberships.create!(tea_id: tea_3.id, subscription_id: subscription_2.id )
customer_3.memberships.create!(tea_id: tea_2.id, subscription_id: subscription_2.id )
