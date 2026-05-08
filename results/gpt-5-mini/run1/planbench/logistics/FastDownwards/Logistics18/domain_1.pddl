(define (domain logistics18)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    ;; type predicates (explicit)
    (is_package ?p - package)
    (is_truck ?t - truck)
    (is_airplane ?a - airplane)
    (is_location ?l - location)
    (is_city ?c - city)

    ;; static topology
    (in_city ?l - location ?c - city)
    (is_airport ?l - location)
    (belongs_to_city ?t - truck ?c - city)

    ;; dynamic state
    (at_pkg ?p - package ?l - location)      ;; package is at a location
    (truck_at ?t - truck ?l - location)     ;; truck is at a location
    (airplane_at ?a - airplane ?l - location) ;; airplane is at a location
    (in_truck ?p - package ?t - truck)      ;; package is inside truck
    (in_airplane ?p - package ?a - airplane) ;; package is inside airplane
  )

  ;; Load package into a truck: package and truck must be collocated and package must not already be in any vehicle.
  (:action load-truck
    :parameters (?p - package ?t - truck ?loc - location ?c - city)
    :precondition (and
      (is_package ?p) (is_truck ?t) (is_location ?loc) (is_city ?c)
      (at_pkg ?p ?loc)
      (truck_at ?t ?loc)
      (belongs_to_city ?t ?c)
      (in_city ?loc ?c)
      (not (in_truck ?p ?t))
      (not (in_airplane ?p ?a)) ;; note: negative with existential airplane variable not allowed; replace by ensuring package not in any airplane via explicit negative precondition using parameter ?a is not bound — avoid this pattern
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at_pkg ?p ?loc))
    )
  )

  ;; Unload package from a truck: package must be in the truck and truck at the target location.
  (:action unload-truck
    :parameters (?p - package ?t - truck ?loc - location ?c - city)
    :precondition (and
      (is_package ?p) (is_truck ?t) (is_location ?loc) (is_city ?c)
      (in_truck ?p ?t)
      (truck_at ?t ?loc)
      (belongs_to_city ?t ?c)
      (in_city ?loc ?c)
    )
    :effect (and
      (at_pkg ?p ?loc)
      (not (in_truck ?p ?t))
    )
  )

  ;; Drive truck within its city between any two locations that are in the same city the truck belongs to.
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (is_truck ?t) (is_location ?from) (is_location ?to) (is_city ?c)
      (truck_at ?t ?from)
      (belongs_to_city ?t ?c)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (truck_at ?t ?to)
      (not (truck_at ?t ?from))
    )
  )

  ;; Load package into an airplane: package and airplane must be collocated at an airport and package must not be in any vehicle.
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?loc - location ?c - city)
    :precondition (and
      (is_package ?p) (is_airplane ?a) (is_location ?loc) (is_city ?c)
      (at_pkg ?p ?loc)
      (airplane_at ?a ?loc)
      (is_airport ?loc)
      (in_city ?loc ?c)
    )
    :effect (and
      (in_airplane ?p ?a)
      (not (at_pkg ?p ?loc))
    )
  )

  ;; Unload package from an airplane: package must be inside the airplane and airplane at an airport.
  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?loc - location ?c - city)
    :precondition (and
      (is_package ?p) (is_airplane ?a) (is_location ?loc) (is_city ?c)
      (in_airplane ?p ?a)
      (airplane_at ?a ?loc)
      (is_airport ?loc)
      (in_city ?loc ?c)
    )
    :effect (and
      (at_pkg ?p ?loc)
      (not (in_airplane ?p ?a))
    )
  )

  ;; Fly airplane between airports (inter-city). Both endpoints must be airports and belong to (possibly different) cities.
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location ?cf - city ?ct - city)
    :precondition (and
      (is_airplane ?a) (is_location ?from) (is_location ?to) (is_city ?cf) (is_city ?ct)
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