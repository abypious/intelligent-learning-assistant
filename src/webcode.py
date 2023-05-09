import os
from flask import *
from werkzeug.utils import secure_filename

obj=Flask(__name__)
obj.secret_key='aaaaaa'


from src.dbconnector import *

@obj.route('/')
def main():
    return render_template("login.html")

@obj.route('/add_expert',methods=['post'])
def add_expert():
    return render_template("add_expert.html")

@obj.route('/add_guidance')
def add_guidance():
    return render_template("add_guidance.html")

@obj.route('/addmaterial')
def addmaterial():
    return render_template("addmaterial.html")

@obj.route('/addtip',methods=['post'])
def addtip():
    return render_template("addtip.html")

@obj.route('/adminhome')
def adminhome():
    return render_template("adminhome.html")

@obj.route('/Expert_details')
def Expert_details():
    qry="SELECT *FROM experts"
    res = select(qry)
    return render_template("Expert_details.html",val=res)

@obj.route('/Expert_home')
def Expert_home():
    return render_template("Expert_home.html")

@obj.route('/Feedback')
def Feedback():
    qry ="SELECT student.*,`feedback`.*FROM student JOIN feedback ON feedback.user_id=student.user_id"
    res = select(qry)
    print(res)

    return render_template("Feedback.html",val=res)

@obj.route('/interaction')
def interaction():
    qry = "SELECT interaction.*,student.std_name FROM interaction JOIN student ON `interaction`.`user_id`=`student`.`user_id` WHERE interaction.exp_id =%s"
    res = selectall(qry, session['lid'])

    return render_template("interaction.html", val=res)


@obj.route('/addresponce')
def addresponce():
    id=request.args.get('id')
    session['rid']=id


    return render_template('addresponse.html')




@obj.route('/sendreply',methods=['post'])
def sendreply():
    responce=request.form['textarea']
    int_id=session['rid']
    qry="INSERT INTO responce VALUES(NULL,%s,%s,CURDATE(),NOW())"
    val=(str(int_id),responce)
    iud(qry,val)

    return '''<script>alert("Response successfully");window.location="/interaction" </script>'''




@obj.route('/Medical_report')
def Medical_report():
    qry="SELECT medical_report.*,student.std_name FROM medical_report JOIN student ON medical_report.user_id=student.user_id WHERE `medical_report`.`exp_id`=%s"
    res=selectall(qry,session['lid'])
    print(session['lid'])
    print(res)




    return render_template("Medical_report.html",val=res)


@obj.route('/Medical_report2')
def Medical_report2():
    return render_template("Medical_report2.html")

@obj.route('/Student_details')
def Student_details():
    qry="SELECT * FROM student"
    res=select(qry)

    return render_template("student_details.html",val=res)

@obj.route('/studentsresponse')

def studentsresponse():
    qry = "SELECT * FROM `student`"
    res = select(qry)
    return render_template('Student_response.html',val=res)

@obj.route("/type_view",methods=['get','post'])
def type_view():
    id=request.args.get('id')
    print(id)
    nm=request.args.get('nm')
    q = 'SELECT `questions`.`mat_type` FROM `questions` JOIN `video_frame` ON `video_frame`.`id`=`questions`.`id` WHERE `std_id`=%s AND `ratio`>0.5 order by `ratio` DESC'
    val= id
    result = selectone(q,val)
    print(result)
    if result is not None:
        return  render_template('type_view.html',val=result,n=nm)
    else:
        return '''<script>alert('No information');window.location='/studentsresponse#about'</script>'''
@obj.route('/viewtip')
def viewtip():
    qry="SELECT * FROM tips WHERE exp_id=%s"
    res=selectall(qry,session['lid'])
    return render_template("viewtip.html",val=res)



@obj.route('/login',methods=['post'])
def login():
    username=request.form['textfield']
    password=request.form['textfield2']
    qry="select * from login where user_name=%s and password=%s"
    value=(username,password)
    result=selectone(qry,value)

    if result is None:
        return '''<script>alert("invalid user");window.location="/" </script>'''

    elif result[3]=="Admin":
        session['lid']=result[0]
        return '''<script>alert("Admin is logging in");window.location="/adminhome"</script>'''

    elif result[3]=="expert":
        session['lid']=result[0]

        return '''<script>alert("Expert is logging in");window.location="/Expert_home"</script>'''

    else:
        return '''<script>alert("Try to login through android");window.location="/" </script>'''

@obj.route('/addingtip',methods=['post'])
def adding_tip():
    tip=request.form['textarea']
    qry="insert into tips values (NULL,%s,%s)"
    values=(tip,session['lid'])
    iud(qry,values)
    return redirect('viewtip')

@obj.route('/deletetip')
def deletetip():
    id=request.args.get('id')
    qry="delete from tips where tips_id=%s"
    val=id
    iud(qry,val)
    return '''<script>alert("Dleted data successfully");window.location="/viewtip"</script>'''

@obj.route('/add_material',methods=['post'])
def add_material():
    mt=request.form['select']
    material=request.files['file']
    fname=secure_filename(material.filename)
    material.save(os.path.join('./static/material/',fname))
    qry="insert into study_materials values(NULL,%s,curdate(),%s,%s)"
    val=(fname,str(session['lid']),mt)
    iud(qry,val)
    return '''<script>alert("Material inserted successfully");window.location="/addmaterial"</script>'''



# @obj.route('/add_expert')
# def add_expert():
#     return render_template('add_expert.html')

@obj.route('/adding_expert',methods=['post','get'])
def adding_expert():
    name = request.form['textfield']
    experience=request.form['textfield2']
    gender=request.form['ra']
    place=request.form['textfield3']
    phone=request.form['textfield4']
    email=request.form['textfield5']
    username=request.form['textfield6']
    password=request.form['textfield7']
    qry="insert into login values(null,%s,%s,'expert')"
    val=(username,password)
    id=iud(qry,val)
    qry="insert into experts values(null,%s,%s,%s,%s,%s,%s,%s)"
    val=(str(id),name,experience,gender,place,phone,email)
    iud(qry,val)
    return  '''<script>alert("insert successfully");window.location="/Expert_details" </script>'''



@obj.route('/expertdelete')
def expertdelete():
    lid=request.args.get('lid')
    qry="delete from experts where lid=%s"
    iud(qry,lid)
    qry="delete from login where user_id=%s"
    iud(qry,lid)


    return'''<script>alert("Expert deleted successfully");window.location="/Expert_details" </script>'''


@obj.route('/expertedit')
def expertedit():
    lid = request.args.get('lid')
    session['eid']=lid
    qry="select * from experts where lid=%s"
    res=selectone(qry, lid)

    return render_template("editexpert.html",value=res)



@obj.route('/expert_edit',methods=['post'])
def expert_edit():
    eid = session['eid']
    name = request.form['textfield']
    experience = request.form['textfield2']
    gender = request.form['ra']
    place = request.form['textfield3']
    phone = request.form['textfield4']
    email = request.form['textfield5']
    qry="update experts set exp_name=%s,experience=%s,gender=%s,place=%s,phone=%s,email=%s where lid=%s"
    val=(name,experience,gender,place,phone,email,eid)
    iud(qry,val)

    return'''<script>alert("Updated successfully");window.location="/Expert_details" </script>'''






obj.run(debug=True)

