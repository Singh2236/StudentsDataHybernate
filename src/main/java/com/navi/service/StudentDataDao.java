package com.navi.service;

import com.navi.interfaces.StudentDaoInterface;
import com.navi.model.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;

public class StudentDataDao implements StudentDaoInterface {


    @Override
    public List<Student> getAll() {
        SessionFactory sessionFactory = new Configuration()
                .configure("META-INF/hibernate.cfg.xml")
                .addAnnotatedClass(Student.class)
                .buildSessionFactory();
        Session currentSession = sessionFactory.getCurrentSession();
        List<Student> theStudents = null;
        try {
            currentSession.beginTransaction();
            theStudents = currentSession
                    .createQuery("from Student ")
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            currentSession.getTransaction().commit();
            currentSession.close();
        }

        return theStudents;
    }

    @Override
    public void save(String name, String course, int matri) {
        SessionFactory sessionFactory = new Configuration()
                .configure("META-INF/hibernate.cfg.xml")
                .addAnnotatedClass(Student.class)
                .buildSessionFactory();

        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.getTransaction().begin();

        Student studentdata = new Student();
        studentdata.setName(name);
        studentdata.setCourse(course);
        studentdata.setMatri(matri);

        currentSession.save(studentdata);

        currentSession.getTransaction().commit();
        currentSession.close();
        sessionFactory.close();

    }

    @Override
    public void update(int id, String[] params) {
        //Get session factory object
        SessionFactory sessionFactory = new Configuration()
                .configure("META-INF/hibernate.cfg.xml")
                .addAnnotatedClass(Student.class)
                .buildSessionFactory();
        //get Current session
        Session currentSession = sessionFactory.getCurrentSession();
        //Get Transaction and start it
        currentSession.getTransaction().begin();

        Student student = currentSession.find(Student.class, id);
        student.setName(params[0]);
        student.setCourse(params[1]);
        student.setMatri(Integer.parseInt(params[2]));

        currentSession.save(student);
        currentSession.getTransaction().commit();

        currentSession.close();
        sessionFactory.close();
    }

    @Override
    public void delete(int id) {
        SessionFactory sessionFactory = new Configuration()
                .configure("META-INF/hibernate.cfg.xml")
                .addAnnotatedClass(Student.class)
                .buildSessionFactory();
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.getTransaction().begin();

        Student student = new Student();
        student.setId(id);
        currentSession.delete(student);

        currentSession.getTransaction().commit();


        currentSession.close();
        sessionFactory.close();

    }
    //todo: check this out
    public boolean isIdExists(int id){
        SessionFactory sessionFactory = new Configuration()
                .configure("META-INF/hibernate.cfg.xml")
                .addAnnotatedClass(Student.class)
                .buildSessionFactory();
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.getTransaction().begin();

        String hql = "SELECT s.id FROM Student s";
        Query query = currentSession.createQuery(hql);
        List results = query.list();

        if (results.contains(id)) {
            return true;
        }
        return false;
    }
}
