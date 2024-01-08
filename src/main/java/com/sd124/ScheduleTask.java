package com.sd124;

import com.sd124.model.Products;
import com.sd124.model.PromotionDetails;
import com.sd124.model.Promotions;
import com.sd124.repository.ProductRepository;
import com.sd124.repository.PromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.util.Date;

@Component
public class ScheduleTask {
    @Autowired
    PromotionRepository promotionRepository;

    @Autowired
    ProductRepository productRepository;

    @Scheduled(fixedRate = 10 * 1000) // 10s
    public void run() throws ParseException {
        System.out.println("running schedule task ...");
        Date now = new Date();
        for (Promotions promotion : promotionRepository.findAll()) {
            if (promotion.getStatus() == 1 &&
                    promotion.getEnd_date().getTime() < now.getTime()) {
                promotion.setStatus(0); // het han
                promotionRepository.save(promotion);
            } else if (promotion.getStatus() == 0
                    && promotion.getStart_date().getTime() < now.getTime()
                    && promotion.getEnd_date().getTime() > now.getTime()
            ) {
                promotion.setStatus(1); // bat dau
                promotionRepository.save(promotion);
                for (PromotionDetails detail : promotion.getPromotionDetailsList()) {
                    Products product = detail.getProduct_id();
//                    if (detail.getType() == 1) {
//                        product.setSalePrice(product.getPrice() - detail.getAmount());
//                        productService.update(product);
//                    } else if (detail.getType() == 2) {
//                        product.setSalePrice(
//                                (int) (product.getPrice() * (100 - detail.getPercentage()) / 100)
//                        );
//                        productService.update(product);
//                    }
                    product.setPrice(product.getPrice() - detail.getAmount());
                    productRepository.save(product);
                }
            }
        }
    }
}
