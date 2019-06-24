Comment.delete_all
Like.delete_all
Medium.delete_all
Post.delete_all
User.delete_all

gabriel_user = User.create(
  first_name: 'Gabriel',
  last_name: 'García Marquez',
  birthday: '06-03-1927',
  private_email: true,
  email: 'gabo@gmail.com'
)

julio_user = User.create(
  first_name: 'Julio',
  last_name: 'Ribeyro',
  birthday: '31-08-1929',
  private_email: true,
  email: 'julio@gmail.com'
)

ernesto_user = User.create(
  first_name: 'Ernesto',
  last_name: 'Sabato',
  birthday: '24-06-191',
  private_email: true,
  email: 'ernesto@sabato.com'
)

julio_user.follow(gabriel_user)
ernesto_user.follow(gabriel_user)
ernesto_user.follow(julio_user)

gabrielmedium1 = Medium.create(name: 'image.jpg')
gabrielpost1 = gabriel_user.publish('my first post', gabrielmedium1)
julio_user.like(gabrielpost1)
ernesto_user.like(gabrielpost1)
julio_user.comment('Cute!', gabrielpost1)


gabrielmedium2 = Medium.create(name: 'video.mp4')
gabrielpost2 = gabriel_user.publish('my first post', gabrielmedium2)
julio_user.like(gabrielpost2)
julio_user.comment('Awesome!!!', gabrielpost2)

juliomedium1 = Medium.create(name: 'image1.jpg')
juliomedium2 = Medium.create(name: 'image2.jpg')
juliopost1 = julio_user.publish('my first post', juliomedium1, juliomedium2)
gabriel_user.like(juliopost1)
