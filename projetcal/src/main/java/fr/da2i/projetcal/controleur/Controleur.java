package fr.da2i.projetcal.controleur;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.da2i.projetcal.entities.*;

@Controller
public class Controleur {
	
	@Autowired
	UtilisateurRepository urepo;
	
	@GetMapping("/login")
	public String login(ModelMap model) {
		return "login";
	}
	
	@GetMapping("/index")  
	public String home() {
		return "index";
	}
	
    @RequestMapping("/inscription")
    public String inscription(@RequestParam String username, @RequestParam String password, 
    		@RequestParam String email,@RequestParam String tel, ModelMap model) throws IOException {
    	if(urepo.existsById(username)) {
    		return "/login?inscription=true&badInfo=username";
    	}else {
        	PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
        	Utilisateur user = new Utilisateur();
        	user.setUsername(username);
        	user.setPassword(encoder.encode(password));
        	user.setAuthority("USER");
        	user.setEnabled(true);
        	user.setEmail(email);
        	user.setTel(tel);
            urepo.save(user);
            model.addAttribute("msg","Inscription reussie");
            return login(model);
    	}
    }
}
