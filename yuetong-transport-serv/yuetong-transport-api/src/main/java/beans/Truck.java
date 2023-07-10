package beans;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@AllArgsConstructor
@NoArgsConstructor
@Component
@Data
public class Truck {
    private int truckID; // PK
    private String number;
    private String buyDate;
    private String type;
    private long fkTeamID; // FK
    private long tonnage;
    private long state;
    private String remark;
    private String checkInTime;
    private boolean isDelete;
    private String alterTime;
}
