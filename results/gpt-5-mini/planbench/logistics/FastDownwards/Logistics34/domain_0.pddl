(define (domain jack_of_all_trades)
  (:requirements :strips :typing)
  (:types package truck airplane location city)
  (:predicates
    (package_at ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    (truck_at ?t - truck ?l - location)
    (airplane_at ?a - airplane ?l - location)
    (in_city ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; load package into truck at same location
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (package_at ?p ?l)
      (truck_at ?t ?l)
    )
    :effect (and
      (not (package_at ?p ?l))
      (in_truck ?p ?t)
    )
  )

  ;; unload package from truck to the truck's current location
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (truck_at ?t ?l)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (package_at ?p ?l)
    )
  )

  ;; load package into airplane at same location
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (package_at ?p ?l)
      (airplane_at ?a ?l)
    )
    :effect (and
      (not (package_at ?p ?l))
      (in_airplane ?p ?a)
    )
  )

  ;; unload package from airplane to the airplane's current location
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_airplane ?p ?a)
      (airplane_at ?a ?l)
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (package_at ?p ?l)
    )
  )

  ;; drive truck between two locations in the same city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck_at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (truck_at ?t ?from))
      (truck_at ?t ?to)
    )
  )

  ;; fly airplane between airports
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airplane_at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (airplane_at ?a ?from))
      (airplane_at ?a ?to)
    )
  )
)