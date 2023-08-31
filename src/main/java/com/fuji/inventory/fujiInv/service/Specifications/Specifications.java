package com.fuji.inventory.fujiInv.service.Specifications;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;

import java.util.function.Predicate;

public interface Specifications <T>{
    Predicate proPredicate(Root<T> root, CriteriaQuery query, CriteriaBuilder cb);
}
