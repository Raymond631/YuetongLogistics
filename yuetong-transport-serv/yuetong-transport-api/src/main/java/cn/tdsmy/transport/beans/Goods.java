package cn.tdsmy.transport.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {
    private int goodsId;
    private int fkCarriersId;
    private String goodsName;
    private int amount;
    private double weight;
    private double volume;
}
