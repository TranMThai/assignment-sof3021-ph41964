package com.sof_3021.ph41964.model;

import com.sof_3021.ph41964.entity.Image;
import com.sof_3021.ph41964.entity.Product;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductInfo {

    @NotNull(message = "Không được trống")
    private Integer id;

    @NotBlank(message = "Không được trống")
    private String code;

    @NotBlank(message = "Không được trống")
    private String name;

    @NotNull(message = "Không được trống")
    private Long price;

    public ProductInfo(Product product) {
        this.id = product.getId();
        this.code = product.getCode();
        this.name = product.getName();
        this.price = product.getPrice();
    }
}
