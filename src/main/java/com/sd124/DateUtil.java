package com.sd124;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    public static String formatDate(Date date, String fmt) {
        SimpleDateFormat sdf = new SimpleDateFormat(fmt);
        try {
            return sdf.format(date);
        }catch(Exception e){
            e.printStackTrace();
            return "";
        }
    }
}
