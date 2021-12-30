package application.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/calc")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class CalcController {

    @GetMapping(path ="/do", produces = "application/json")
    public @ResponseBody String doCalc(@RequestParam String expression) {
        return "Hi";
    }
}
