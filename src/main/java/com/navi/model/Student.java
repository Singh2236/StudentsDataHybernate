package com.navi.model;

import javax.persistence.*;

@Entity
public class Student {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "Name")
    private String name;
    @Basic
    @Column(name = "Matri")
    private int matri;
    @Basic
    @Column(name = "Course")
    private String course;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getMatri() {
        return matri;
    }

    public void setMatri(int matri) {
        this.matri = matri;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Student student = (Student) o;

        if (id != student.id) return false;
        if (matri != student.matri) return false;
        if (name != null ? !name.equals(student.name) : student.name != null) return false;
        if (course != null ? !course.equals(student.course) : student.course != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + matri;
        result = 31 * result + (course != null ? course.hashCode() : 0);
        return result;
    }
}
