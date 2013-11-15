package com.springapp.mvc;

import com.springapp.dao.VariantDao;
import com.springapp.dao.VoteDao;
import com.springapp.dto.ChoosenVariants;
import com.springapp.entity.Vote;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloController {

    @Autowired
    VariantDao variantDao;
    @Autowired
    VoteDao voteDao;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
        model.addAttribute("variants", variantDao.findAll());
        model.addAttribute("choosen", new ChoosenVariants());
        return "quiz";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(@ModelAttribute ChoosenVariants choosen, ModelMap model) {

        if (choosen.getChoosen() != null) {

            for (Integer id : choosen.getChoosen()) {
                voteDao.increment(id);
            }
        }

        return "voices";
    }

    @RequestMapping(value = "result", method = RequestMethod.GET)
    public String printResult(ModelMap model) {
        model.addAttribute("votes", voteDao.findAll());
        return "result";
    }

}