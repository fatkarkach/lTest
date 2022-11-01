import com.Dao.AdmincDao;
import com.Dao.SessionUtil;
import com.model.Promotion;
import com.model.Stock;
import org.hibernate.Session;

import java.util.List;


public class Main {
//
//    public List< Stock > getAllStock() {
//        List<Stock> listOfStock = null;
//        try {
//            Session session = SessionUtil.getCurrentSession();
//            session.getTransaction();
//            session.getTransaction().begin();
//            // get an user object
//
//            listOfStock = session.createQuery("select s from Stock s ", Stock.class).getResultList();
//
//            // commit transaction
//            session.getTransaction().commit();
//            session.close();
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//            System.out.println("error");
//            e.printStackTrace();
//        }
//        return listOfStock;
//    }
//
//    public static void main(final String[] args) throws Exception {
//        AdmincDao admincDao = new AdmincDao();
//        List<Stock> stocks = admincDao.getAllStock();
//        for(Stock stock: stocks){
//            System.out.println("stock : " + stock.getIdStock());
//            for(Promotion promotion: stock.getPromotionsByIdStock()){
//                System.out.println(promotion.getIdPromo() + " " + promotion.getPoints());
//            }
//        }
//    }
}