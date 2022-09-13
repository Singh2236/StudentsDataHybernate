package com.navi.interfaces;

import com.navi.model.Studentdata;

import java.util.List;

public interface StudentDaoInterface {
    public List<Studentdata> getAll();
    // will be returning the List of Students

    public void save(String[] params);
    // will be returning the no. of rows affected

    public void update(int id, String[] params);
    // will be returning the no. of rows affected

    public void delete(int id);
    // will be returning the no. of rows affected
}
