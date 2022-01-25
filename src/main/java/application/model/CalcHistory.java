package application.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity @Data
@Table(name = "history")
@EqualsAndHashCode() @NoArgsConstructor
@ToString(onlyExplicitlyIncluded = true)
public class CalcHistory {

    @Id @ToString.Include @Column(nullable=false, updatable=false) @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;

    @CreationTimestamp @Column(nullable = false, updatable = false) private Date created;
    @Basic @Column private String expression;
    @Basic @Column private String result;

    public CalcHistory(String expression, Double result) {
        this(expression,""+result);
    }
    public CalcHistory(String expression, String result) {
        this.created = new Date();
        this.expression = expression;
        this.result = result;
    }
}
