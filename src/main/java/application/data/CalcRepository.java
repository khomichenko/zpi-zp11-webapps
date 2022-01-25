package application.data;

import application.model.CalcHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface CalcRepository extends JpaRepository<CalcHistory, Long>, JpaSpecificationExecutor<CalcHistory> {

}
