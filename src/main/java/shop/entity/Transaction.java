package shop.entity;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name ="[Transaction]")
public class Transaction {
	@Id
	@GeneratedValue
	private int id;
	private boolean status;
	
	@NotBlank(message = "Customer's Name cannot be blank")
	private String customerName;
	
	@NotBlank(message = "Customer's Email cannot be blank")
	@Email(message = "Email invalidate")
	private String customerEmail;
	@NotBlank(message = "Phone Number cannot be blank")
	@Pattern(regexp = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$",message = "PhoneNumber is not illegal")
	private String customerPhone;
	@NotBlank(message = "Customer's Address cannot be blank")
	private String customerAddress;
	private BigDecimal amount;
	private String message;
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
	private Date created;
	
	@ManyToOne
	@JoinColumn(name="userID")
	private User user;
	
	@OneToMany(mappedBy = "transaction", fetch = FetchType.EAGER)
	private Collection<Order> orders;
	
	@Override
    public String toString() {
	    return "Transaction [id=" + id + ", userId=" + user.toString() + ", customerName=" + customerName + ", customerAddress=" + customerAddress +", created=" + created +"]";
    }

	
	
	public Transaction() {
		super();
	}

	public Transaction(int id, boolean status, String customerName, String customerEmail, String customerPhone,
			String customerAddress, BigDecimal amount, String message, Date created, User user,
			Collection<Order> orders) {
		super();
		this.id = id;
		this.status = status;
		this.customerName = customerName;
		this.customerEmail = customerEmail;
		this.customerPhone = customerPhone;
		this.customerAddress = customerAddress;
		this.amount = amount;
		this.message = message;
		this.created = created;
		this.user = user;
		this.orders = orders;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Collection<Order> getOrders() {
		return orders;
	}

	public void setOrders(Collection<Order> orders) {
		this.orders = orders;
	}

	
}
