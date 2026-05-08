(define (domain multi_modal_logistics)
  (:requirements :strips :typing)
  (:types city location truck airplane package)

  (:predicates
    (location_in_city ?l - location ?c - city)
    (airport ?l - location)
    (different_city ?from - location ?to - location)

    (at-truck ?t - truck ?l - location)
    (at-plane ?pl - airplane ?l - location)
    (at-pkg ?p - package ?l - location)

    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?pl - airplane)
  )

  (:action truck-load
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (at-pkg ?p ?l)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at-pkg ?p ?l))
    )
  )

  (:action truck-unload
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in-truck ?p ?t)
      (at-truck ?t ?l)
    )
    :effect (and
      (at-pkg ?p ?l)
      (not (in-truck ?p ?t))
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
    )
  )

  (:action plane-load
    :parameters (?p - package ?pl - airplane ?l - location)
    :precondition (and
      (at-plane ?pl ?l)
      (at-pkg ?p ?l)
      (airport ?l)
    )
    :effect (and
      (in-plane ?p ?pl)
      (not (at-pkg ?p ?l))
    )
  )

  (:action plane-unload
    :parameters (?p - package ?pl - airplane ?l - location)
    :precondition (and
      (in-plane ?p ?pl)
      (at-plane ?pl ?l)
      (airport ?l)
    )
    :effect (and
      (at-pkg ?p ?l)
      (not (in-plane ?p ?pl))
    )
  )

  (:action plane-fly
    :parameters (?pl - airplane ?from - location ?to - location)
    :precondition (and
      (at-plane ?pl ?from)
      (airport ?from)
      (airport ?to)
      (different_city ?from ?to)
    )
    :effect (and
      (at-plane ?pl ?to)
      (not (at-plane ?pl ?from))
    )
  )
)