package immutablebeans;

/**
 * Represents an immutable user in the video course platform.
 * This class provides a thread-safe, immutable representation of a user with basic information.
 * All fields are final and the class is designed to be extended by mutable implementations if needed.
 *
 * <p>A user can be either a teacher (role = 1) or a student (role = 2).</p>
 *
 * @author VideoCorsi Platform Team
 * @version 1.0
 */
public class ImmutableUser {
	private final int id;
	private final String username;
	private final int role;
	private final String name;
	private final String cognome;
	private final String email;
	private final String skillscard;

	/**
	 * Creates a new user with basic information.
	 *
	 * @param id       The unique identifier for the user (must be positive)
	 * @param username The username for login (cannot be null or empty)
	 * @param role     The user's role (1 for teacher, 2 for student)
	 * @throws IllegalArgumentException if any parameter is invalid
	 */
	public ImmutableUser(int id, String username, int role) {
		this(id, username, role, null, null, null, null);
	}

	/**
	 * Creates a new user with complete information.
	 *
	 * @param id         The unique identifier for the user (must be positive)
	 * @param username   The username for login (cannot be null or empty)
	 * @param role       The user's role (1 for teacher, 2 for student)
	 * @param name       The user's first name (optional)
	 * @param cognome    The user's last name (optional)
	 * @param email      The user's email address (optional)
	 * @param skillscard The user's skills card identifier (optional)
	 * @throws IllegalArgumentException if id is not positive, username is null/empty, or role is invalid
	 */
	public ImmutableUser(int id, String username, int role, String name, String cognome, String email, String skillscard) {
		if (id <= 0) {
			throw new IllegalArgumentException("ID must be positive");
		}
		if (username == null || username.trim().isEmpty()) {
			throw new IllegalArgumentException("Username cannot be null or empty");
		}
		if (role != 1 && role != 2) {
			throw new IllegalArgumentException("Role must be either 1 (teacher) or 2 (student)");
		}
		
		this.id = id;
		this.username = username.trim();
		this.role = role;
		this.name = name != null ? name.trim() : null;
		this.cognome = cognome != null ? cognome.trim() : null;
		this.email = email != null ? email.trim() : null;
		this.skillscard = skillscard != null ? skillscard.trim() : null;
	}

	/**
	 * @return The user's unique identifier
	 */
	public int getId() {
		return id;
	}

	/**
	 * @return The user's username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @return The user's role (1 for teacher, 2 for student)
	 */
	public int getRole() {
		return role;
	}

	/**
	 * @return The user's first name, or null if not set
	 */
	public String getName() {
		return name;
	}

	/**
	 * @return The user's last name, or null if not set
	 */
	public String getCognome() {
		return cognome;
	}

	/**
	 * @return The user's email address, or null if not set
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @return The user's skills card identifier, or null if not set
	 */
	public String getSkillscard() {
		return skillscard;
	}

	/**
	 * Compares this user with another object for equality.
	 * Two users are considered equal if they have the same id, username, role,
	 * and all other fields are either both null or equal.
	 *
	 * @param obj The object to compare with
	 * @return true if the objects are equal, false otherwise
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (obj == null || getClass() != obj.getClass()) return false;
		
		ImmutableUser other = (ImmutableUser) obj;
		return id == other.id &&
			   role == other.role &&
			   username.equals(other.username) &&
			   (name == null ? other.name == null : name.equals(other.name)) &&
			   (cognome == null ? other.cognome == null : cognome.equals(other.cognome)) &&
			   (email == null ? other.email == null : email.equals(other.email)) &&
			   (skillscard == null ? other.skillscard == null : skillscard.equals(other.skillscard));
	}

	/**
	 * Generates a hash code for this user.
	 * The hash code is consistent with equals().
	 *
	 * @return A hash code value for this object
	 */
	@Override
	public int hashCode() {
		int result = 17;
		result = 31 * result + id;
		result = 31 * result + (username != null ? username.hashCode() : 0);
		result = 31 * result + role;
		result = 31 * result + (name != null ? name.hashCode() : 0);
		result = 31 * result + (cognome != null ? cognome.hashCode() : 0);
		result = 31 * result + (email != null ? email.hashCode() : 0);
		result = 31 * result + (skillscard != null ? skillscard.hashCode() : 0);
		return result;
	}

	/**
	 * Returns a string representation of this user.
	 * The string contains all fields in a human-readable format.
	 *
	 * @return A string representation of this user
	 */
	@Override
	public String toString() {
		return "ImmutableUser{" +
			   "id=" + id +
			   ", username='" + username + '\'' +
			   ", role=" + role +
			   ", name='" + name + '\'' +
			   ", cognome='" + cognome + '\'' +
			   ", email='" + email + '\'' +
			   ", skillscard='" + skillscard + '\'' +
			   '}';
	}
}
