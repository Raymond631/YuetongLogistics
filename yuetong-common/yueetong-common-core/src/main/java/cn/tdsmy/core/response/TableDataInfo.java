package cn.tdsmy.core.response;

import cn.tdsmy.core.constant.HttpStatus;
import com.github.pagehelper.PageInfo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * 表格分页数据对象
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TableDataInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 消息状态码
     */
    private int code;

    /**
     * 列表数据
     */
    private List<?> rows;

    /**
     * 消息内容
     */
    private String msg;

    /**
     * 总记录数
     */
    private long Total;

    @SuppressWarnings({"rawtypes", "unchecked"})
    protected TableDataInfo getDataTable(List<?> list) {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setRows(list);
        rspData.setMsg("查询成功");
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }
}
