(define (domain logistics22)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck plane - vehicle package location city)

  (:predicates
    (at ?v - vehicle ?l - location)        ; vehicle at location
    (at-pkg ?p - package ?l - location)   ; package on the ground at location
    (in ?p - package ?v - vehicle)        ; package inside vehicle
    (airport ?l - location)               ; location is an airport
    (in-city ?l - city)                   ; location belongs to a city
    (free ?v - vehicle)                   ; vehicle free to accept a package (capacity 1)
  )

  ;; Truck actions (operate inside a city)
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at ?t ?l)
      (at-pkg ?p ?l)
      (free ?t)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (in ?p ?t)
      (not (free ?t))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at ?t ?l)
      (in ?p ?t)
    )
    :effect (and
      (not (in ?p ?t))
      (at-pkg ?p ?l)
      (free ?t)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Plane actions (operate between airports)
  (:action plane-load
    :parameters (?pl - plane ?p - package ?l - location)
    :precondition (and
      (at ?pl ?l)
      (at-pkg ?p ?l)
      (free ?pl)
      (airport ?l)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (in ?p ?pl)
      (not (free ?pl))
    )
  )

  (:action plane-unload
    :parameters (?pl - plane ?p - package ?l - location)
    :precondition (and
      (at ?pl ?l)
      (in ?p ?pl)
      (airport ?l)
    )
    :effect (and
      (not (in ?p ?pl))
      (at-pkg ?p ?l)
      (free ?pl)
    )
  )

  (:action plane-fly
    :parameters (?pl - plane ?from - location ?to - location)
    :precondition (and
      (at ?pl ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at ?pl ?from))
      (at ?pl ?to)
    )
  )
)