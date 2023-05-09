import os
from flask import *
from werkzeug.utils import secure_filename


from src.dbconnector import *

app=Flask(__name__)
app.secret_key='aaaaaa'


@app.route('/login',methods=['post'])
def login():
    username=request.form['username']
    password=request.form['password']
    q="SELECT * FROM `login` WHERE `user_name`=%s AND `password`=%s"
    val=(username,password)
    print(val)
    res=selectone(q,val)
    print(res)
    id=str(res[0])
    if res is None:
        return jsonify({'task':"invalid"})
    else:
        return jsonify({'task':"valid",'id':id})

@app.route('/reg', methods=['GET', 'POST'])
def reg():
    print(request.form)
    username = request.form['username']
    password = request.form['password']
    name = request.form['name']
    dob = request.form['dob']
    place = request.form['place']
    gender = request.form['gender']
    phoneno = request.form['phoneno']
    description=request.form['description']


    qry="insert into login values(null,%s,%s,'user')"
    val=(username,password)
    id=iud(qry,val)
    print(id)

    qry = "insert into student values(null,%s,%s,%s,%s,%s,%s,%s)"
    val= (name,dob,place,gender,phoneno,description,str(id))
    iud(qry,val)
    return jsonify({'task': "success"})

@app.route('/interaction',methods=['GET','POST'])
def interaction():
    print(request.form)
    userid=request.form['userid']
    reportinfo=request.form['reportinfo']
    expid=request.form['expid']
    qry = "insert into interaction values(null,%s,%s,%s,curdate(),curtime())"
    val=(userid,reportinfo,expid)
    iud(qry,val)
    return jsonify({'task': "success"})































@app.route('/studymaterial',methods=['GET','POST'])
def studymaterial():
    qry = "select * from study_materials"

    res=androidselectallnew(qry)
    return jsonify(res)

# @app.route('/guidance',methods=['GET','POST'])
# def guidance():
#     reportid=request.form['reportid']
#     expid=request.form['expid']
#     ginfo=request.form['ginfo']
#     qry="insert into guidance values(null,%s,%s,%s)"
#     val=(reportid,expid,ginfo)
#     iud(qry,val)
#     return jsonify({'task': "success"})

@app.route('/feedback',methods=['GET','POST'])
def feedback():
    userid=request.form['userid']
    parentfb=request.form['parentfb']
    qry="insert into feedback values(null,%s,%s,curdate())"
    val = (userid, parentfb)
    iud(qry,val)
    return jsonify({'task': "success"})


@app.route('/expert',methods=['GET','POST'])
def expert():
    qry="select * from experts"
    res = androidselectallnew(qry)
    return jsonify(res)

@app.route('/responce',methods=['GET','POST'])
def responce():
    print(request.form)
    id=request.form['id']
    qry="SELECT `interaction`.*,`responce`.* FROM `responce` JOIN `interaction` ON `interaction`.`intr_id`=`responce`.`intr_id` WHERE `interaction`.`user_id`=%s"
    val=id
    res = androidselectall(qry,val)
    return jsonify(res)



@app.route('/medicalreport',methods=['post'])
def medicalreport():
    print(request.form)
    mt=request.form['expid']
    id=request.form['lid']
    material=request.files['file']
    print(material)
    fname=secure_filename(material.filename)
    print(fname)
    material.save(os.path.join('./static/report/',fname))
    qry="insert into medical_report values(NULL,%s,%s,%s)"
    val=(id,fname,mt)
    iud(qry,val)
    return jsonify({'task': "success"})



app.run(port=5000,host="0.0.0.0")