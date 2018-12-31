package JPA;  
  
import java.util.List;

import javax.persistence.EntityManager;  
import javax.persistence.EntityManagerFactory;  
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.junit.BeforeClass;  
import org.junit.Test;

import Util.EntityManagerUtil;
import model.Administrator;
  
  
public class AdministratorDao {  
    @BeforeClass  
    public static void setUpBeforeClass() throws Exception {  
    }  
  
    @Test  
    public void createTable() {  
        // ������֤���ɱ��Ƿ���ȷ  
        EntityManagerFactory factory = Persistence  
                .createEntityManagerFactory("BookStore");  
        factory.close();  
    }  
  
    @Test  
    public void save(Administrator admin) {  
    	EntityManager em=EntityManagerUtil.getEntityManager();  
        em.getTransaction().begin();  
        em.persist(admin); //�־û�ʵ��  
        em.getTransaction().commit();  
        em.close();  
    }  
    @Test public void update(Administrator admin){  
    	EntityManager em=EntityManagerUtil.getEntityManager();
        em.clear();
        em.getTransaction().begin();  
        em.merge(admin); 
        em.getTransaction().commit();  
        em.close();  
    }  
//  ɾ��
    @Test public void remove(String admin){  
    	EntityManager em=EntityManagerUtil.getEntityManager();
    	Administrator administrator = em.find(Administrator.class,admin); 
        em.getTransaction().begin();
        em.remove(administrator);
        em.getTransaction().commit();  
        em.close();  
    }  
}  