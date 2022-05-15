
from prettytable import PrettyTable
import string    
import random
import mysql.connector

#untuk koneksi db
db = mysql.connector.connect(
    host='localhost',
    database='dbuas',
    user='root',
    password='')
cur = db.cursor()

def main():
    #untuk login        
    def auth(username,password):
        quser = "SELECT username,password,nama,jabatan from users WHERE username = '%s'" % (username)
        cur.execute(quser)
        userauth = cur.fetchone()
        
        if  userauth :
            if password == userauth[1]:
                pass
                mhsmenu(username)
            else:
                print('Username/Password Salah')
                main()
        else:
            print('Username/Password Salah')
            main()
    
    #Menu Untuk Mahasiswa    
    def mhsmenu(username):
        qselect = "SELECT nomorpokok FROM users WHERE username = '%s'" %(username)
        cur.execute(qselect)
        npm = cur.fetchone()
        npm = npm[0]
        print('========================')
        print('Menu Mahasiswa')
        print('========================')
        menus = ['Cek Kehadiran', 'Lakukan Presensi', 'Keluar']
        for i,listmenu in enumerate(menus):
            print(1+i,".",listmenu)
        inpmenu = input("Pilih Menu: ")
        if inpmenu == '1':
            cekKehadiran(npm)
        elif inpmenu == '2':
            presensi(npm)
        elif inpmenu == '3':
            print("Terima Kasih")
            exit()
        else:
            print("Salah Input")
            mhsmenu(mhsmenu)

    #menu untuk cek kehadiran oleh mahasiswa        
    def cekKehadiran(npm):
        qselect = "SELECT matkul,p1,p2,p3,p4 from abs%s" % (npm)
        cur.execute(qselect)
        result = cur.fetchall()
        columns = ['Mata Kuliah','Pertemuan 1','Pertemuan 2','Pertemuan 3','Pertemuan 4']
        tbl = PrettyTable()
        tbl.field_names = columns
        for row in result:
            tbl.add_row(row)  
        print(tbl)  
        input("Tekan Enter Untuk Melanjutkan")
        mhsmenu(username)

    #Menu untuk Presensi oleh mahasiswa
    def presensi(npm):
        npm = npm
        token = input("Masukkan Token: ")
        qselectmatkul = "SELECT matkul,pertemuan,token FROM matkultoken WHERE token='%s'" %(token)
        cur.execute(qselectmatkul)
        result = cur.fetchone()
        if result:
            pass
        else:
            print("Token Yang Anda Masukkan Salah")
            presensi(npm)
        matkul = result[0]
        pertemuan = result[1]
        
        # print(result)
        qabsupdate = "UPDATE abs%s SET p%s = 'Hadir' WHERE matkul = '%s'" %(npm,pertemuan,matkul)
        cur.execute(qabsupdate)
        db.commit()
        if cur.rowcount > 0:
            print("Terima Kasih Telah Melakukan Presensi")
            input("Tekan Enter Untuk Kembali Ke Menu")
            mhsmenu(username)
        else:
            print("Anda Telah Melakukan Presensi")
            input("Tekan Enter Untuk Kembali Ke Menu")
            mhsmenu(username)
 
    print('========================')
    print('SISTEM AKADEMIK')
    print('========================')

    #menu untuk masukan username password
    username = input('Username: ')
    password = input('Password: ')
    auth(username,password)

main()