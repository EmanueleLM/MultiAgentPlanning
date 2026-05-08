(define (domain logistics16)
  (:requirements :strips :typing)
  (:types
    vehicle package location city
    truck airplane - vehicle
  )

  (:predicates
    (at ?veh - vehicle ?loc - location)
    (at_package ?p - package ?loc - location)
    (in_vehicle ?p - package ?veh - vehicle)
    (airport ?loc - location)
    (in_city ?loc - location ?c - city)
    (truck_in_city ?t - truck ?c - city)
  )

  ;; drive a truck between two locations in the same city;
  ;; the truck must be assigned to that city (prevents driving across cities)
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (truck_in_city ?t ?c)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; fly an airplane between two airports
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

  ;; load a package into a truck (vehicle and package must be co-located)
  (:action load-truck
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at ?t ?loc)
      (at_package ?p ?loc)
    )
    :effect (and
      (not (at_package ?p ?loc))
      (in_vehicle ?p ?t)
    )
  )

  ;; unload a package from a truck (package ends up at truck's location)
  (:action unload-truck
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at ?t ?loc)
      (in_vehicle ?p ?t)
    )
    :effect (and
      (not (in_vehicle ?p ?t))
      (at_package ?p ?loc)
    )
  )

  ;; load a package into an airplane (co-location required)
  (:action load-plane
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at ?a ?loc)
      (at_package ?p ?loc)
    )
    :effect (and
      (not (at_package ?p ?loc))
      (in_vehicle ?p ?a)
    )
  )

  ;; unload a package from an airplane (package ends up at airplane's location)
  (:action unload-plane
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at ?a ?loc)
      (in_vehicle ?p ?a)
    )
    :effect (and
      (not (in_vehicle ?p ?a))
      (at_package ?p ?loc)
    )
  )
)