/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package views.employee;

import java.awt.KeyboardFocusManager;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyVetoException;
import java.beans.VetoableChangeListener;
import javax.swing.JLabel;

/**
 *
 * @author Admin
 */
public class WorkDayInfoView extends javax.swing.JFrame {

    /**
     * Creates new form PopupInfor
     */
    public WorkDayInfoView() {
        initComponents();
        setLocationRelativeTo(null);
        KeyboardFocusManager.getCurrentKeyboardFocusManager()
                .addVetoableChangeListener("focusedWindow",
                        new VetoableChangeListener() {
                    private boolean gained = false;

                    @Override
                    public void vetoableChange(PropertyChangeEvent evt)
                            throws PropertyVetoException {
                        if (evt.getNewValue() == this) {
                            gained = true;
                        }
                        if (gained && evt.getNewValue() != this) {
                            dispose();
                        }
                    }
                });
    }

    public JLabel getTxtTotalOrder() {
        return txtTotalOrder;
    }

    public JLabel getTxtBonus() {
        return txtBonus;
    }

    public JLabel getTxtDate() {
        return txtDate;
    }

    public JLabel getTxtTotalAmount() {
        return txtTotalAmount;
    }

    public JLabel getTxtTotalTime() {
        return txtTotalTime;
    }

    public JLabel getLbExit() {
        return lbExit;
    }
    /**
    * @param args the command line arguments
    */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(WorkDayInfoView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(WorkDayInfoView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(WorkDayInfoView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(WorkDayInfoView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new WorkDayInfoView().setVisible(true);
            }
        });
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {
        java.awt.GridBagConstraints gridBagConstraints;

        jPanel1 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        lbExit = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        txtTotalOrder = new javax.swing.JLabel();
        txtTotalAmount = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        txtBonus = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        txtDate = new javax.swing.JLabel();
        txtTotalTime = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setUndecorated(true);

        jPanel1.setBackground(new java.awt.Color(188, 228, 153));
        jPanel1.setLayout(new java.awt.BorderLayout());

        jPanel2.setOpaque(false);
        jPanel2.setLayout(new java.awt.GridBagLayout());

        jLabel2.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jLabel2.setText("Thông tin ");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.gridwidth = 2;
        gridBagConstraints.weightx = 0.1;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jPanel2.add(jLabel2, gridBagConstraints);

        lbExit.setBackground(new java.awt.Color(188, 228, 153));
        lbExit.setFont(new java.awt.Font("Tahoma", 1, 24)); // NOI18N
        lbExit.setForeground(new java.awt.Color(215, 116, 78));
        lbExit.setText("X");
        lbExit.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.LINE_END;
        gridBagConstraints.weightx = 0.1;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 5);
        jPanel2.add(lbExit, gridBagConstraints);

        jPanel1.add(jPanel2, java.awt.BorderLayout.PAGE_START);

        jPanel3.setOpaque(false);
        jPanel3.setLayout(new java.awt.GridBagLayout());

        txtTotalOrder.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        txtTotalOrder.setText("100");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 4;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.WEST;
        gridBagConstraints.weightx = 0.1;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 15);
        jPanel3.add(txtTotalOrder, gridBagConstraints);

        txtTotalAmount.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        txtTotalAmount.setText("1,000,000");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 5;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.WEST;
        gridBagConstraints.weightx = 0.1;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 15);
        jPanel3.add(txtTotalAmount, gridBagConstraints);

        jLabel4.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        jLabel4.setText("Số hóa đơn :");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 4;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.WEST;
        gridBagConstraints.weightx = 0.1;
        gridBagConstraints.insets = new java.awt.Insets(5, 15, 5, 5);
        jPanel3.add(jLabel4, gridBagConstraints);

        jLabel5.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        jLabel5.setText("Tổng tiền :");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 5;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.WEST;
        gridBagConstraints.weightx = 0.1;
        gridBagConstraints.insets = new java.awt.Insets(5, 15, 5, 5);
        jPanel3.add(jLabel5, gridBagConstraints);

        txtBonus.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        txtBonus.setText("111111111");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 3;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.WEST;
        gridBagConstraints.weightx = 0.1;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 15);
        jPanel3.add(txtBonus, gridBagConstraints);

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        jLabel1.setText("Ngày làm việc :");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.WEST;
        gridBagConstraints.weightx = 0.1;
        gridBagConstraints.insets = new java.awt.Insets(5, 15, 5, 5);
        jPanel3.add(jLabel1, gridBagConstraints);

        jLabel3.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        jLabel3.setText("Thời gian làm việc :");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 1;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.WEST;
        gridBagConstraints.weightx = 0.1;
        gridBagConstraints.insets = new java.awt.Insets(5, 15, 5, 5);
        jPanel3.add(jLabel3, gridBagConstraints);

        jLabel6.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        jLabel6.setText("Bonus :");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 3;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.WEST;
        gridBagConstraints.weightx = 0.1;
        gridBagConstraints.insets = new java.awt.Insets(5, 15, 5, 5);
        jPanel3.add(jLabel6, gridBagConstraints);

        txtDate.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        txtDate.setText("111111111");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.WEST;
        gridBagConstraints.weightx = 0.1;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 15);
        jPanel3.add(txtDate, gridBagConstraints);

        txtTotalTime.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        txtTotalTime.setText("111111111");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 1;
        gridBagConstraints.anchor = java.awt.GridBagConstraints.WEST;
        gridBagConstraints.weightx = 0.1;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 15);
        jPanel3.add(txtTotalTime, gridBagConstraints);

        jPanel1.add(jPanel3, java.awt.BorderLayout.CENTER);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 338, Short.MAX_VALUE)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 286, Short.MAX_VALUE)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 286, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JLabel lbExit;
    private javax.swing.JLabel txtBonus;
    private javax.swing.JLabel txtDate;
    private javax.swing.JLabel txtTotalAmount;
    private javax.swing.JLabel txtTotalOrder;
    private javax.swing.JLabel txtTotalTime;
    // End of variables declaration//GEN-END:variables
}
