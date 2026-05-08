(define (domain logistics14)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    ;; package location (package is at a location, not inside a vehicle)
    (at_package ?p - package ?l - location)
    ;; truck and airplane locations
    (at_truck ?t - truck ?l - location)
    (at_airplane ?a - airplane ?l - location)
    ;; package inside vehicles
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    ;; location -> city membership
    (in_city ?l - location ?c - city)
    ;; airport marker for locations
    (airport ?l - location)
  )

  ;; Truck actions (truck_agent prefix)
  (:action truck_agent-load
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_package ?p ?l)
      (at_truck ?t ?l)
    )
    :effect (and
      (not (at_package ?p ?l))
      (in_truck ?p ?t)
    )
  )

  (:action truck_agent-unload
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?l)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at_package ?p ?l)
    )
  )

  ;; Drive allowed only between locations in the same city.
  ;; The city parameter enforces the structural constraint that both
  ;; locations belong to the same city.
  (:action truck_agent-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  ;; Airplane actions (airplane_agent prefix)
  ;; Loading/unloading at airports only.
  (:action airplane_agent-load
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_package ?p ?l)
      (at_airplane ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (at_package ?p ?l))
      (in_airplane ?p ?a)
    )
  )

  (:action airplane_agent-unload
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_airplane ?p ?a)
      (at_airplane ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (at_package ?p ?l)
    )
  )

  ;; Fly between airport locations (airplanes move between airports of cities)
  (:action airplane_agent-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_airplane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at_airplane ?a ?from))
      (at_airplane ?a ?to)
    )
  )
)