package beans;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Component
@Data
public class Truck {
    private int truckID; // PK
    private String number;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone="GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String buyDate;
    private String type;
    private long fkTeamID; // FK
    private long tonnage;
    private long state;
    private String remark;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date checkInTime;
    private boolean isDelete;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date alterTime;
}
