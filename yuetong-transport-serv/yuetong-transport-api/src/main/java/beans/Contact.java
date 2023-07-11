package beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@AllArgsConstructor
@NoArgsConstructor
@Component
@Data
public class Contact {
    private int contact_id;
    private int fk_truck_id;
    private int fk_driver_id;
}
