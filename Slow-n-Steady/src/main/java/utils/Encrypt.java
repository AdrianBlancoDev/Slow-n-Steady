/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;
import org.mindrot.jbcrypt.BCrypt;
/**
 *
 * @author ivan-
 */
public class Encrypt {

    public static String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt(5));
    }

    public static boolean checkPassword(String password, String hashedPassword) {
        return BCrypt.checkpw(password, hashedPassword);
    }
}
