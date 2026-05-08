(define (domain logistics-logistics3)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    package vehicle location city - object
    truck airplane - vehicle
  )
  (:predicates
    (at_package ?p - package ?l - location)
    (at_vehicle ?v - vehicle ?l - location)
    (in ?p - package ?v - vehicle)
    (loc-in-city ?l - location ?c - city)
    (loc-is-airport ?l - location)
  )
  (:functions (total-cost))

  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at_package ?p ?l) (at_vehicle ?t ?l))
    :effect (and (not (at_package ?p ?l)) (in ?p ?t) (increase (total-cost) 1))
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in ?p ?t) (at_vehicle ?t ?l))
    :effect (and (not (in ?p ?t)) (at_package ?p ?l) (increase (total-cost) 1))
  )

  (:action drive-truck
    :parameters (?t - truck ?l1 - location ?l2 - location ?c - city)
    :precondition (and (at_vehicle ?t ?l1) (loc-in-city ?l1 ?c) (loc-in-city ?l2 ?c) (not (= ?l1 ?l2)))
    :effect (and (not (at_vehicle ?t ?l1)) (at_vehicle ?t ?l2) (increase (total-cost) 1))
  )

  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at_package ?p ?l) (at_vehicle ?a ?l) (loc-is-airport ?l))
    :effect (and (not (at_package ?p ?l)) (in ?p ?a) (increase (total-cost) 1))
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in ?p ?a) (at_vehicle ?a ?l) (loc-is-airport ?l))
    :effect (and (not (in ?p ?a)) (at_package ?p ?l) (increase (total-cost) 1))
  )

  (:action fly-airplane
    :parameters (?a - airplane ?l1 - location ?l2 - location ?c1 - city ?c2 - city)
    :precondition (and (at_vehicle ?a ?l1)
                        (loc-is-airport ?l1)
                        (loc-is-airport ?l2)
                        (loc-in-city ?l1 ?c1)
                        (loc-in-city ?l2 ?c2)
                        (not (= ?c1 ?c2)))
    :effect (and (not (at_vehicle ?a ?l1)) (at_vehicle ?a ?l2) (increase (total-cost) 1))
  )
)