package com.cascencio.dev.message;

import java.util.Collection;

public class PageResponse<T> {
	
	private final int total;
	private final Collection<T> items;
	private final Object data;

    public PageResponse(Collection<T> items) {
        this(items.size(), items, null);
    }

    public PageResponse(int total, Collection<T> items) {
        this(total, items, null);
    }

    public PageResponse(int total, Collection<T> items, Object data) {
        this.total = total;
        this.items = items;
        this.data = data;
    }

    public int getTotal() {
        return total;
    }

    public Collection<T> getItems() {
        return items;
    }

    public Object getData() {
        return data;
    }
}
