package fr.da2i.projetcal.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import fr.da2i.projetcal.entities.Utilisateur;
import fr.da2i.projetcal.entities.Rdvmedecin;

public interface MedecinRepository extends CrudRepository<Rdvmedecin, String> {
    public List<Rdvmedecin> findByUser(Utilisateur user);
    
    
}

