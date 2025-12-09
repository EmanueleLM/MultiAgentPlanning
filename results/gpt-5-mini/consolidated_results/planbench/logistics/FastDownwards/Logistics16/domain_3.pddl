(define (domain logistics-with-phases)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    truck
    airplane
    package
    location
    city
    phase
  )

  (:predicates
    (at-truck ?t - truck ?l - location)
    (at-plane ?a - airplane ?l - location)
    (at-pkg ?p - package ?l - location)

    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    (airport ?l - location)
    (loc-in ?l - location ?c - city)

    (current-phase ?ph - phase)
    (phase-next ?ph - phase ?phn - phase)
    (phase-act ?ph - phase)
  )

  (:action load-truck
    :parameters (?t - truck ?p - package ?l - location ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (phase-next ?ph ?phn)
      (phase-act ?ph)
      (at-truck ?t ?l)
      (at-pkg ?p ?l)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at-pkg ?p ?l))
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  (:action unload-truck
    :parameters (?t - truck ?p - package ?l - location ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (phase-next ?ph ?phn)
      (phase-act ?ph)
      (at-truck ?t ?l)
      (in-truck ?p ?t)
    )
    :effect (and
      (at-pkg ?p ?l)
      (not (in-truck ?p ?t))
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (phase-next ?ph ?phn)
      (phase-act ?ph)
      (at-truck ?t ?from)
      (loc-in ?from ?c)
      (loc-in ?to ?c)
      (not (= ?from ?to))
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  (:action load-plane
    :parameters (?a - airplane ?p - package ?l - location ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (phase-next ?ph ?phn)
      (phase-act ?ph)
      (at-plane ?a ?l)
      (at-pkg ?p ?l)
      (airport ?l)
    )
    :effect (and
      (in-plane ?p ?a)
      (not (at-pkg ?p ?l))
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  (:action unload-plane
    :parameters (?a - airplane ?p - package ?l - location ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (phase-next ?ph ?phn)
      (phase-act ?ph)
      (at-plane ?a ?l)
      (in-plane ?p ?a)
      (airport ?l)
    )
    :effect (and
      (at-pkg ?p ?l)
      (not (in-plane ?p ?a))
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  (:action fly-plane
    :parameters (?a - airplane ?from - location ?to - location ?ph - phase ?phn - phase)
    :precondition (and
      (current-phase ?ph)
      (phase-next ?ph ?phn)
      (phase-act ?ph)
      (at-plane ?a ?from)
      (airport ?from)
      (airport ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (at-plane ?a ?to)
      (not (at-plane ?a ?from))
      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )
)