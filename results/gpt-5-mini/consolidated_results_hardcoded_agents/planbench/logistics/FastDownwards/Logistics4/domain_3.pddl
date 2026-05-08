(define (domain multi-transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    vehicle
    truck airplane - vehicle
    package
    city
    location
    stage
  )

  (:predicates
    ; location predicates for vehicles and packages
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-pkg ?p - package ?l - location)

    ; package is in a vehicle (truck or airplane)
    (in ?p - package ?v - vehicle)

    ; infrastructure and topology
    (airport ?l - location)
    (same-city ?l1 - location ?l2 - location)

    ; explicit stage progression (discrete time steps)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ; -------------------------
  ; TRUCK actions (prefixed with truck-)
  ; Each action consumes the current stage and produces the successor stage.
  ; -------------------------
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?l)
      (at-pkg ?p ?l)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (in ?p ?t)
      (not (at-pkg ?p ?l))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?l)
      (in ?p ?t)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (at-pkg ?p ?l)
      (not (in ?p ?t))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?from)
      (same-city ?from ?to)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
      (not (current ?s))
      (current ?s2)
    )
  )

  ; -------------------------
  ; AIRPLANE actions (prefixed with plane-)
  ; -------------------------
  (:action plane-load
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (airport ?l)
      (at-airplane ?a ?l)
      (at-pkg ?p ?l)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (in ?p ?a)
      (not (at-pkg ?p ?l))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (airport ?l)
      (at-airplane ?a ?l)
      (in ?p ?a)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (at-pkg ?p ?l)
      (not (in ?p ?a))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (at-airplane ?a ?to)
      (not (at-airplane ?a ?from))
      (not (current ?s))
      (current ?s2)
    )
  )
)