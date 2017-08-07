package com.springmvc.controller;

import com.springmvc.pojo.Toy;
import com.springmvc.service.ToyService;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ToyController {

	
    @Resource(name = "toyService")
    private ToyService toyService;

    @RequestMapping("index")
    public String index() {
        return "index";
    }
    @RequestMapping("list")
    public ModelAndView list(@RequestParam(value="name",required=false)String name,
    		@RequestParam(value="beginDate",required=false)
    		@DateTimeFormat(pattern="yyyy-MM-dd")Date beginDate,
    		@RequestParam(value="endDate",required=false)
    		@DateTimeFormat(pattern="yyyy-MM-dd")Date endDate) {
    	
    	ModelAndView mv = new ModelAndView();
    	
    	List<Toy> toys = toyService.findByParam(name, beginDate, endDate);
    	mv.setViewName("list");
    	mv.addObject("toys",toys);
        return mv;
    }
    
    @RequestMapping(value="save",method=RequestMethod.POST)
    public String save(Toy toy) {
    	
    	if(toy != null && toy.getId() != null) {
    		toyService.modify(toy);
    	}else {
    		toyService.add(toy);
    	}
    	return "redirect:list";
    }
    
    @RequestMapping("findById")
    public ModelAndView findById(@RequestParam(value="id",required=true)Integer id) {
    	Toy toy = toyService.findById(id);
    	System.out.println(toy.getCreateDate());
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("edit");
    	mv.addObject("toy",toy);
    	return mv;
    }
    
    @RequestMapping("remove")
    public String remove(@RequestParam(value="id",required=true)Integer id) {
    	toyService.remove(id);
    	
    	return "redirect:list";
    }

   

}
