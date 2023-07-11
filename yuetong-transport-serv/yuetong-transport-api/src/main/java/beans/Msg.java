package beans;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Objects;

@AllArgsConstructor
@NoArgsConstructor
@Component
@Data
public class Msg {
    private int code; // http响应码
    private String msg; // http响应信息
    private ArrayList<Object> rows; // rows用于包含要提交的数据
    private Object data; // 不知道干嘛的
    private int total; // 不知道干嘛的
}
