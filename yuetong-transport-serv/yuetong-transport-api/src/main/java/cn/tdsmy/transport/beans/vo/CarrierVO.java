package cn.tdsmy.transport.beans.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CarrierVO {

    // 发货方信息
    private String sendCompany;
    private String sendAddress;
    private String sendLinkman;
    private String sendPhone;

    // 收货方信息
    private String receiveCompany;
    private String receiveAddress;
    private String receiveLinkman;
    private String receivePhone;


    // 发货时间
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date leaverDate;

    // 订单金额
    private Double insuranceCost;
    private Double transportCost;
    private Double otherCost;

    // 备注
    private String remark;

    private List<GoodsVO> goodsList;
}
