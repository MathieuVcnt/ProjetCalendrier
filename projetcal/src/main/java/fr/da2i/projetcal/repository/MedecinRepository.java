package fr.da2i.projetcal.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import fr.da2i.projetcal.entities.Utilisateur;
import fr.da2i.projetcal.entities.Rdvmedecin;

public interface MedecinRepository extends CrudRepository<Rdvmedecin, String> {
    public List<Rdvmedecin> findByUser(String username);
    
    @Query(nativeQuery = true, value = "SELECT * FROM rdvmedecin r WHERE r.users_username LIKE CONCAT('%',:username,'%')")
    public List<Rdvmedecin> findByUsername(@Param("username") String username);
    
    
}

