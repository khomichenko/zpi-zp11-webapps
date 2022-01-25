package application.services;

import application.data.CalcRepository;
import application.model.CalcHistory;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class CalcService {

    private final CalcRepository repo;

    public List<CalcHistory> list() {
        return repo.findAll();
    }

    public CalcHistory saveHistory(CalcHistory history) {
        return repo.saveAndFlush(history);
    }

}
