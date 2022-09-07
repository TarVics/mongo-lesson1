use users

db.users.find()

// 1) Знайти всіх користувачів в кого вік менше за 20
db.users.find({age:{$lt: 20}})

// 2) Знайти всіх користувачів в котрих хоча б один з батьків Tamara або Petro
db.users.find({parents:{$in: ['Tamara', 'Petro']}})

// 3) Знайти всіх користувачів які вивчають js
db.users.find({studying:'js'})

// 4) Знайти всіх користувачів котрі вивчають тільки один предмет и додати їм java
db.users.updateMany({studying:{$size:1}}, {$push:{studying:'java'}})

// 5) Знайти всіх користувачів номера будинків яких знаходяться в межах 1-20
db.users.find({$and:[{'address.house':{$gte:1}},{'address.house':{$lte:20}}]})

// 6) Знайти всіх користувачів в яких назва вулиці містить пробіл
db.users.find({'address.street':/\s/})

// 7) Видалити всіх користувачів в котрих немає поля studying
db.users.deleteMany({studying:{$exists: 0}})

// 8) Знайти всіх користувачів в котрих в ім'я когось с батьків закінчується на 'na'
db.users.find({parents:/na$/})

// 9) Всім користувачам котрі не вивчають python додати його
db.users.updateMany({studying:{$ne:'python'}}, {$push:{studying:'python'}})

// 10) Посортувати користувачів по рейтингу та по номеру квартири (що то що то, від більшого меншого)
db.users.find({}).sort({rating:-1,'address.flat':-1})