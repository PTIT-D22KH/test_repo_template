To write unit tests for the `AdminDashboardView` class, we need to focus on testing the public methods and ensuring that the UI components are correctly initialized and manipulated. Since `AdminDashboardView` is a Swing-based GUI class, we will use the `AssertJ-Swing` library to facilitate testing of Swing components.

First, ensure you have the necessary dependencies in your `pom.xml` file:

```xml
<dependencies>
    <!-- Other dependencies -->
    <dependency>
        <groupId>org.assertj</groupId>
        <artifactId>assertj-swing-junit</artifactId>
        <version>3.17.1</version>
        <scope>test</scope>
    </dependency>
</dependencies>
```

Now, let's create a test class for `AdminDashboardView`:

```java
package views;

import org.assertj.swing.annotation.GUITest;
import org.assertj.swing.core.matcher.JButtonMatcher;
import org.assertj.swing.edt.GuiActionRunner;
import org.assertj.swing.fixture.FrameFixture;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import javax.swing.*;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

public class AdminDashboardViewTest {

    private FrameFixture window;

    @BeforeEach
    public void setUp() {
        AdminDashboardView frame = GuiActionRunner.execute(AdminDashboardView::new);
        window = new FrameFixture(frame);
        window.show(); // shows the frame to test
    }

    @AfterEach
    public void tearDown() {
        window.cleanUp();
    }

    @Test
    @GUITest
    public void testShowError() {
        GuiActionRunner.execute(() -> window.target().showError("Test Error"));
        window.dialog().requireVisible().requireMessage("Test Error");
    }

    @Test
    @GUITest
    public void testShowMessage() {
        GuiActionRunner.execute(() -> window.target().showMessage("Test Message"));
        window.optionPane().requireMessage("Test Message").okButton().click();
    }

    @Test
    @GUITest
    public void testGetBtnLogout() {
        JButton button = window.target().getBtnLogout();
        assertNotNull(button);
        window.button(JButtonMatcher.withText("Thoát")).requireVisible();
    }

    @Test
    @GUITest
    public void testGetLbName() {
        JLabel label = window.target().getLbName();
        assertNotNull(label);
        window.label("lbName").requireVisible().requireText("Trần Đức Cường");
    }

    @Test
    @GUITest
    public void testAddMenu() {
        MenuItem menuItem = new MenuItem("Test Menu");
        GuiActionRunner.execute(() -> window.target().addMenu(menuItem));
        ArrayList<MenuItem> menuItems = window.target().getMenuItems();
        assertTrue(menuItems.contains(menuItem));
    }

    @Test
    @GUITest
    public void testSetCards() {
        JPanel card1 = new JPanel();
        JPanel card2 = new JPanel();
        JPanel[] cards = {card1, card2};
        GuiActionRunner.execute(() -> window.target().setCards(cards));
        JPanel panelLayout = window.target().getPanelLayout();
        assertEquals(2, panelLayout.getComponentCount());
    }

    @Test
    @GUITest
    public void testSetPanel() {
        JPanel card1 = new JPanel();
        JPanel card2 = new JPanel();
        JPanel[] cards = {card1, card2};
        GuiActionRunner.execute(() -> window.target().setCards(cards));
        GuiActionRunner.execute(() -> window.target().setPanel(card1));
        assertTrue(card1.isVisible());
        assertFalse(card2.isVisible());
    }
}
```

### Explanation:

1. **Dependencies**: Added `assertj-swing-junit` for testing Swing components.
2. **Setup and Teardown**:
    - `setUp()`: Initializes the `AdminDashboardView` and shows the frame.
    - `tearDown()`: Cleans up the window after each test.
3. **Test Methods**:
    - `testShowError()`: Tests the `showError` method by verifying that the error dialog is displayed.
    - `testShowMessage()`: Tests the `showMessage` method by verifying that the message dialog is displayed.
    - `testGetBtnLogout()`: Tests the `getBtnLogout` method by verifying that the logout button is present and visible.
    - `testGetLbName()`: Tests the `getLbName` method by verifying that the label is present and has the correct text.
    - `testAddMenu()`: Tests the `addMenu` method by verifying that a menu item is added to the list.
    - `testSetCards()`: Tests the `setCards` method by verifying that the cards are added to the layout.
    - `testSetPanel()`: Tests the `setPanel` method by verifying that the correct panel is set to visible.

These tests cover the main functionalities of the `AdminDashboardView` class. Adjust the test cases as needed for your specific requirements.