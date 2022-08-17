package shop.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name ="Flower")
public class Flower {
	
	@Id
	@GeneratedValue
	private int id;
	private String name;
	private BigDecimal price;
	private String contents;
	private Integer discount;
	private String image;
	private Integer views;
	
	@OneToMany(mappedBy = "flower", fetch = FetchType.EAGER)
	private Collection<ShopCart> shopCarts;
	
	@OneToMany(mappedBy = "flower", fetch = FetchType.EAGER)
	private Collection<Order> orders;
	
	@ManyToMany
	@JoinTable(
		      name = "Flower_Color",
		      joinColumns = @JoinColumn(name = "idFlower"),
		      inverseJoinColumns = @JoinColumn(name = "idColor")
		  )
	List<Color> colors= new ArrayList<>();
	
	@ManyToMany
	@JoinTable(
			name = "Flower_Category",
			joinColumns = @JoinColumn(name = "idFlower"),
			inverseJoinColumns = @JoinColumn(name = "idCategory")
			)
	List<Category> categories= new ArrayList<>();
	
	@Override
    public String toString() {
	    return "Flower [id=" + id +  ", name=" + name + ", price=" + price + ", contents=" + contents +", discount=" + discount +", image=" + image +", views=" + views +"]";
    }

	
	public Flower() {
		super();
	}


	public Flower(int id, String name, BigDecimal price, String contents, int discount, String image, int views,
			Collection<ShopCart> shopCarts, Collection<Order> orders, List<Color> colors, List<Category> categories) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.contents = contents;
		this.discount = discount;
		this.image = image;
		this.views = views;
		this.shopCarts = shopCarts;
		this.orders = orders;
		this.colors = colors;
		this.categories = categories;
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

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public Collection<ShopCart> getShopCarts() {
		return shopCarts;
	}

	public void setShopCarts(Collection<ShopCart> shopCarts) {
		this.shopCarts = shopCarts;
	}

	public Collection<Order> getOrders() {
		return orders;
	}

	public void setOrders(Collection<Order> orders) {
		this.orders = orders;
	}

	public List<Color> getColors() {
		return colors;
	}

	public void setColors(List<Color> colors) {
		this.colors = colors;
	}
	
	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}
	
}
