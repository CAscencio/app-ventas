package com.cascencio.dev.message;

import java.util.Optional;

public class PageRequest {
	
	public static final int DEFAULT_LIMITE = Integer.MAX_VALUE;
    public static final int DEFAULT_PAGINA = 1;
	
	private final Integer currentPage;
    private final Integer itemsPerPage;
    
	public PageRequest(Integer currentPage, Integer itemsPerPage) {
		this.currentPage = currentPage;
		this.itemsPerPage = itemsPerPage;
	}

	public Integer getCurrentPage() {
		return Optional.ofNullable(currentPage)
                .filter(valor -> valor >= 1)
                .orElse(DEFAULT_PAGINA);
	}

	public Integer getItemsPerPage() {
		return Optional.ofNullable(itemsPerPage)
                .filter(valor -> valor > 0)
                .orElse(DEFAULT_LIMITE);
	}

}
