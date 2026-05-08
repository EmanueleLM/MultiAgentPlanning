(define (domain Logistics19)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location
    city
    airplane
    package
    truck
  )

  (:predicates
    (at ?obj - (either package airplane truck) ?loc - location)
    (in ?pkg - package ?veh - (either airplane truck))
    (in-city ?loc - location ?city - city)
    (airport ?loc - location)
    (truck-city ?truck - truck ?city - city)
    (connected ?loc1 - location ?loc2 - location)
  )

  (:functions
    (total-cost) - number
  )

  ;; Action: Load package into truck
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?t)
      (increase (total-cost) 1)
    )
  )

  ;; Action: Unload package from truck
  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (not (in ?p ?t))
      (at ?p ?l)
      (increase (total-cost) 1)
    )
  )

  ;; Action: Drive truck between locations in the same city
  (:action drive-truck
    :parameters (?t - truck ?l-from - location ?l-to - location ?c - city)
    :precondition (and
      (at ?t ?l-from)
      (in-city ?l-from ?c)
      (in-city ?l-to ?c)
      (truck-city ?t ?c)
      (connected ?l-from ?l-to)
      (not (= ?l-from ?l-to))
    )
    :effect (and
      (not (at ?t ?l-from))
      (at ?t ?l-to)
      (increase (total-cost) 1)
    )
  )

  ;; Action: Load package into airplane
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?a)
      (increase (total-cost) 1)
    )
  )

  ;; Action: Unload package from airplane
  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (at ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (in ?p ?a))
      (at ?p ?l)
      (increase (total-cost) 1)
    )
  )

  ;; Action: Fly airplane between airport locations in different cities
  (:action fly-airplane
    :parameters (?a - airplane ?l-from - location ?l-to - location ?c-from - city ?c-to - city)
    :precondition (and
      (at ?a ?l-from)
      (airport ?l-from)
      (airport ?l-to)
      (in-city ?l-from ?c-from)
      (in-city ?l-to ?c-to)
      (not (= ?c-from ?c-to))
      (not (= ?l-from ?l-to))
    )
    :effect (and
      (not (at ?a ?l-from))
      (at ?a ?l-to)
      (increase (total-cost) 1)
    )
  )