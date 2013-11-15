package com.springapp.dao;

import com.springapp.entity.Vote;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Arsen Adzhiametov on 7/31/13.
 */
@Component
public class VoteDao {

    @Autowired
    SessionFactory sessionFactory;

    public List<Vote> findAll(){
        return sessionFactory.openSession().createCriteria(Vote.class).list();
    }

    public void increment(Integer idVariant) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("update vote SET voteCount=voteCount+1 where variant=?");
        query.setInteger(0, idVariant);
        query.executeUpdate();
        tx.commit();
    }
}
