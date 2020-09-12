from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
from flask_mail import Mail
import os
from werkzeug.utils import secure_filename
import math

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT=465,
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-password']
)

mail = Mail(app)
local_server = True
if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class Contact(db.Model):

    sni = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(50), nullable=False)
    msg = db.Column(db.String(200), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    phone = db.Column(db.String(12), nullable=False)


class Post(db.Model):

    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    slug = db.Column(db.String(50), nullable=False)
    writtenBy = db.Column(db.String(20), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    content = db.Column(db.String(2000), nullable=False)
    subheading = db.Column(db.String(120), nullable=False)
    img_file = db.Column(db.String(100), nullable=True)


@app.route('/')
def home():
    posts = Post.query.order_by(Post.sno.desc())  # [0:params['no-of-post']]
    last = math.ceil(posts.count()/int(params['no-of-post']))
    page = request.args.get('page')
    if not str(page).isnumeric():
        page = 1
    page = int(page)
    posts = posts[0: page * int(params['no-of-post'])]
    if page == 1:
        new = "/?page=" + str(page + 1)
    if page == last:
        new = "#"
    else:
        new = "/?page=" + str(page + 1)
    return render_template('index.html', params=params, posts=posts, new=new)


@app.route('/about')
def about():
    return render_template('about.html', params=params)


@app.route('/dashboard', methods=['GET', 'POST'])
def login():
    if 'user-name' in session and session['user-name'] == params['admin-name']:
        posts = Post.query.all()
        return render_template('dashboard.html', params=params, posts=posts)

    if request.method == 'POST':
        username = request.form.get('uname')
        password = request.form.get('pass')
        if username == params['admin-name'] and password == params['admin-password']:
            session['user-name'] = username
            posts = Post.query.all()
            return render_template('dashboard.html', params=params, posts=posts)
    return render_template('login.html', params=params)


@app.route('/uploader', methods=['GET', 'POST'])
def uploader():
    if 'user-name' in session and session['user-name'] == params['admin-name']:
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "Uploaded Successfully"


@app.route('/logout')
def logout():
    session.pop('user-name')
    return redirect('/dashboard')


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        message = request.form.get('message')
        phone = request.form.get('phone')
        entry = Contact(name=name, msg=message, date=datetime.now(), email=email, phone=phone)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from' + name,
                          sender=email,
                          recipients=[params['gmail-user']],
                          body=message + '\n' + phone
                          )
    return render_template('contact.html', params=params)


@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    posts = Post.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, posts=posts)


@app.route('/delete/<string:sno>', methods=['GET', 'POST'])
def delete(sno):
    if 'user-name' in session and session['user-name'] == params['admin-name']:
        post = Post.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route('/edit/<string:sno>', methods=['GET', 'POST'])
def edit(sno):
    if 'user-name' in session and session['user-name'] == params['admin-name']:
        if request.method == 'POST':
            title = request.form.get('title')
            subheading = request.form.get('subheading')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            if sno == '0':
                post = Post(title=title, subheading=subheading,
                            slug=slug, content=content, img_file=img_file,
                            date=datetime.now(), writtenBy='Shreya')
                db.session.add(post)
                db.session.commit()
            else:
                post = Post.query.filter_by(sno=sno).first()
                post.title = title
                post.subheading = subheading
                post.slug = slug
                post.content = content
                post.img_file = img_file
                db.session.commit()
                return redirect('/edit/' + sno)
        post = Post.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post)


if __name__ == '__main__':
    app.run(debug=True)
