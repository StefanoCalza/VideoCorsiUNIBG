package test;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

import beans.User;
import immutablebeans.ImmutableUser;

public class UserTest {

    @Test
    public void testImmutableUserValidation() {
        // Test valid construction
        ImmutableUser validUser = new ImmutableUser(1, "testuser", 2, "John", "Doe", "john@example.com", "CARD123", null);
        assertEquals(1, validUser.getId());
        assertEquals("testuser", validUser.getUsername());
        assertEquals(2, validUser.getRole());
        
        // Test invalid ID
        assertThrows(IllegalArgumentException.class, () -> {
            new ImmutableUser(0, "testuser", 2);
        });
        
        // Test invalid username
        assertThrows(IllegalArgumentException.class, () -> {
            new ImmutableUser(1, "", 2);
        });
        
        // Test invalid role
        assertThrows(IllegalArgumentException.class, () -> {
            new ImmutableUser(1, "testuser", 3);
        });
    }

    @Test
    public void testUserSetters() {
        User user = new User(1, "testuser", 2, "John", "Doe", "john@example.com", "CARD123", null);
        
        // Test name setter
        user.setName("  John  ");
        assertEquals("John", user.getName());
        user.setName(null);
        assertNull(user.getName());
        
        // Test email setter
        user.setEmail("  john@example.com  ");
        assertEquals("john@example.com", user.getEmail());
        
        // Test invalid email
        assertThrows(IllegalArgumentException.class, () -> {
            user.setEmail("invalid-email");
        });
        
        // Test null email
        user.setEmail(null);
        assertNull(user.getEmail());
    }

    @Test
    public void testEqualsAndHashCode() {
        ImmutableUser user1 = new ImmutableUser(1, "testuser", 2, "John", "Doe", "john@example.com", "CARD123", null);
        ImmutableUser user2 = new ImmutableUser(1, "testuser", 2, "John", "Doe", "john@example.com", "CARD123", null);
        ImmutableUser user3 = new ImmutableUser(2, "testuser", 2, "John", "Doe", "john@example.com", "CARD123", null);
        
        // Test equals
        assertEquals(user1, user2);
        assertNotEquals(user1, user3);
        
        // Test hashCode
        assertEquals(user1.hashCode(), user2.hashCode());
        assertNotEquals(user1.hashCode(), user3.hashCode());
    }

    @Test
    public void testToString() {
        User user = new User(1, "testuser", 2, "John", "Doe", "john@example.com", "CARD123", null);
        String toString = user.toString();
        
        assertTrue(toString.contains("id=1"));
        assertTrue(toString.contains("username='testuser'"));
        assertTrue(toString.contains("role=2"));
        assertTrue(toString.contains("name='John'"));
        assertTrue(toString.contains("email='john@example.com'"));
    }
} 