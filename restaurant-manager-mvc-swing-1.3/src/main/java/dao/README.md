To write unit tests for the `EmployeeDao` class, we need to focus on testing its methods, including `getAll`, `get`, `save`, `update`, `delete`, `deleteById`, `findByUsername`, `searchByKey`, and `getRandom`.

We'll use the `JUnit 5` framework for writing the tests and `Mockito` for mocking the database interactions. Here's how you can create a test class for `EmployeeDao`:

### Test Class for `EmployeeDao`

```java
package dao;

import models.Employee;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

public class EmployeeDaoTest {

    private EmployeeDao employeeDao;
    private Connection mockConnection;
    private Statement mockStatement;
    private PreparedStatement mockPreparedStatement;
    private ResultSet mockResultSet;

    @BeforeEach
    public void setUp() throws SQLException {
        employeeDao = new EmployeeDao();
        mockConnection = mock(Connection.class);
        mockStatement = mock(Statement.class);
        mockPreparedStatement = mock(PreparedStatement.class);
        mockResultSet = mock(ResultSet.class);

        employeeDao.setConnection(mockConnection);
    }

    @Test
    public void testGetAll() throws SQLException {
        when(mockConnection.createStatement()).thenReturn(mockStatement);
        when(mockStatement.executeQuery("SELECT * FROM employee;")).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true, false);
        when(mockResultSet.getInt("id")).thenReturn(1);
        when(mockResultSet.getNString("name")).thenReturn("John Doe");

        ArrayList<Employee> employees = employeeDao.getAll();
        assertEquals(1, employees.size());
        assertEquals(1, employees.get(0).getId());
        assertEquals("John Doe", employees.get(0).getName());
    }

    @Test
    public void testGet() throws SQLException {
        when(mockConnection.createStatement()).thenReturn(mockStatement);
        when(mockStatement.executeQuery("SELECT * FROM employee WHERE employee.id = 1")).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getInt("id")).thenReturn(1);
        when(mockResultSet.getNString("name")).thenReturn("John Doe");

        Employee employee = employeeDao.get(1);
        assertNotNull(employee);
        assertEquals(1, employee.getId());
        assertEquals("John Doe", employee.getName());
    }

    @Test
    public void testSave() throws SQLException {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);

        Employee employee = new Employee();
        employee.setUsername("johndoe");
        employee.setPassword("

password

");
        employee.setName("John Doe");
        employee.setPhoneNumber("123456789");
        employee.setPermission(Employee.Permission.ADMIN);
        employee.setSalary(5000);

        employeeDao.save(employee);

        verify(mockPreparedStatement, times(1)).setNString(1, "johndoe");
        verify(mockPreparedStatement, times(1)).setNString(2, "password");
        verify(mockPreparedStatement, times(1)).setNString(3, "John Doe");
        verify(mockPreparedStatement, times(1)).setNString(4, "123456789");
        verify(mockPreparedStatement, times(1)).setNString(5, "ADMIN");
        verify(mockPreparedStatement, times(1)).setInt(6, 5000);
        verify(mockPreparedStatement, times(1)).executeUpdate();
    }

    @Test
    public void testUpdate() throws SQLException {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);

        Employee employee = new Employee();
        employee.setId(1);
        employee.setUsername("johndoe");
        employee.setPassword("password");
        employee.setName("John Doe");
        employee.setPhoneNumber("123456789");
        employee.setPermission(Employee.Permission.ADMIN);
        employee.setSalary(5000);

        employeeDao.update(employee);

        verify(mockPreparedStatement, times(1)).setNString(1, "johndoe");
        verify(mockPreparedStatement, times(1)).setNString(2, "password");
        verify(mockPreparedStatement, times(1)).setNString(3, "John Doe");
        verify(mockPreparedStatement, times(1)).setNString(4, "123456789");
        verify(mockPreparedStatement, times(1)).setNString(5, "ADMIN");
        verify(mockPreparedStatement, times(1)).setInt(6, 5000);
        verify(mockPreparedStatement, times(1)).setInt(7, 1);
        verify(mockPreparedStatement, times(1)).executeUpdate();
    }

    @Test
    public void testDelete() throws SQLException {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);

        Employee employee = new Employee();
        employee.setId(1);

        employeeDao.delete(employee);

        verify(mockPreparedStatement, times(1)).setInt(1, 1);
        verify(mockPreparedStatement, times(1)).executeUpdate();
    }

    @Test
    public void testDeleteById() throws SQLException {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);

        employeeDao.deleteById(1);

        verify(mockPreparedStatement, times(1)).setInt(1, 1);
        verify(mockPreparedStatement, times(1)).executeUpdate();
    }

    @Test
    public void testFindByUsername() throws SQLException {
        when(mockConnection.createStatement()).thenReturn(mockStatement);
        when(mockStatement.executeQuery("SELECT * FROM employee WHERE employee.username = 'johndoe'")).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getInt("id")).thenReturn(1);
        when(mockResultSet.getNString("name")).thenReturn("John Doe");

        Employee employee = employeeDao.findByUsername("johndoe");
        assertNotNull(employee);
        assertEquals(1, employee.getId());
        assertEquals("John Doe", employee.getName());
    }

    @Test
    public void testSearchByKey() throws SQLException {
        when(mockConnection.createStatement()).thenReturn(mockStatement);
        when(mockStatement.executeQuery("SELECT * FROM `employee` WHERE name LIKE '%John%'")).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true, false);
        when(mockResultSet.getInt("id")).thenReturn(1);
        when(mockResultSet.getNString("name")).thenReturn("John Doe");

        ArrayList<Employee> employees = employeeDao.searchByKey("name", "John");
        assertEquals(1, employees.size());
        assertEquals(1, employees.get(0).getId());
        assertEquals("John Doe", employees.get(0).getName());
    }

    @Test
    public void testGetRandom() throws SQLException {
        when(mockConnection.createStatement()).thenReturn(mockStatement);
        when(mockStatement.executeQuery("SELECT * FROM employee ORDER BY RAND() LIMIT 1")).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getInt("id")).thenReturn(1);
        when(mockResultSet.getNString("name")).thenReturn("John Doe");

        Employee employee = employeeDao.getRandom();
        assertNotNull(employee);
        assertEquals(1, employee.getId());
        assertEquals("John Doe", employee.getName());
    }
}
```

### Explanation:

1. **Setup**:
    - `setUp()`: Initializes the `EmployeeDao` instance and mocks the `Connection`, `Statement`, `PreparedStatement`, and `ResultSet` objects. It also sets the mocked connection to the `EmployeeDao`.

2. **Test Methods**:
    - `testGetAll()`: Tests the `getAll` method by mocking the `ResultSet` and verifying that the method returns the correct list of employees.
    - `testGet()`: Tests the `get` method by mocking the `ResultSet` and verifying that the method returns the correct employee.
    - `testSave()`: Tests the `save` method by verifying that the correct SQL statements are executed.
    - `testUpdate()`: Tests the `update` method by verifying that the correct SQL statements are executed.
    - `testDelete()`: Tests the `delete` method by verifying that the correct SQL statements are executed.
    - `testDeleteById()`: Tests the `deleteById` method by verifying that the correct SQL statements are executed.
    - `testFindByUsername()`: Tests the `findByUsername` method by mocking the `ResultSet` and verifying that the method returns the correct employee.
    - `testSearchByKey()`: Tests the `searchByKey` method by mocking the `ResultSet` and verifying that the method returns the correct list of employees.
    - `testGetRandom()`: Tests the `getRandom` method by mocking the `ResultSet` and verifying that the method returns the correct employee.

These tests cover the main functionalities of the `EmployeeDao` class. Adjust the test cases as needed for your specific requirements.