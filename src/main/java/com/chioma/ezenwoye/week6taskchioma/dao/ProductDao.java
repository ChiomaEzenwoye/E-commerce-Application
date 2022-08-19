package com.chioma.ezenwoye.week6taskchioma.dao;

import com.chioma.ezenwoye.week6taskchioma.connection.DBCon;
import com.chioma.ezenwoye.week6taskchioma.model.Cart;
import com.chioma.ezenwoye.week6taskchioma.model.Product;


import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class ProductDao {
    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;


    public ProductDao(Connection con) {
        super();
        this.con = con;
    }

    public ProductDao() {
    }

    public List<Product> getAllProducts() {
        List<Product> myProductList = new ArrayList<>();
        try {
            query = "SELECT * FROM products";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setQuantity(rs.getInt("quantity"));
                row.setImage(rs.getString("image"));
                myProductList.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return myProductList;
    }


    public Product getSingleProduct(int id) {
        Product row = new Product();
        try {
            query = "SELECT * FROM products WHERE id=? ";

            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setQuantity(rs.getInt("quantity"));
//                row.setImage(rs.getString("image"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return row;
    }

    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "SELECT price FROM products WHERE id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum += rs.getDouble("price") * item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }


    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> cartArrayList = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "SELECT * FROM products WHERE id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price") * item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        cartArrayList.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return cartArrayList;

    }





    public boolean addProduct(Product product) {
        try {
            String Query = "INSERT INTO products (name,category,price,quantity) VALUES" + "(?,?,?,?);";
            pst = DBCon.getConnection().prepareStatement(Query);
            pst.setString(1, product.getName());
            pst.setString(2, product.getCategory());
            pst.setDouble(3, product.getPrice());
            pst.setInt(4, product.getQuantity());

            int resultSet1 = pst.executeUpdate();
            if (resultSet1 > 0) return true;
        } catch (Exception e) {
            e.getMessage();
        }
        return false;
    }

    public boolean deleteProducts(int id) {
        try {
            String Query = "DELETE from products WHERE id = ?";
            pst = DBCon.getConnection().prepareStatement(Query);
            pst.setInt(1,id);

            int resultSet1 = pst.executeUpdate();
            if (resultSet1 > 0) return true;
        } catch (Exception e) {
            e.getMessage();
        }
        return false;
    }

//    public boolean updateQty(int id) {
//        try {
//            String Query = "Update products set if(quantity != 0, quantity = qunatity -1, quantity = 0) where id = ?";
//
//            pst = DBCon.getConnection().prepareStatement(Query);
//            pst.setInt(1,id);
//
//            int resultSet1 = pst.executeUpdate();
//            if (resultSet1 > 0) return true;
//        } catch (Exception e) {
//            e.getMessage();
//        }
//        return false;
//    }

    public boolean updateProduct(Product product) {
        try {
            String Query = "Update products set name = ?,category = ?,price =?,quantity = ? where id = ?";
            pst = DBCon.getConnection().prepareStatement(Query);
            pst.setString(1, product.getName());
            pst.setString(2, product.getCategory());
            pst.setDouble(3, product.getPrice());
            pst.setInt(4, product.getQuantity());
            pst.setInt(5, product.getId());


            int resultSet1 = pst.executeUpdate();
            if (resultSet1 > 0) return true;
        } catch (Exception e) {
            e.getMessage();
        }
        return false;
    }
}