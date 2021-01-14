
package alifPart;

import java.sql.*;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;
import static alifPart.ConnectionMySQL.getConnection;
import yuutube.videoMenu;

/**
 * 
 * @author alifm
 */
public class Subscription {
    private static int subBoolean;
    
    /**
     * Method displays options for user to subscribe or unsubscribe.
     * Call this method when/after displaying a video.
     * If user subscribes/unsubscribes to a channel, method will do two things:
     * 1. UPDATE INT subscribers in TABLE channel_subs.
     * 2. UPDATE TINYINT subscribed in TABLE user_subs.
     * @param userId current user that is logged in
     * @param chanUserId current channel user is at
     * @param videoId if return, method goes back to video display
     * @throws java.sql.SQLException
     * @throws java.lang.Exception
     */
    public static void promptSub(int userId, int chanUserId) throws SQLException, Exception{
        Scanner sc = new Scanner(System.in);

        //Request user input and store in variable userAction
        System.out.println("");
        System.out.println("0. Cancel/Return\n1. Subscribe\n2. Unsubscribe");
        int userAction = sc.nextInt();        

        switch(userAction) {
            case 0:
//                videoMenu.mainMenu(videoId);
                break;
                
            // subscribes
            case 1:
                // checks if user is logged in
                if(LoggedIn.loggedIn() !=0){
                    
                    // checks if user has ever subscribed
                    // if the user has never subscribed
                    if(checkSub(userId, chanUserId) == 0) {
                        
                        
                        // new
                        insertUserSubs(userId, chanUserId, 1);
                        
                        updateUserSubs(userId, chanUserId, 1);
                        increaseSub(chanUserId);
                        
                        System.out.println("Subscription added");
                        
                    
                    // if the user is already subscribed
                    }else if(checkSub(userId, chanUserId) == 1) {
                        System.out.println("");
                        System.out.println("You are already subscribed, do you wish to unsubscribe?");
                        System.out.println("1. No\n2. Yes");
                        int a = sc.nextInt();
                        
                        if(a==2) {
                            updateUserSubs(userId, chanUserId, 0);
                            decreaseSub(chanUserId);
                            
                            System.out.println("Subscription removed");
                        }
                        
                    }else {
                        
                        // new
                        insertUserSubs(userId, chanUserId, 1);
                        
                    }
                    
                }else {
                    
                    System.out.println("Please log in");
//                    videoMenu.mainMenu(videoId);
                }
                
                break;
                
            // unsubscribes
            case 2:
                
                // checks if user is logged in
                if(LoggedIn.loggedIn() !=0){
                    
                    // checks if user is subscribed
                    // if the user is not subscribed
                    if(checkSub(userId, chanUserId) == 0) {
                        
                        System.out.println("Not subscribed");
                        
                    
                    // if the user is subscribed
                    }else if(checkSub(userId, chanUserId) == 1) {

                        // new
                        insertUserSubs(userId, chanUserId, 0);
                        
                        updateUserSubs(userId, chanUserId, 0);
                        decreaseSub(chanUserId);
                        
                        System.out.println("Subscription removed");
                        
                    }else {
                        
                        System.out.println("You are not subscribed");                        
                        
                        // new
                        insertUserSubs(userId, chanUserId, 0);
                        
                    }
                    
                }else {
                    
                    System.out.println("Please log in");
//                    videoMenu.mainMenu(videoId);
                }
                
                break;                
            
            default:
//                videoMenu.mainMenu(videoId);
                break;                
        }
    }
    
    /**
     * Method displays subscriber counts.
     * You can add more information to display depending on your needs.
     * Once database is finalized, you can add a FIELD channel_name to be displayed.
     * @return numSub
     * @throws SQLException
     * @throws Exception
     */
    public static ArrayList<String> getSub(int channelId) throws SQLException, Exception {
        Connection con = getConnection();
        
        try(
                PreparedStatement statement = 
                        con.prepareStatement("SELECT channel_id, subscriber FROM channel_subs WHERE channel_id = '"+channelId+"'");
                ResultSet result = statement.executeQuery())
        {
            ArrayList<String> numSub = new ArrayList<>();
            
            while(result.next()){
                System.out.print("Channel ID: ");
                System.out.println(result.getString("channel_id"));
                System.out.print("Subscribers: ");
                System.out.print(result.getString("subscriber"));

                numSub.add(result.getString("channel_id"));
                numSub.add(result.getString("subscriber"));
            }
            
            // for debugging purposes
            System.out.println("\nAll records retrieved");
            return numSub;
        }catch(SQLException e){
            Logger lgr = Logger.getLogger(LikeDislike.class.getName());
            lgr.log(Level.SEVERE, e.getMessage(), e);
        }
        return null;
    }

    
    /**
     * Method returns a subscribed value of either 0 or 1.
     * If 0, user is not subscribed. 
     * If 1, user is subscribed.
     * Default return value is 0.
     */
    private static int checkSub(int userId, int chanUserId) throws Exception{
        Connection con = getConnection();   

        try(PreparedStatement statement = con.prepareStatement(
                "SELECT user_id, channel_user_id, subscribed FROM user_subs WHERE user_id = '"+userId+"' AND channel_user_id = '"+chanUserId+"'");
                ResultSet result = statement.executeQuery())
        {
            if(result.next())
                return result.getInt("subscribed");
            
        }catch(SQLException e){
            Logger lgr = Logger.getLogger(LikeDislike.class.getName());
            lgr.log(Level.SEVERE, e.getMessage(), e);
        }        
        return 0;
    }
    
    // Method UPDATE FIELD subscribers + 1 in TABLE channel_subs
    private static void increaseSub(int chanUserId) throws Exception{
        Connection con = getConnection();   

        try(PreparedStatement posted = con.prepareStatement(
                "UPDATE `user` SET `subscriber` = `subscriber` + 1 WHERE user_id = '"+chanUserId+"'")){
            posted.executeUpdate();
            
            // for debugging
//            System.out.println("Update user successful");

        }catch(SQLException e){
            Logger lgr = Logger.getLogger(LikeDislike.class.getName());
            lgr.log(Level.SEVERE, e.getMessage(), e);
        }
    }    

    // Method UPDATE FIELD subscribers - 1 in TABLE channel_subs    
    private static void decreaseSub(int chanUserId) throws Exception{
        Connection con = getConnection();   

        // updates subscribed field, insert into table channel_subs
        try(PreparedStatement posted = con.prepareStatement(
                "UPDATE `user` SET `subscriber` = `subscriber` - 1 WHERE user_id = '"+chanUserId+"'");){
            posted.executeUpdate();
            
            // for debugging
//            System.out.println("Update user successful");
            
        }catch(SQLException e){
            Logger lgr = Logger.getLogger(LikeDislike.class.getName());
            lgr.log(Level.SEVERE, e.getMessage(), e);
        }
    }
    
    // Method UPDATE field subscribed = 1 in TABLE user_subs
    private static void updateUserSubs(int userId, int chanUserId, int subBoolean) throws Exception{
        Connection con = getConnection();
        
        try(PreparedStatement posted = con.prepareStatement(
                "UPDATE `user_subs` SET `subscribed` = '"+subBoolean+"' WHERE user_id = '"+userId+"' AND channel_user_id = '"+chanUserId+"'")){
            posted.executeUpdate();
            
            // for debugging
//            System.out.println("Update user_subs successful");

        }catch(SQLException e){
            Logger lgr = Logger.getLogger(LikeDislike.class.getName());
            lgr.log(Level.SEVERE, e.getMessage(), e);
        }        
    }
    
    private static void insertUserSubs(int userId, int chanUserId, int subBoolean) throws SQLException {
        Connection con = getConnection();
        
        try(PreparedStatement posted = con.prepareStatement(
                "INSERT INTO user_subs(user_id, channel_user_id, subscribed) VALUES('"+userId+"', '"+chanUserId+"', '"+subBoolean+"')"))
        {
            posted.executeUpdate();
            
            // for debugging
//            System.out.println("Insert user_subs succesful");

        }catch(SQLException e){
            Logger lgr = Logger.getLogger(LikeDislike.class.getName());
            lgr.log(Level.SEVERE, e.getMessage(), e);
        }          
    }    
    
   
}