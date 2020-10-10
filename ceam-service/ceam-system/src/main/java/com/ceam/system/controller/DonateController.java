package com.ceam.system.controller;

import com.ceam.common.core.controller.BaseController;
import com.ceam.common.core.domain.R;
import com.ceam.system.domain.Donate;
import com.ceam.system.service.IDonateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>File：DonateController.java</p>
 * <p>Title: </p>
 * <p>Description:</p>
 */
@RestController
@RequestMapping("donate")
public class DonateController extends BaseController
{
    @Autowired
    private IDonateService donateService;

    @GetMapping("list")
    public R list(Donate donate)
    {
        startPage();
        List<Donate> list = donateService.selectDistrictsList(donate);
        return result(list);
    }
}
