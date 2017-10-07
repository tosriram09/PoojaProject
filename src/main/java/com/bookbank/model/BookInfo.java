package com.bookbank.model;

public class BookInfo {
	private String title;
	private String author;
	private int bookNbr;
	private String edition;
	private String publication;
	private double price;
	private String isReference;
	private String purchaseDate;
	
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getBookNbr() {
		return bookNbr;
	}

	public void setBookNbr(int bookNbr) {
		this.bookNbr = bookNbr;
	}

	public String getEdition() {
		return edition;
	}

	public void setEdition(String edition) {
		this.edition = edition;
	}

	public String getPublication() {
		return publication;
	}

	public void setPublication(String publication) {
		this.publication = publication;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String isReference() {
		return isReference;
	}

	public void setReference(String isReference) {
		this.isReference = isReference;
	}

	public String getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
}
