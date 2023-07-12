package cn.tdsmy.transport.beans;

import cn.tdsmy.core.annotation.Excel;
import cn.tdsmy.transport.beans.vo.CarrierVO;
import cn.tdsmy.transport.beans.vo.GoodsVO;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Carrier {

    @Excel(name = "承运单编号")
    private int carriersId;

    // 发货方信息
    @Excel(name = "发货单位")
    private String sendCompany;

    @Excel(name = "发货单位地址")
    private String sendAddress;

    @Excel(name = "发货人")
    private String sendLinkman;

    @Excel(name = "发货人电话")
    private String sendPhone;


    // 收货方信息
    @Excel(name = "收货单位")
    private String receiveCompany;

    @Excel(name = "收货单位地址")
    private String receiveAddress;

    @Excel(name = "收货人")
    private String receiveLinkman;

    @Excel(name = "收货人电话")
    private String receivePhone;


    @Excel(name = "承运日期")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date leaverDate;

    // 订单完成后补充
    @Excel(name = "承运日期")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date receiveDate;

    @Excel(name = "完成情况", readConverterExp = "0=待调度,1=已调度,2=运输中,3=已完成")
    private Integer finishedState;

    // 订单金额
    @Excel(name = "保险费")
    private Double insuranceCost;

    @Excel(name = "运费")
    private Double transportCost;

    @Excel(name = "其他费用")
    private Double otherCost;

    @Excel(name = "合计费用")
    private Double totalCost;

    @Excel(name = "备注")
    private String remark;


    @Excel(name = "业务员账号")
    private String account;

    @Excel(name = "录入时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date checkInTime;

    @Excel(name = "最后修改时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date alterTime;

    private List<Goods> goodsList;

    public static Carrier getCarrier(CarrierVO carrierVO) {
        Carrier carrier = new Carrier();

        carrier.setSendAddress(carrierVO.getSendAddress());
        carrier.setSendCompany(carrierVO.getSendCompany());
        carrier.setSendLinkman(carrierVO.getSendLinkman());
        carrier.setSendPhone(carrierVO.getSendPhone());

        carrier.setReceiveAddress(carrierVO.getReceiveAddress());
        carrier.setReceiveCompany(carrierVO.getReceiveCompany());
        carrier.setReceiveLinkman(carrierVO.getReceiveLinkman());
        carrier.setReceivePhone(carrierVO.getReceivePhone());

        carrier.setLeaverDate(carrierVO.getLeaverDate());
        carrier.setInsuranceCost(carrierVO.getInsuranceCost());
        carrier.setTransportCost(carrierVO.getTransportCost());
        carrier.setOtherCost(carrierVO.getOtherCost());

        carrier.setRemark(carrierVO.getRemark());

        List<Goods> list = new ArrayList<>();
        for (GoodsVO goodsVO : carrierVO.getGoodsList()) {
            Goods goods = new Goods();
            goods.setGoodsName(goodsVO.getGoodsName());
            goods.setAmount(goodsVO.getAmount());
            goods.setWeight(goodsVO.getWeight());
            goods.setVolume(goods.getVolume());
            list.add(goods);
        }
        carrier.setGoodsList(list);
        return carrier;
    }
}
