(define (domain logistics18)
  (:requirements :strips :typing)
  (:types package truck airplane location city)

  (:predicates
    ;; topology
    (in_city ?l - location ?c - city)
    (is_airport ?l - location)

    ;; dynamic state
    (at_pkg ?p - package ?l - location)        ;; package is at a location
    (truck_at ?t - truck ?l - location)       ;; truck is at a location
    (airplane_at ?a - airplane ?l - location) ;; airplane is at a location
    (in_truck ?p - package ?t - truck)        ;; package is inside truck
    (in_airplane ?p - package ?a - airplane)  ;; package is inside airplane
  )

  ;; load package into truck: package and truck must be at same location
  (:action load_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at_pkg ?p ?loc)
      (truck_at ?t ?loc)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at_pkg ?p ?loc))
    )
  )

  ;; unload package from truck: package ends up at the truck's current location
  (:action unload_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (in_truck ?p ?t)
      (truck_at ?t ?loc)
    )
    :effect (and
      (at_pkg ?p ?loc)
      (not (in_truck ?p ?t))
    )
  )

  ;; drive truck within its current city between any two locations in that city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck_at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (truck_at ?t ?to)
      (not (truck_at ?t ?from))
    )
  )

  ;; load package into airplane: both package and airplane must be at the same airport location
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at_pkg ?p ?loc)
      (airplane_at ?a ?loc)
      (is_airport ?loc)
    )
    :effect (and
      (in_airplane ?p ?a)
      (not (at_pkg ?p ?loc))
    )
  )

  ;; unload package from airplane: package ends up at the airplane's current airport location
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in_airplane ?p ?a)
      (airplane_at ?a ?loc)
      (is_airport ?loc)
    )
    :effect (and
      (at_pkg ?p ?loc)
      (not (in_airplane ?p ?a))
    )
  )

  ;; fly airplane between airports (inter-city)
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location ?cf - city ?ct - city)
    :precondition (and
      (airplane_at ?a ?from)
      (is_airport ?from)
      (is_airport ?to)
      (in_city ?from ?cf)
      (in_city ?to ?ct)
    )
    :effect (and
      (airplane_at ?a ?to)
      (not (airplane_at ?a ?from))
    )
  )
)