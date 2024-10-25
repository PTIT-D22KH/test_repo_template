/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main;

import controllers.popup.SelectCustomerPopupController;
import dao.CustomerDao;
import dao.EmployeeDao;
import models.Customer;
import models.Employee;
import views.popup.SelectCustomerPopupView;

/**
 *
 * @author P51
 */
public class RunningTest {
    public static void main(String[] args) {
        // Create the DAO and the controller
        CustomerDao customerDao = new CustomerDao();
        SelectCustomerPopupController controller = new SelectCustomerPopupController();

        // Create the view
        SelectCustomerPopupView view = new SelectCustomerPopupView();

        // Define the callback
        SelectCustomerPopupController.Callback callback = new SelectCustomerPopupController.Callback() {
            @Override
            public void run(Customer customer) {
                System.out.println("Selected Customer: " + customer.getName());
            }
        };

        // Simulate the selection process
//        controller.select(view, callback);

        // Simulate user actions
        // For example, set the search text and click the search button
        view.getTxtCustomerName().setText("Admin");
        view.getBtnSearch().doClick();

        // Simulate selecting a customer from the list and clicking OK
        if (view.getListCustomer().getModel().getSize() > 0) {
            view.getListCustomer().setSelectedIndex(0);
            view.getBtnOK().doClick();
        } else {
            System.out.println("No customers found with the given search criteria.");
        }

        // Simulate clicking the cancel button
        view.getBtnCancel().doClick();
    }
}
