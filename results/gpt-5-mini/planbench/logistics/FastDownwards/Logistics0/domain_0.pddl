(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city)

  (:predicates
    ;; location of movable objects (trucks, airplanes, packages when not loaded)
    (at ?obj - (truck airplane package) ?loc - location)
    ;; package containment predicates
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)
    ;; administrative predicates
    (in-city ?loc - location ?c - city)
    ;; connectivity between locations (direct travel allowed when road/airlink holds)
    (road ?from - location ?to - location)
    (airlink ?from - location ?to - location)
  )

  ;; Truck actions (distinct agent from airplane)
  (:action load-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at ?p ?loc)
      (at ?t ?loc)
      (not (in-truck ?p ?t))
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at ?p ?loc))
    )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (in-truck ?p ?t)
      (at ?t ?loc)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at ?p ?loc)
    )
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (at ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Airplane actions (kept distinct; not required by the minimal plan but provided for completeness)
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at ?p ?loc)
      (at ?a ?loc)
      (not (in-airplane ?p ?a))
    )
    :effect (and
      (in-airplane ?p ?a)
      (not (at ?p ?loc))
    )
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in-airplane ?p ?a)
      (at ?a ?loc)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at ?p ?loc)
    )
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (airlink ?from ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)