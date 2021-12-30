package application.controllers;

import com.fathzer.soft.javaluator.DoubleEvaluator;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/calc")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class CalcController {

    @GetMapping(path ="/do", produces = "application/json")
    public @ResponseBody Object doCalc(@RequestParam String expression) {
        return new DoubleEvaluator().evaluate(expression);
    }
}
