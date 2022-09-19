/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author bahop
 */
public class ItemSPCart {
    private SanPham sanPham;
    private int quantity;
    private double price;

    public ItemSPCart() {
    }

    public ItemSPCart(SanPham sanPham, int quantity, double price) {
        this.sanPham = sanPham;
        this.quantity = quantity;
        this.price = price;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
