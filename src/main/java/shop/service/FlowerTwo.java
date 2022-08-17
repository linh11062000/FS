package shop.service;

import shop.entity.Flower;

public class FlowerTwo {
	private Flower f1;
	private Flower f2;
	public FlowerTwo(Flower f1, Flower f2) {
		super();
		this.f1 = f1;
		this.f2 = f2;
	}
	public FlowerTwo() {
		super();
	}
	public Flower getF1() {
		return f1;
	}
	public void setF1(Flower f1) {
		this.f1 = f1;
	}
	public Flower getF2() {
		return f2;
	}
	public void setF2(Flower f2) {
		this.f2 = f2;
	}
}
