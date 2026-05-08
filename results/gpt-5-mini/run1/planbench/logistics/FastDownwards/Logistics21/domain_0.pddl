(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package location vehicle truck airplane
  )

  (:predicates
    (package-at ?p - package ?l - location)
    (vehicle-at ?v - vehicle ?l - location)
    (in ?p - package ?v - vehicle)
    (empty ?v - vehicle)
    (airport ?l - location)
    (road ?l1 - location ?l2 - location)
  )

  ;; Truck agent actions (truck-specific names and truck type parameters)
  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location)
    :precondition (and
      (vehicle-at ?tr ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (vehicle-at ?tr ?from))
      (vehicle-at ?tr ?to)
    )
  )

  (:action truck-load
    :parameters (?tr - truck ?p - package ?loc - location)
    :precondition (and
      (vehicle-at ?tr ?loc)
      (package-at ?p ?loc)
      (empty ?tr)
    )
    :effect (and
      (not (package-at ?p ?loc))
      (in ?p ?tr)
      (not (empty ?tr))
    )
  )

  (:action truck-unload
    :parameters (?tr - truck ?p - package ?loc - location)
    :precondition (and
      (vehicle-at ?tr ?loc)
      (in ?p ?tr)
    )
    :effect (and
      (package-at ?p ?loc)
      (not (in ?p ?tr))
      (empty ?tr)
    )
  )

  ;; Airplane agent actions (plane-specific names and airplane type parameters)
  (:action plane-fly
    :parameters (?pl - airplane ?from - location ?to - location)
    :precondition (and
      (vehicle-at ?pl ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (vehicle-at ?pl ?from))
      (vehicle-at ?pl ?to)
    )
  )

  (:action plane-load
    :parameters (?pl - airplane ?p - package ?loc - location)
    :precondition (and
      (vehicle-at ?pl ?loc)
      (package-at ?p ?loc)
      (empty ?pl)
      (airport ?loc)
    )
    :effect (and
      (not (package-at ?p ?loc))
      (in ?p ?pl)
      (not (empty ?pl))
    )
  )

  (:action plane-unload
    :parameters (?pl - airplane ?p - package ?loc - location)
    :precondition (and
      (vehicle-at ?pl ?loc)
      (in ?p ?pl)
      (airport ?loc)
    )
    :effect (and
      (package-at ?p ?loc)
      (not (in ?p ?pl))
      (empty ?pl)
    )
  )
)