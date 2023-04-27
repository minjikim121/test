package com.test.project.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.project.dto.TestDto;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String index(Model model) {

		TestDto a = new TestDto();
		a.setInsDate(LocalDateTime.now());
		TestDto b = new TestDto();
		b.setInsDate(LocalDateTime.now().minusDays(3));
		TestDto c = new TestDto();
		c.setInsDate(LocalDateTime.now().minusMonths(3));
		TestDto d = new TestDto();
		d.setInsDate(LocalDateTime.now().minusHours(3));
		TestDto e = new TestDto();
		e.setInsDate(LocalDateTime.now().minusMonths(8));
		TestDto f = new TestDto();
		f.setInsDate(LocalDateTime.now().minusMinutes(57));
		List<TestDto> insList = new ArrayList<>();
		insList.add(a);
		insList.add(b);
		insList.add(c);
		insList.add(d);
		insList.add(e);
		insList.add(f);

		model.addAttribute("insDateList",insList );
		return "Index";
	}
}
