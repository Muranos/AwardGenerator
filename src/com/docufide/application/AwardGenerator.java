/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docufide.application;
import javax.swing.JFrame;

/**
 *
 * @author marina.vasilenko
 * 
 */

public class AwardGenerator {
    
    public static final JFrame MAIN_WINDOW = new MainWindow();

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                MAIN_WINDOW.setVisible(true);
            }
        });
    }
    
}
