package com.navi.service;

import com.navi.interfaces.StudentDaoInterface;
import com.navi.model.Studentdata;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class StudentDataDao implements StudentDaoInterface {


    @Override
    public List<Studentdata> getAll() {
        SessionFactory sessionFactory = new Configuration()
                .configure("META-INF/hibernate.cfg.xml")
                .addAnnotatedClass(Studentdata.class)
                .buildSessionFactory();
        Session currentSession = sessionFactory.getCurrentSession();
        List<Studentdata> theStudents = null;
        try {
            currentSession.beginTransaction();
            theStudents = currentSession
                    .createQuery("from Studentdata ")
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
    public void save(String[] params) {
        SessionFactory sessionFactory = new Configuration()
                .configure("META-INF/hibernate.cfg.xml")
                .addAnnotatedClass(Studentdata.class)
                .buildSessionFactory();
        Session currentSession = sessionFactory.getCurrentSession();
        Studentdata studentdata = new Studentdata();
        studentdata.setName(params[0]);
        studentdata.setCourse(params[1]);
        studentdata.setMatri(Integer.parseInt(params[2]));
        currentSession.save(studentdata);
        currentSession.close();
        sessionFactory.close();

    }

    @Override
    public void update(int id, String[] params) {
        //Get session factory object
        SessionFactory sessionFactory = new Configuration()
                .configure("META-INF/hibernate.cfg.xml")
                .addAnnotatedClass(Studentdata.class)
                .buildSessionFactory();
        //get Current session
        Session currentSession = sessionFactory.getCurrentSession();
        //Get Transaction and start it
        currentSession.getTransaction().begin();

        Studentdata studentdata = currentSession.find(Studentdata.class, id);
        studentdata.setName(params[0]);
        studentdata.setCourse(params[1]);
        studentdata.setMatri(Integer.parseInt(params[2]));

        currentSession.save(studentdata);
        currentSession.getTransaction().commit();

        currentSession.close();
        sessionFactory.close();
    }

    @Override
    public void delete(int id) {
        SessionFactory sessionFactory = new Configuration()
                .configure("META-INF/hibernate.cfg.xml")
                .addAnnotatedClass(Studentdata.class)
                .buildSessionFactory();
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.getTransaction().begin();

        Studentdata studentdata = new Studentdata();
        studentdata.setId(id);
        currentSession.delete(studentdata);

        currentSession.getTransaction().commit();


        currentSession.close();
        sessionFactory.close();

    }
}
