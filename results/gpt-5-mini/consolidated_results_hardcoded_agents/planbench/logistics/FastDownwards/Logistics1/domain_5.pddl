(define (domain Logistics1)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city stage)

  (:predicates
    (package-at ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)
    (truck-at ?t - truck ?l - location)
    (airplane-at ?a - airplane ?l - location)
    (located-in-city ?l - location ?c - city)
    (airport ?l - location)
    (current-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
    (diff ?l1 - location ?l2 - location)
  )

  ;; Truck actions: require truck and package co-located; consume one stage and advance to successor.
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?sn - stage)
    :precondition (and
      (truck-at ?t ?l)
      (package-at ?p ?l)
      (current-stage ?s)
      (next ?s ?sn)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (package-at ?p ?l))
      (not (current-stage ?s))
      (current-stage ?sn)
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?sn - stage)
    :precondition (and
      (truck-at ?t ?l)
      (in-truck ?p ?t)
      (current-stage ?s)
      (next ?s ?sn)
    )
    :effect (and
      (package-at ?p ?l)
      (not (in-truck ?p ?t))
      (not (current-stage ?s))
      (current-stage ?sn)
    )
  )

  ;; Driving constrained to locations in same city. Use diff to forbid no-op drives (from == to).
  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?sn - stage)
    :precondition (and
      (truck-at ?t ?from)
      (located-in-city ?from ?c)
      (located-in-city ?to ?c)
      (diff ?from ?to)
      (current-stage ?s)
      (next ?s ?sn)
    )
    :effect (and
      (truck-at ?t ?to)
      (not (truck-at ?t ?from))
      (not (current-stage ?s))
      (current-stage ?sn)
    )
  )

  ;; Airplane actions: load/unload only at airport locations; fly between distinct airports.
  (:action airplane-load
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?sn - stage)
    :precondition (and
      (airplane-at ?a ?l)
      (airport ?l)
      (package-at ?p ?l)
      (current-stage ?s)
      (next ?s ?sn)
    )
    :effect (and
      (in-airplane ?p ?a)
      (not (package-at ?p ?l))
      (not (current-stage ?s))
      (current-stage ?sn)
    )
  )

  (:action airplane-unload
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?sn - stage)
    :precondition (and
      (airplane-at ?a ?l)
      (airport ?l)
      (in-airplane ?p ?a)
      (current-stage ?s)
      (next ?s ?sn)
    )
    :effect (and
      (package-at ?p ?l)
      (not (in-airplane ?p ?a))
      (not (current-stage ?s))
      (current-stage ?sn)
    )
  )

  (:action airplane-fly
    :parameters (?a - airplane ?from - location ?to - location ?s - stage ?sn - stage)
    :precondition (and
      (airplane-at ?a ?from)
      (airport ?from)
      (airport ?to)
      (diff ?from ?to)
      (current-stage ?s)
      (next ?s ?sn)
    )
    :effect (and
      (airplane-at ?a ?to)
      (not (airplane-at ?a ?from))
      (not (current-stage ?s))
      (current-stage ?sn)
    )
  )
)