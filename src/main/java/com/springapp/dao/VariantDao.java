package com.springapp.dao;

import com.springapp.entity.Variant;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Arsen Adzhiametov on 7/31/13.
 */
@Component
public class VariantDao {

    @Autowired
    SessionFactory sessionFactory;

    public List<Variant> findAll(){
        return sessionFactory.openSession().createCriteria(Variant.class).list();
    }

}
