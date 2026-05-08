(define (domain logistics-logistics3)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    package airplane location city - object
  )
  (:predicates
    (at_package ?p - package ?l - location)
    (at_vehicle ?v - airplane ?l - location)
    (in ?p - package ?v - airplane)
    (loc-in-city ?l - location ?c - city)
    (loc-is-airport ?l - location)
  )
  (:functions (total-cost))

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