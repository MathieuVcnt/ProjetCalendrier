package fr.da2i.projetcal.controleur;

import java.io.IOException;
import java.sql.Date;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.da2i.projetcal.entities.*;
import fr.da2i.projetcal.repository.MedecinRepository;
import fr.da2i.projetcal.repository.UtilisateurRepository;

@Controller
public class Controleur {
	
	@Autowired
	UtilisateurRepository urepo;
	
	@Autowired
	MedecinRepository mrepo;
	
	@Autowired
	private JavaMailSender sender;
	
	@GetMapping("/login")
	public String login(ModelMap model) {
		return "login";
	}
	@GetMapping("/menu")
	public String menu() {
		return "menu";
	}
	
	@GetMapping("/menupiscine")  
	public String homePiscine() {
		return "menupiscine";
	}
	@GetMapping("/menumedecin")  
	public String homeMedecin() {
		return "menumedecin";
	}
	
	@GetMapping("/planningmedecin")
	public String planningMedecin(ModelMap model) {
		return "planningmedecin";
	}
	
	@GetMapping("/profil")
	public String profil(@RequestParam String username,ModelMap model) {
		Optional<Utilisateur> users = urepo.findById(username);
		model.addAttribute("utilisateurs", users.get());
		return "profil";
	}
	
	
    @RequestMapping("/inscription")
    public String inscription(@RequestParam String username, @RequestParam String password, 
    		@RequestParam String email,@RequestParam String tel,@RequestParam String adresse,
    		@RequestParam String ville, ModelMap model) throws IOException {
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
        	user.setAdresse(adresse);
        	user.setVille(ville);
            urepo.save(user);
            model.addAttribute("msg","Inscription reussie");
            return login(model);
    	}
    }
    
    @RequestMapping("/planningmedecin")
    public String Priserdv(@RequestParam String heure,@RequestParam Date date, ModelMap model,  HttpServletRequest request) throws IOException{
    	Rdvmedecin rdv = new Rdvmedecin();
    	String username = request.getParameter("username");
    	rdv.setDate(date);
    	//rdv.getUser().setUsername(username);
    	mrepo.save(rdv);
    	model.addAttribute("msg","Réservation réussie");
    	return "planningmedecin";
    }
    
    
}
