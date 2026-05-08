(define (domain logistics-27)
  ;; Logistics domain for the specific instance "Logistics27"
  ;; Compatible with FastDownward (:strips :typing :negative-preconditions)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    vehicle
    truck airplane - vehicle
    package
    location
    city
  )

  (:predicates
    ;; Package state
    (at ?p - package ?l - location)        ; package is at a location
    (in ?p - package ?v - vehicle)         ; package is in a vehicle

    ;; Vehicle location
    (vehicle-at ?v - vehicle ?l - location)

    ;; Location classification and city membership
    (airport ?l - location)                ; location is airport of its city
    (in-city ?l - location ?c - city)      ; location belongs to city
  )

  ;; -------------------------
  ;; Truck actions (intra-city)
  ;; -------------------------

  (:action truck-load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (vehicle-at ?t ?loc)
      (at ?p ?loc)
    )
    :effect (and
      (in ?p ?t)
      (not (at ?p ?loc))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (vehicle-at ?t ?loc)
      (in ?p ?t)
    )
    :effect (and
      (at ?p ?loc)
      (not (in ?p ?t))
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (vehicle-at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      ;; prevent no-op drive
      (not (vehicle-at ?t ?to))
    )
    :effect (and
      (vehicle-at ?t ?to)
      (not (vehicle-at ?t ?from))
    )
  )

  ;; -------------------------
  ;; Airplane actions (inter-city via airports)
  ;; -------------------------

  (:action plane-load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (vehicle-at ?a ?loc)
      (airport ?loc)
      (at ?p ?loc)
    )
    :effect (and
      (in ?p ?a)
      (not (at ?p ?loc))
    )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (vehicle-at ?a ?loc)
      (airport ?loc)
      (in ?p ?a)
    )
    :effect (and
      (at ?p ?loc)
      (not (in ?p ?a))
    )
  )

  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (vehicle-at ?a ?from)
      (airport ?from)
      (airport ?to)
      ;; prevent no-op flight
      (not (vehicle-at ?a ?to))
    )
    :effect (and
      (vehicle-at ?a ?to)
      (not (vehicle-at ?a ?from))
    )
  )
)