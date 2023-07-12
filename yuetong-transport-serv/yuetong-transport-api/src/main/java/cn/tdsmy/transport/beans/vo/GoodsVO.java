package cn.tdsmy.transport.beans.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsVO {
    private String goodsName;
    private int amount;
    private double weight;
    private double volume;
}
