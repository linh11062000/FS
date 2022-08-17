package shop.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "[User]")
public class User {
	@Id
	@GeneratedValue
	private int id;
	
	@NotBlank(message = "Name cannot be blank")
	private String name;
	
	@NotBlank(message = "Email cannot be blank")
	@Email(message = "Email invalidate")
	private String email;
	
	@NotBlank(message = "Phone Number cannot be blank")
	@Pattern(regexp = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$",message = "PhoneNumber is not illegal")
	private String phone;
	private String address;
	
	@NotBlank(message = "Password cannot be blank")
	private String password;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
	private Date created;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	private Collection<ShopCart> shopCarts;

	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	private Collection<Transaction> transactions;
	
	@Override
    public String toString() {
	    return "User [id=" + id + ", name=" + name + ", password=" + password + ", address=" + address +", created=" + created +"]";
    }
	
	public User() {
		super();
	}


	public User(int id, String name, String email, String phone, String address, String password, Date created,
			Collection<ShopCart> shopCarts, Collection<Transaction> transactions) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.password = password;
		this.created = created;
		this.shopCarts = shopCarts;
		this.transactions = transactions;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Collection<ShopCart> getShopCarts() {
		return shopCarts;
	}

	public void setShopCarts(Collection<ShopCart> shopCarts) {
		this.shopCarts = shopCarts;
	}

	public Collection<Transaction> getTransactions() {
		return transactions;
	}

	public void setTransactions(Collection<Transaction> transactions) {
		this.transactions = transactions;
	}
	
}
