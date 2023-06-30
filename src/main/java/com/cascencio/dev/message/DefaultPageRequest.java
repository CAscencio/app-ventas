package com.cascencio.dev.message;

import java.util.Optional;

public class DefaultPageRequest extends PageRequest {
	
	private final String searchCriteria;

	public DefaultPageRequest(String searchCriteria, Integer currentPage, Integer itemsPerPage) {
		super(currentPage, itemsPerPage);
		this.searchCriteria = searchCriteria;
	}

	public String getSearchCriteria() {
		return Optional.ofNullable(searchCriteria)
				.orElse("");
	}

}
