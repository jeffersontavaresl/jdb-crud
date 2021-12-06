package br.com.projetoFinal;

import java.sql.SQLException;

import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import br.com.projetoFinal.model.Telefone;
import br.com.projetoFinal.persistence.TelefoneDao;

public class TelefoneDaoTest {

	private TelefoneDao dao = new TelefoneDao();
	private Telefone telefone;
	
	@Test
	public void DeveriaInserirTelefone() throws SQLException {
		telefone = new Telefone(17, "47474747", "privado", 8);
		Assertions.assertTrue(dao.insert(telefone));
	}
	
	@Test
	public void DeveriaVerificarSeAListaEstaVazia() throws SQLException {
		dao.findAll();
		Assertions.assertFalse(dao.findAll().isEmpty());
	}
	
	@Test
	public void DeveriaVerificarUmTelefonePeloId() throws SQLException {
		Assertions.assertNotNull(dao.findById(1));
	}

}
