package com.model;

import jakarta.persistence.*;

@Entity
public class Promotion {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_promo")
    private int idPromo;
    @Basic
    @Column(name = "promo")
    private int promo;
    @Basic
    @Column(name = "points")
    private int points;

    //    @Basic
//    @Column(name = "id_stocks")
//    private int idStocks
    @Basic
    @Column(name = "disponible")
    private String disponible;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_stocks", nullable = false)
    private Stock stock;
    public Stock getStock() {
        return this.stock;
    }
    public void setStock(Stock stock) {
        this.stock = stock;
    }

    public Promotion(){

    }
    public Promotion(int idPromo,int promo,int points,Stock stock,String disponible){
        super();
        this.idPromo=idPromo;
        this.promo=promo;
        this.points=points;
//        this.stock = stock;
        this.disponible=disponible;


    }
    public Promotion(int promo,int points,Stock stock,String disponible){
        super();
        this.promo=promo;
        this.points=points;
//        this.stock = stock;
        this.disponible=disponible;

    }

    public int getIdPromo() {
        return idPromo;
    }

    public void setIdPromo(int idPromo) {
        this.idPromo = idPromo;
    }

    public int getPromo() {
        return promo;
    }

    public void setPromo(int promo) {
        this.promo = promo;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    //    public int getIdStocks() {
//        return idStocks;
//    }
//
//    public void setIdStocks(int idStocks) {
//        this.idStocks = idStocks;
//    }

    public String getDisponible() {
        return disponible;
    }

    public void setDisponible(String disponible) {
        this.disponible = disponible;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Promotion promotion = (Promotion) o;

        if (idPromo != promotion.idPromo) return false;
        if (promo != promotion.promo) return false;
        if (points != promotion.points) return false;
//        if (idStocks != promotion.idStocks) return false;
        if (disponible != null ? !disponible.equals(promotion.disponible) : promotion.disponible != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idPromo;
        result = 31 * result + promo;
        result = 31 * result + points;
//        result = 31 * result + idStocks;
        result = 31 * result + (disponible != null ? disponible.hashCode() : 0);
        return result;
    }
}
