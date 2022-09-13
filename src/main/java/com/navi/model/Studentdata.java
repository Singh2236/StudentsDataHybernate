package com.navi.model;

import javax.persistence.*;

@Entity
public class Studentdata {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "Name")
    private String name;
    @Basic
    @Column(name = "Course")
    private String course;
    @Basic
    @Column(name = "Matri")
    private Integer matri;

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

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public Integer getMatri() {
        return matri;
    }

    public void setMatri(Integer matri) {
        this.matri = matri;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Studentdata that = (Studentdata) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (course != null ? !course.equals(that.course) : that.course != null) return false;
        if (matri != null ? !matri.equals(that.matri) : that.matri != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (course != null ? course.hashCode() : 0);
        result = 31 * result + (matri != null ? matri.hashCode() : 0);
        return result;
    }
}
