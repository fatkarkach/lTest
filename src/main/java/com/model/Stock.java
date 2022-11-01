package com.model;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
public class Stock {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_stock")
    private int idStock;
    @Basic
    @Column(name = "categorie")
    private String categorie;
    @Basic
    @Column(name = "produit")
    private String produit;
    @Basic
    @Column(name = "prix")
    private int prix;
    @Basic
    @Column(name = "quantites")
    private int quantites;

    @OneToMany(mappedBy = "stock")
    private Collection<Promotion> promotionsByIdStock;
    public Stock() {

    }
    public Stock(String categorie, String produit, int prix,int quantites) {
        this.categorie=categorie;
        this.produit=produit;
        this.prix=prix;
        this.quantites=quantites;

    }
    public Stock(int idStock ,String categorie, String produit, int prix,int quantites) {
        this.idStock=idStock;
        this.categorie=categorie;
        this.produit=produit;
        this.prix=prix;
        this.quantites=quantites;
    }


    public int getIdStock() {
        return idStock;
    }

    public void setIdStock(int idStock) {
        this.idStock = idStock;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public String getProduit() {
        return produit;
    }

    public void setProduit(String produit) {
        this.produit = produit;
    }

    public int getPrix() {
        return prix;
    }

    public void setPrix(int prix) {
        this.prix = prix;
    }

    public int getQuantites() {
        return quantites;
    }

    public void setQuantites(int quantites) {
        this.quantites = quantites;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Stock stock = (Stock) o;

        if (idStock != stock.idStock) return false;
        if (prix != stock.prix) return false;
        if (quantites != stock.quantites) return false;
        if (categorie != null ? !categorie.equals(stock.categorie) : stock.categorie != null) return false;
        if (produit != null ? !produit.equals(stock.produit) : stock.produit != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idStock;
        result = 31 * result + (categorie != null ? categorie.hashCode() : 0);
        result = 31 * result + (produit != null ? produit.hashCode() : 0);
        result = 31 * result + prix;
        result = 31 * result + quantites;
        return result;
    }
    public Collection<Promotion> getPromotionsByIdStock() {
        return promotionsByIdStock;
    }

    public void setPromotionsByIdStock(Collection<Promotion> promotionsByIdStock) {
        this.promotionsByIdStock = promotionsByIdStock;
    }
}
