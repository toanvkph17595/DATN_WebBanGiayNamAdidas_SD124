package com.sd124.controller.api;

import com.sd124.dto.District;
import com.sd124.dto.Province;
import com.sd124.dto.Ward;
import com.sd124.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class RestAPIController {
    @Autowired
    LocationService locationService;

    @GetMapping("/provinces")
    public List<Province> getProvinces() {
        return locationService.getProvinces();
    }

    @GetMapping("/districts/{province_id}")
    public List<District> getDistricts(@PathVariable String province_id) {
        return locationService.getDistricts(province_id);
    }

    @GetMapping("/wards/{district_id}")
    public List<Ward> getWards(@PathVariable String district_id) {
        return locationService.getWards(district_id);
    }

    @GetMapping("/fee")
    public Map<String, Object> getFee(@RequestParam String from_district_id, @RequestParam String to_district_id, @RequestParam Integer weight) {

        int fee =  locationService.getFee(from_district_id, to_district_id, weight);
        return Map.of("fee", fee);
    }
}
