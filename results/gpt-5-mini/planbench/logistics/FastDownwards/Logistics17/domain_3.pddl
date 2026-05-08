(define (domain logistics17)
  (:requirements :strips :typing)
  (:types truck airplane package location city)

  (:predicates
    ;; package at a location
    (at ?p - package ?l - location)

    ;; vehicle locations
    (at_truck ?t - truck ?l - location)
    (at_airplane ?a - airplane ?l - location)

    ;; containment
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)

    ;; map/connectivity and city membership
    (airport ?l - location)
    (in_city ?l - location ?c - city)
    (can_fly ?from - location ?to - location)
  )

  ;; drive a truck between two locations in the same city
  (:action drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  ;; load package into truck (requires package and truck at same location)
  (:action load-into-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at_truck ?t ?l)
      (at ?p ?l)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at ?p ?l))
    )
  )

  ;; unload package from truck (places package at truck's location)
  (:action unload-from-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in_truck ?p ?t))
    )
  )

  ;; load package into airplane (requires airplane and package at same airport location)
  (:action load-into-airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at_airplane ?a ?l)
      (at ?p ?l)
      (airport ?l)
    )
    :effect (and
      (in_airplane ?p ?a)
      (not (at ?p ?l))
    )
  )

  ;; unload package from airplane (places package at airplane's location)
  (:action unload-from-airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (in_airplane ?p ?a)
      (at_airplane ?a ?l)
      (airport ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in_airplane ?p ?a))
    )
  )

  ;; fly airplane between airports (requires explicit can_fly connectivity)
  (:action fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (can_fly ?from ?to)
    )
    :effect (and
      (not (at_airplane ?a ?from))
      (at_airplane ?a ?to)
    )
  )
)