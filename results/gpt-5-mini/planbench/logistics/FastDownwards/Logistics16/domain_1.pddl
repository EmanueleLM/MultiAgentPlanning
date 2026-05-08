(define (domain logistics16)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane vehicle package location city)
  ;; trucks and airplanes are vehicles
  (:types truck airplane - vehicle)

  (:predicates
    ;; vehicle locations (trucks and airplanes)
    (at ?veh - vehicle ?loc - location)

    ;; package is on the ground at a location
    (at_pkg ?p - package ?loc - location)

    ;; package is inside a vehicle (truck or airplane)
    (in ?p - package ?veh - vehicle)

    ;; airport marker for locations that are airports
    (airport ?loc - location)

    ;; location-to-city relation
    (in_city ?loc - location ?c - city)
  )

  ;; Drive a truck between two locations in the same city
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Fly an airplane between two airports
  (:action fly-plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  ;; Load a package from the ground into a truck
  (:action load-truck
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at ?t ?loc)
      (at_pkg ?p ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in ?p ?t)
    )
  )

  ;; Unload a package from a truck to the ground at the truck's location
  (:action unload-truck
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at ?t ?loc)
      (in ?p ?t)
    )
    :effect (and
      (not (in ?p ?t))
      (at_pkg ?p ?loc)
    )
  )

  ;; Load a package from the ground into an airplane (at same location)
  (:action load-plane
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at ?a ?loc)
      (at_pkg ?p ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in ?p ?a)
    )
  )

  ;; Unload a package from an airplane to the ground at the airplane's location
  (:action unload-plane
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at ?a ?loc)
      (in ?p ?a)
    )
    :effect (and
      (not (in ?p ?a))
      (at_pkg ?p ?loc)
    )
  )
)