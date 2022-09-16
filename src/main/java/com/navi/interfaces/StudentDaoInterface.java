package com.navi.interfaces;

import com.navi.model.Student;

import java.util.List;

public interface StudentDaoInterface {
    public List<Student> getAll();
    // will be returning the List of Students

    public void save(String name, String course, int matri);
    // will be returning the no. of rows affected

    public void update(int id, String[] params);
    // will be returning the no. of rows affected

    public void delete(int id);
    // will be returning the no. of rows affected
}
