package br.com.projetoFinal.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {

	/** MÉTODO PARA VERIFICAR O USUÁRIO E SENHA INFORMADO PARA FAZER LOGIN
	 * 
	 * @param email
	 * @param senha
	 * @return
	 * @throws SQLException
	 */
	public boolean podeLogar(String email, String senha) throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			String sql = "SELECT * FROM usuarios WHERE email = ? and senha = ?";

			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				stm.setString(1, email);
				stm.setString(2, senha);
				try (ResultSet rs = stm.executeQuery()) {
					return rs.next();
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
			return true;
		}
	}

	/** MÉTODO PARA VERIFICAR SE O USUÁRIO EXISTE NO BANCO DE DADOS
	 * 
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	public boolean usuarioExiste(String email) throws SQLException {
		try (Connection conexao = ConnectionFactory.conectar()) {
			String sql = "SELECT * FROM usuarios WHERE email = ?";
			try (PreparedStatement stm = conexao.prepareStatement(sql)) {
				stm.setString(1, email);
				try (ResultSet rs = stm.executeQuery()) {
					if (rs.next()) {
						return true;
					}
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
			return false;
		}
	}

}
