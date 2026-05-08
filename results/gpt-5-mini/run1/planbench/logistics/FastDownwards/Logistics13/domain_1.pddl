(define (domain logistics13)
  (:requirements :typing)
  (:types package truck airplane location city)

  (:predicates
    (at ?p - package ?l - location)           ; package is at a location (not loaded)
    (in-truck ?p - package ?t - truck)       ; package is inside a truck
    (in-plane ?p - package ?a - airplane)    ; package is inside an airplane
    (truck-at ?t - truck ?l - location)      ; truck is at a location
    (plane-at ?a - airplane ?l - location)   ; airplane is at a location (airport)
    (is-airport ?l - location)               ; location is an airport
    (in-city ?l - location ?c - city)        ; location belongs to a city
  )

  ;; Truck actions
  (:action load-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck-at ?t ?l)
      (at ?p ?l)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at ?p ?l))
    )
  )

  (:action unload-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck-at ?t ?l)
      (in-truck ?p ?t)
    )
    :effect (and
      (at ?p ?l)
      (not (in-truck ?p ?t))
    )
  )

  (:action drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck-at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (truck-at ?t ?to)
      (not (truck-at ?t ?from))
    )
  )

  ;; Airplane actions
  (:action load-plane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (plane-at ?a ?l)
      (at ?p ?l)
      (is-airport ?l)
    )
    :effect (and
      (in-plane ?p ?a)
      (not (at ?p ?l))
    )
  )

  (:action unload-plane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (plane-at ?a ?l)
      (in-plane ?p ?a)
      (is-airport ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in-plane ?p ?a))
    )
  )

  (:action fly
    :parameters (?a - airplane ?from - location ?to - location ?c_from - city ?c_to - city)
    :precondition (and
      (plane-at ?a ?from)
      (is-airport ?from)
      (is-airport ?to)
      (in-city ?from ?c_from)
      (in-city ?to ?c_to)
    )
    :effect (and
      (plane-at ?a ?to)
      (not (plane-at ?a ?from))
    )
  )
)