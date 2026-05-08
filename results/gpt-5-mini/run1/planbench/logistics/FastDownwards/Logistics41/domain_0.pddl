(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types package airplane truck location city)

  (:predicates
    (at ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    (at_truck ?t - truck ?l - location)
    (at_airplane ?a - airplane ?l - location)
    (airport ?l - location)
    (loc_in_city ?l - location ?c - city)
  )

  ;; Load a package into a truck: package and truck must be co-located.
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at_truck ?t ?l)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at ?p ?l))
    )
  )

  ;; Unload a package from a truck: package must be in the truck; truck at location.
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in_truck ?p ?t))
    )
  )

  ;; Load a package into an airplane: package and airplane must be co-located.
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at_airplane ?a ?l)
    )
    :effect (and
      (in_airplane ?p ?a)
      (not (at ?p ?l))
    )
  )

  ;; Unload a package from an airplane: package must be in the airplane; airplane at location.
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_airplane ?p ?a)
      (at_airplane ?a ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in_airplane ?p ?a))
    )
  )

  ;; Drive a truck between two locations in the same city.
  ;; Both locations must be associated with the same city via loc_in_city.
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (loc_in_city ?from ?c)
      (loc_in_city ?to ?c)
    )
    :effect (and
      (at_truck ?t ?to)
      (not (at_truck ?t ?from))
    )
  )

  ;; Fly an airplane between airport locations.
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_airplane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (at_airplane ?a ?to)
      (not (at_airplane ?a ?from))
    )
  )
)