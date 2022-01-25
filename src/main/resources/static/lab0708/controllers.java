package application.controllers;

import application.model.CalcHistory;
import application.services.CalcService;
import com.fathzer.soft.javaluator.DoubleEvaluator;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/calc")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class CalcController {

    private final CalcService service;

    @GetMapping(path ="/do", produces = "application/json")
    public @ResponseBody Object doCalc(@RequestParam String expression) {
        Double result = new DoubleEvaluator().evaluate(expression);
        // зберігаємо історію в базу даних
        service.saveHistory(new CalcHistory(expression,result));
        return result;
    }

    @GetMapping(path ="/history", produces = "application/json")
    public @ResponseBody List<CalcHistory> getCalcHistory() {
        // повертаємо історію в виді json для сайта
        return service.list();
    }
}
