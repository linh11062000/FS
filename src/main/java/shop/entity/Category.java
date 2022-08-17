package shop.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name ="Category")
public class Category {
	
	@Id
	@GeneratedValue
	private int id;
	private String category;
	private Integer parent_id;
	
	@ManyToMany(mappedBy="categories",fetch = FetchType.LAZY)
	List<Flower> flowers= new ArrayList<>();

	@Override
    public String toString() {
	    return "Category [id=" + id +  ", category=" + category + ", parentID=" + parent_id + "]";
    }

	public Category() {
		super();
	}

	public Category(int id, String category, Integer parent_id, List<Flower> flowers) {
		super();
		this.id = id;
		this.category = category;
		this.parent_id = parent_id;
		this.flowers = flowers;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getParent_id() {
		return parent_id;
	}

	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}

	public List<Flower> getFlowers() {
		return flowers;
	}

	public void setFlowers(List<Flower> flowers) {
		this.flowers = flowers;
	}
	

}
