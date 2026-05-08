(define (domain logistics-logistics3)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    package vehicle location city - object
    truck airplane - vehicle
  )
  (:predicates
    (at ?o - (or package vehicle) ?l - location)
    (in ?p - package ?v - vehicle)
    (loc-in-city ?l - location ?c - city)
    (loc-is-airport ?l - location)
  )
  (:functions (total-cost))

  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at ?p ?l) (at ?t ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?t) (increase (total-cost) 1))
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in ?p ?t) (at ?t ?l))
    :effect (and (not (in ?p ?t)) (at ?p ?l) (increase (total-cost) 1))
  )

  (:action drive-truck
    :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
    :precondition (and (at ?t ?l1) (loc-in-city ?l1 ?c) (loc-in-city ?l2 ?c) (not (= ?l1 ?l2)))
    :effect (and (not (at ?t ?l1)) (at ?t ?l2) (increase (total-cost) 1))
  )

  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at ?p ?l) (at ?a ?l) (loc-is-airport ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?a) (increase (total-cost) 1))
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in ?p ?a) (at ?a ?l) (loc-is-airport ?l))
    :effect (and (not (in ?p ?a)) (at ?p ?l) (increase (total-cost) 1))
  )

  (:action fly-airplane
    :parameters (?a - airplane ?l1 - location ?l2 - location ?c1 - city ?c2 - city)
    :precondition (and (at ?a ?l1)
                        (loc-is-airport ?l1)
                        (loc-is-airport ?l2)
                        (loc-in-city ?l1 ?c1)
                        (loc-in-city ?l2 ?c2)
                        (not (= ?c1 ?c2)))
    :effect (and (not (at ?a ?l1)) (at ?a ?l2) (increase (total-cost) 1))
  )
)