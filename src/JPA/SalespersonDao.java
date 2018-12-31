package JPA;  
  
import java.util.List;

import javax.persistence.EntityManager;  
import javax.persistence.EntityManagerFactory;  
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.junit.BeforeClass;  
import org.junit.Test;

import Util.EntityManagerUtil;
import model.Salesperson;  
  
  
public class SalespersonDao {  
    @BeforeClass  
    public static void setUpBeforeClass() throws Exception {  
    }  
  
    @Test  
    public void createTable() {  
        // 可以验证生成表是否正确  
        EntityManagerFactory factory = Persistence  
                .createEntityManagerFactory("BookStore");  
        factory.close();  
    }  
  
    @Test  
    public void save(Salesperson sales) {  
    	EntityManager em=EntityManagerUtil.getEntityManager();  
        em.getTransaction().begin();  
        em.persist(sales); //持久化实体  
        em.getTransaction().commit();  
        em.close();  
    }  
    @Test public void update(Salesperson sales){  
    	EntityManager em=EntityManagerUtil.getEntityManager();
        em.clear();
        em.getTransaction().begin();  
        em.merge(sales); 
        em.getTransaction().commit();  
        em.close();  
    }  
    @Test public List<Salesperson> getSalesperson(){
  		EntityManager em=EntityManagerUtil.getEntityManager();
  		Query query=em.createNamedQuery("Salesperson.findAll");
  		List<Salesperson> salesperson=query.getResultList();
  		return salesperson;
  	}
    
//  删除
    @Test public void remove(String sales){  
    	EntityManager em=EntityManagerUtil.getEntityManager();
    	Salesperson salesperson = em.find(Salesperson.class,sales); 
        em.getTransaction().begin();
        em.remove(salesperson);
        em.getTransaction().commit();  
        em.close();  
    }  
    @Test public Salesperson find(String salesid){  
    	EntityManager em=EntityManagerUtil.getEntityManager();
    	Salesperson salesperson = (Salesperson)em.find(Salesperson.class, salesid); 
		return salesperson;  
    }  
    @Test public List<Salesperson> getSalesById(String salesid){
		EntityManager em=EntityManagerUtil.getEntityManager();
		String jpql="SELECT s FROM Salesperson s where s.salespersonid like :salespersonid";
		Query query=em.createQuery(jpql);
		query.setParameter("salespersonid", "%"+salesid+"%").getResultList();
		List<Salesperson> salesperson = query.getResultList();
		return salesperson;
	}
}  