package io.ldnr.teamc.pizzeria.gerant;

import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import io.ldnr.teamc.pizzeria.datas.user.User;
import io.ldnr.teamc.pizzeria.datas.user.UserRepository;



@Controller
@RequestMapping("gerant")
public class GerantUserController {
	
	 @Autowired
	 private UserRepository repoUser;
	
	 
	 @GetMapping(path = "users")
	 public String gestionCommandes(ModelMap pModel) {
	  pModel.addAttribute("listeusers",repoUser.findAll());
	  return "gerant/gestionusers";
	 }
	 	
}
