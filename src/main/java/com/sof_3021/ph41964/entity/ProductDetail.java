package com.sof_3021.ph41964.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "ProductDetail")
@Entity
public class ProductDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String code;

    @ManyToOne
    @JoinColumn(name = "idSize")
    private Size size;

    @ManyToOne
    @JoinColumn(name = "idColor")
    private Color color;

    @ManyToOne
    @JoinColumn(name = "idProduct")
    private Product product;

    @Min(value = 0, message = "Không được nhỏ hơn 0")
    private Integer quantity;

    private Boolean status;

    @OneToMany(mappedBy = "productDetail")
    private List<BillDetail> billDetails;

    public ProductDetail(ProductDetail productDetail) {
        this.id = productDetail.getId();
        this.code = productDetail.getCode();
        this.size = productDetail.getSize();
        this.color = productDetail.getColor();
        this.product = productDetail.getProduct();
        this.quantity = productDetail.getQuantity();
        this.status = productDetail.getStatus();
        this.billDetails = productDetail.getBillDetails();
    }
}
