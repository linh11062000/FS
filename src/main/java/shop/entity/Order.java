package shop.entity;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name ="[Order]")
public class Order {

	@Id
	@GeneratedValue
	private int id;
	private int  quantity;
	private BigDecimal amount;
	private String note;
	private boolean status;
	
	@ManyToOne
	@JoinColumn(name="transactionID")
	private Transaction transaction;
	
	@ManyToOne
	@JoinColumn(name="idFlower")
	private Flower flower;
	
	@Override
    public String toString() {
	    return "Order [id=" + id + ", quantity=" + quantity + ", transaction=" + transaction.toString() + ", flower=" + flower.toString()  +"]";
    }

	
	
	public Order() {
		super();
	}

	public Order(int id, int quantity, BigDecimal amount, String note, boolean status, Transaction transaction,
			Flower flower) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.amount = amount;
		this.note = note;
		this.status = status;
		this.transaction = transaction;
		this.flower = flower;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Transaction getTransaction() {
		return transaction;
	}

	public void setTransaction(Transaction transaction) {
		this.transaction = transaction;
	}

	public Flower getFlower() {
		return flower;
	}

	public void setFlower(Flower flower) {
		this.flower = flower;
	}
	
	
}
