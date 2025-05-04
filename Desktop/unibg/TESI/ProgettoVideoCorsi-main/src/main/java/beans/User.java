package beans;

import immutablebeans.ImmutableUser;

/**
 * Represents a mutable user in the video course platform.
 * This class extends {@link ImmutableUser} to provide mutable access to user properties
 * while maintaining the core immutable properties (id, username, role) from the parent class.
 *
 * <p>This class is typically used when user information needs to be updated after initial creation,
 * such as when updating profile information.</p>
 *
 * @author VideoCorsi Platform Team
 * @version 1.0
 * @see ImmutableUser
 */
public class User extends ImmutableUser {

	private String name;
	private String cognome;
	private String email;
	private String skillscard;

	/**
	 * Creates a new user with basic information.
	 *
	 * @param id       The unique identifier for the user
	 * @param username The username for login
	 * @param role     The user's role (1 for teacher, 2 for student)
	 * @throws IllegalArgumentException if any parameter is invalid (inherited from {@link ImmutableUser})
	 */
	public User(int id, String username, int role) {
		super(id, username, role);
	}

	/**
	 * Creates a new user with complete information.
	 *
	 * @param id         The unique identifier for the user
	 * @param username   The username for login
	 * @param role       The user's role (1 for teacher, 2 for student)
	 * @param name       The user's first name
	 * @param cognome    The user's last name
	 * @param email      The user's email address
	 * @param skillscard The user's skills card identifier
	 * @throws IllegalArgumentException if any required parameter is invalid (inherited from {@link ImmutableUser})
	 */
	public User(int id, String username, int role, String name, String cognome, String email, String skillscard) {
		super(id, username, role, name, cognome, email, skillscard);
		this.name = name;
		this.cognome = cognome;
		this.email = email;
		this.skillscard = skillscard;
	}

	@Override
	public String getName() {
		return name;
	}

	/**
	 * Sets the user's first name.
	 * The input string will be trimmed if not null.
	 *
	 * @param name The new first name, or null to clear the name
	 */
	public void setName(String name) {
		this.name = name != null ? name.trim() : null;
	}

	@Override
	public String getCognome() {
		return cognome;
	}

	/**
	 * Sets the user's last name.
	 * The input string will be trimmed if not null.
	 *
	 * @param cognome The new last name, or null to clear the last name
	 */
	public void setCognome(String cognome) {
		this.cognome = cognome != null ? cognome.trim() : null;
	}

	@Override
	public String getEmail() {
		return email;
	}

	/**
	 * Sets the user's email address.
	 * The input string will be trimmed and validated if not null.
	 *
	 * @param email The new email address, or null to clear the email
	 * @throws IllegalArgumentException if the email format is invalid
	 */
	public void setEmail(String email) {
		if (email != null && !email.trim().isEmpty()) {
			String trimmedEmail = email.trim();
			if (!trimmedEmail.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
				throw new IllegalArgumentException("Invalid email format");
			}
			this.email = trimmedEmail;
		} else {
			this.email = null;
		}
	}

	@Override
	public String getSkillscard() {
		return skillscard;
	}

	/**
	 * Sets the user's skills card identifier.
	 * The input string will be trimmed if not null.
	 *
	 * @param skillscard The new skills card identifier, or null to clear it
	 */
	public void setSkillscard(String skillscard) {
		this.skillscard = skillscard != null ? skillscard.trim() : null;
	}

	/**
	 * Returns a string representation of this user.
	 * The string contains all fields in a human-readable format.
	 *
	 * @return A string representation of this user
	 */
	@Override
	public String toString() {
		return "User{" +
			   "id=" + getId() +
			   ", username='" + getUsername() + '\'' +
			   ", role=" + getRole() +
			   ", name='" + name + '\'' +
			   ", cognome='" + cognome + '\'' +
			   ", email='" + email + '\'' +
			   ", skillscard='" + skillscard + '\'' +
			   '}';
	}

}
