package tk.freepenguins.tools;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

/**
 * Created by danfox on 24.06.17.
 */
@Repository
public class HibernateSF {

    @Autowired
    private SessionFactory sessionFactory;

    public <T> Serializable createRecord(final T entity) {
        return sessionFactory.getCurrentSession().save(entity);
    }

    public <T> void deleteRecord(final T entity) {
        sessionFactory.getCurrentSession().delete(entity);
    }

    public <T> void deleteRecord(Serializable id, Class<T> entityClass) {
        T entity = getRecordById(id, entityClass);
        deleteRecord(entity);
    }

    public <T> T updateRecord(final T entity) {
        sessionFactory.getCurrentSession().update(entity);
        return entity;
    }

    @SuppressWarnings("unchecked")
    public <T> T getRecordById(Serializable id, Class<T> entityClass) {
        return (T) sessionFactory.getCurrentSession().get(entityClass, id);
    }

    @SuppressWarnings("unchecked")
    public <T> List<T> getAllRecords(Class<T> entityClass) {
        return sessionFactory.getCurrentSession().createQuery(" FROM "+entityClass.getName()).list();
    }

    @SuppressWarnings("rawtypes")
    public <T> List getAllRecords(String sqlQuery) {return sessionFactory.getCurrentSession().createNativeQuery(sqlQuery).list();}
}