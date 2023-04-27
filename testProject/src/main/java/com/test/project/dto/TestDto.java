package com.test.project.dto;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TestDto {
	
	

	public LocalDateTime getInsDate() {
		return insDate;
	}

	public void setInsDate(LocalDateTime insDate) {
		this.insDate = insDate;
	}

	private LocalDateTime insDate;
}
