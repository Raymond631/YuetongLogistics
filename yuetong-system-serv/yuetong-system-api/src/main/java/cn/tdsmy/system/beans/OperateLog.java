package cn.tdsmy.system.beans;

import cn.tdsmy.core.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OperateLog {
    /**
     * 日志主键
     */
    @Excel(name = "操作序号", cellType = Excel.ColumnType.NUMERIC)
    private Long operId;

    /**
     * 操作时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "操作时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date operTime;

    /**
     * 操作人员
     */
    @Excel(name = "操作人员")
    private String operName;

    /**
     * 操作地址
     */
    @Excel(name = "操作地址")
    private String operIp;

    /**
     * 操作模块
     */
    @Excel(name = "操作模块")
    private String title;

    /**
     * 业务类型
     */
    @Excel(name = "业务类型", readConverterExp = "0=其它,1=新增,2=删除,3=修改,,4=查询,5=导出")
    private Integer businessType;

    /**
     * 请求方法
     */
    @Excel(name = "请求方法")
    private String requestMethod;

    /**
     * 请求url
     */
    @Excel(name = "请求地址")
    private String operUrl;

    /**
     * 操作状态（0正常 1异常）
     */
    @Excel(name = "状态", readConverterExp = "0=正常,1=异常")
    private Integer status;

    /**
     * 消耗时间
     */
    @Excel(name = "消耗时间", suffix = "毫秒")
    private Long costTime;

    /**
     * 错误消息
     */
    @Excel(name = "错误消息")
    private String errorMsg;
}
