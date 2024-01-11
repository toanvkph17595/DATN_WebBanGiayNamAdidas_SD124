package com.sd124.service;

import com.sd124.dto.District;
import com.sd124.dto.Province;
import com.sd124.dto.Ward;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@Service
public class LocationService {
    final String token = "03192cdb-9b27-11ee-96dc-de6f804954c9";
    @Autowired
    RestTemplate restTemplate;

    public List<Province> getProvinces() {
        HttpHeaders headers = new HttpHeaders();
        headers.set("token", token);
        HttpEntity<String> entity = new HttpEntity<>(headers);

        var res = restTemplate.exchange("https://online-gateway.ghn.vn/shiip/public-api/master-data/province",
                HttpMethod.GET, entity, java.util.Map.class).getBody();

        var data = (List) res.get("data");
        List<Province> lst = new ArrayList<>();
        for(Object obj : data){
            var item = (Map<String, Object>) obj;
            Province province = new Province();
            province.setProvinceID(item.get("ProvinceID").toString());
            province.setProvinceName(item.get("ProvinceName").toString());
            lst.add(province);
        }
        return lst;
    }

    public List<District> getDistricts(String province_id) {
        HttpHeaders headers = new HttpHeaders();
        headers.set("token", token);

        HttpEntity<String> entity = new HttpEntity<>(headers);

        var res = restTemplate.exchange("https://online-gateway.ghn.vn/shiip/public-api/master-data/district?province_id=" + province_id,
                HttpMethod.GET, entity, java.util.Map.class).getBody();

        var data = (List) res.get("data");
        List<District> lst = new ArrayList<>();
        for(Object obj : data){
            var item = (Map<String, Object>) obj;
            District district = new District();
            district.setDistrictID(item.get("DistrictID").toString());
            district.setDistrictName(item.get("DistrictName").toString());
            lst.add(district);
        }
        return lst;
    }

    public List<Ward> getWards(String district_id) {
        HttpHeaders headers = new HttpHeaders();
        headers.set("token", token);

        HttpEntity<String> entity = new HttpEntity<>(headers);

        var res = restTemplate.exchange("https://online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id=" + district_id,
                HttpMethod.GET, entity, java.util.Map.class).getBody();

        var data = (List) res.get("data");
        List<Ward> lst = new ArrayList<>();
        for(Object obj : data){
            var item = (Map<String, Object>) obj;
            Ward ward = new Ward();
            ward.setWardCode(item.get("WardCode").toString());
            ward.setWardName(item.get("WardName").toString());
            lst.add(ward);
        }
        return lst;
    }

    public int getFee(String from_district_id, String to_district_id, int weight) {
        HttpHeaders headers = new HttpHeaders();
        headers.set("token", token);

        HttpEntity<String> entity = new HttpEntity<>(headers);

        var res = restTemplate.exchange("https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/available-services?shop_id=4769233&from_district="+ from_district_id + "&to_district=" + to_district_id,
                HttpMethod.GET, entity, java.util.Map.class).getBody();

        var service = (Map<String, Object>) ((List) res.get("data")).get(0);
        var service_id = Integer.parseInt(service.get("service_id").toString());
        res = restTemplate.exchange("https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee?service_id="+ service_id + "&from_district_id="+ from_district_id + "&to_district_id=" + to_district_id + "&weight=" + weight,
                HttpMethod.GET, entity, java.util.Map.class).getBody();

        var data = (Map<String, Object>) res.get("data");
        return Integer.parseInt(data.get("total").toString());
    }
}

