package beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;


@AllArgsConstructor
@NoArgsConstructor
@Component
@Data
public class TruckTeam {
    private int teamID; // PK
    private String teamName;
    private String leader;
    private String remark;
    private String checkInTime;
    private boolean isDelete;
    private String alterTime;
}
