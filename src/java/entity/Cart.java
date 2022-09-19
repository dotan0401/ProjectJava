/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author bahop
 */
public class Cart {

    private List<ItemSPCart> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<ItemSPCart> items) {
        this.items = items;
    }

    public List<ItemSPCart> getItems() {
        return items;
    }

    public void setItems(List<ItemSPCart> items) {
        this.items = items;
    }

    public ItemSPCart getItemById(int id) {
        for (ItemSPCart i : items) {
            if (i.getSanPham().getId() == id) {
                return i;
            }
        }
        return null;
    }

    public void addItem(ItemSPCart t) {
        if (getItemById(t.getSanPham().getId()) != null) {
            ItemSPCart m = getItemById(t.getSanPham().getId());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void delete(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

}
