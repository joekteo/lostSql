User.destroy_all
Duty.destroy_all
Tag.destroy_all
Article.destroy_all

users = User.create([
  {
    name: "Sam",
    email: "sammy@munat.com"
  },
  {
    name: "Sally",
    email: "sally@munat.com"
  }
])

tags = Tag.create([
  { name: "red" },
  { name: "green" },
  { name: "blue" }
])

duties = Duty.create([
  { title: "Lie" },
  { title: "Cheat" },
  { title: "Steal" }
])

jobs = Job.create([
  {
    user: users[0],
    duty: duties[0],
    starts_on: Date.today - 7.days,
    ends_on: Date.today + 7.days
  },
  {
    user: users[0],
    duty: duties[1],
    starts_on: Date.today - 6.days,
    ends_on: Date.today + 8.days
  },
  {
    user: users[1],
    duty: duties[1],
    starts_on: Date.today - 5.days,
    ends_on: Date.today + 9.days
  },
  {
    user: users[1],
    duty: duties[2],
    starts_on: Date.today - 4.days,
    ends_on: Date.today + 10.days
  }
])

articles = Article.create([
  {
    title: "The First Article",
    body: "This article has a nice body.",
    user: users[0],
    tags: tags[0..1]
  },
  {
    title: "The Other Article",
    body: "This article has a really nice body.",
    user: users[1],
    tags: tags[1..2]
  }
])

comments = Comment.create([
  {
    body: "A comment on the first article",
    user: users[1],
    article: articles[0]
  },
  {
    body: "A comment on the second article",
    user: users[0],
    article: articles[1]
  }
])

Comment.create([
  {
    body: "A comment on the first comment",
    user: users[0],
    comment: comments[0]
  }
])