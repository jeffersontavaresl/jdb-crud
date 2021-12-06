package br.com.projetoFinal.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.projetoFinal.model.Telefone;
import br.com.projetoFinal.model.Usuario;

public class TelefoneDao {

	private Telefone telefone = new Telefone();
	private Usuario usuario = new Usuario();

	/**
	 * MÉTODO PARA INSERIR UM TELEFONE NO BANCO DE DADOS
	 * 
	 * @return
	 * @throws SQLException
	 */

	public boolean insert(Telefone telefone) throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			String sql = "INSERT INTO telefone (ddd, numero, tipo, idUsuario) VALUES (?, ?, ?, ?);";
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				stm.setInt(1, telefone.getDdd());
				stm.setString(2, telefone.getNumero());
				stm.setString(3, telefone.getTipo());
				stm.setInt(4, telefone.getIdUsuario());
				stm.execute();
				return true;
			} catch (SQLException ex) {
				System.out.println("Erro: " + ex.getMessage());
			}
		}
		return false;
	}

	/**
	 * MÉTODO PARA PROCURAR UM TELEFONE NO BANCO DE DADOS PELO ID DO TELEFONE
	 * 
	 * @return
	 * @throws SQLException
	 */

	public Telefone findById(Integer id) throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			String sql = "SELECT * FROM a.telefone, b.usuarios WHERE a.id = ? AND a.idUsuario = b.id ORDER BY b.nome;";
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				stm.setLong(1, id);
				try (ResultSet rs = stm.executeQuery()) {
					if (rs.next()) {
						telefone.setId(rs.getInt("id"));
						telefone.setDdd(rs.getInt("ddd"));
						telefone.setNumero(rs.getString("numero"));
						telefone.setTipo(rs.getString("tipo"));
						telefone.setIdUsuario(rs.getInt("id"));
						usuario.setId(rs.getInt("id"));
					}
				}
			} catch (SQLException ex) {
				System.out.println("Erro: " + ex.getMessage());
			}
		}
		return telefone;
	}

	/**
	 * MÉTODO QUE GERA UMA LISTA COM TODOS OS DADOS DE UM TELEFONE ESPECIFICADO PELO
	 * ID
	 * 
	 * @param id
	 * @return lista com os dados
	 * @throws SQLException
	 */

	public List<Telefone> findByIdList(Integer id) throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			List<Telefone> lista = new ArrayList<>();
			String sql = "SELECT a.id, a.nome, a.email, b.id, b.ddd, b.numero, b.tipo, b.idUsuario "
					+ "FROM usuarios a, telefone b "
					+ "WHERE b.id = ? AND a.id = b.idUsuario "
					+ "ORDER BY a.nome;";
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				stm.setInt(1, id);
				ResultSet rs = stm.executeQuery();
				while (rs.next()) {
					Telefone telefone = new Telefone();
					telefone.setId(rs.getInt("id"));
					telefone.setDdd(rs.getInt("ddd"));
					telefone.setNumero(rs.getString("numero"));
					telefone.setTipo(rs.getString("tipo"));
					telefone.setIdUsuario(rs.getInt("idusuario"));
					lista.add(telefone);
				}
			} catch (SQLException ex) {
				System.out.println("Erro: " + ex.getMessage());
			}
			return lista;
		}
	}

	/**
	 * MÉTODO PARA BUSCAR TODOS OS TELEFONES LIGADOS A USUARIOS NO BANCO DE DADOS
	 * 
	 * @return lista com todos os telefones
	 * @throws SQLException
	 */

	public List<Telefone> findAll() throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			List<Telefone> lista = new ArrayList<>();
			String sql = "SELECT a.id, a.ddd, a.numero, a.tipo, a.idUsuario, b.id, b.nome "
					+ "FROM telefone a, usuarios b " + "WHERE b.id = a.idUsuario ORDER BY b.nome;";
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				try (ResultSet rs = stm.executeQuery()) {
					while (rs.next()) {
						Telefone telefone = new Telefone();
						telefone.setId(rs.getInt("id"));
						telefone.setDdd(rs.getInt("ddd"));
						telefone.setNumero(rs.getString("numero"));
						telefone.setTipo(rs.getString("tipo"));
						telefone.setIdUsuario(rs.getInt("idUsuario"));
						telefone.setNomeUsuario(rs.getString("nome"));
						lista.add(telefone);
					}
				}
			} catch (SQLException ex) {
				System.out.println("Erro: " + ex.getMessage());
			}
			return lista;
		}
	}

	/**
	 * MÉTODO PARA ATUALIZAR UM TELEFONE NO BANCO DE DADOS
	 * 
	 * @return true caso a atualização seja realizada com sucesso
	 * @throws SQLException
	 */

	public boolean update(Telefone telefone) throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			String sql = "UPDATE telefone SET ddd = ?, numero = ?, tipo = ? WHERE id = ? ";
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				stm.setInt(1, telefone.getDdd());
				stm.setString(2, telefone.getNumero());
				stm.setString(3, telefone.getTipo());
				stm.setInt(4, telefone.getId());
				stm.execute();
				return true;
			} catch (SQLException ex) {
				System.out.println("Erro: " + ex.getMessage());
			}
			return false;
		}
	}

	public boolean delete(Integer id) throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			String sql = "DELETE FROM telefone WHERE id = ?;";
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				stm.setInt(1, id);
				stm.execute();
				return true;
			} catch (SQLException ex) {
				System.out.println("Erro: " + ex.getMessage());
			}
			return false;
		}
	}

	/**
	 * MÉTODO PARA DELETAR TODOS OS TELEFONES CADASTRADOS NO MESMO USUÁRIO
	 * 
	 * @param id Identificação do usuário
	 * @return verifica se os dados existem no banco
	 * 
	 */

	public boolean deleteTelefoneByUser(Integer id) throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			String sql = "DELETE FROM telefone WHERE idUsuario = ?";
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				stm.setInt(1, id);
				stm.execute();
				return true;
			} catch (SQLException ex) {
				System.out.println("Erro: " + ex.getMessage());
			}
			return false;
		}
	}
}
