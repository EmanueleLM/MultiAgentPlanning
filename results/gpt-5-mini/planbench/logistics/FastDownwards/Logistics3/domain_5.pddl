(define (domain city_logistics)
  (:requirements :strips :typing)
  (:types
    city
    location
    airport - location
    vehicle
    truck airplane - vehicle
    package
  )

  (:predicates
    (at ?v - vehicle ?l - location)               ; vehicle at location
    (at_package ?p - package ?l - location)      ; package at location
    (loaded_in ?p - package ?v - vehicle)        ; package loaded in vehicle
    (in_city ?l - location ?c - city)            ; location belongs to city
    (truck_assigned_to_city ?t - truck ?c - city); truck assigned to a city
    (air_route ?from - airport ?to - airport)    ; direct air route between airports (directed)
  )

  ;; load package into truck: require package and truck co-located
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?t ?l)
      (at_package ?p ?l)
    )
    :effect (and
      (loaded_in ?p ?t)
      (not (at_package ?p ?l))
    )
  )

  ;; unload package from truck: package ends up at truck's current location
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (loaded_in ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (not (loaded_in ?p ?t))
      (at_package ?p ?l)
    )
  )

  ;; load package into airplane: airplane and package must be at same airport
  (:action load_plane
    :parameters (?p - package ?a - airplane ?l - airport)
    :precondition (and
      (at ?a ?l)
      (at_package ?p ?l)
    )
    :effect (and
      (loaded_in ?p ?a)
      (not (at_package ?p ?l))
    )
  )

  ;; unload package from airplane: package ends up at airplane's current airport
  (:action unload_plane
    :parameters (?p - package ?a - airplane ?l - airport)
    :precondition (and
      (loaded_in ?p ?a)
      (at ?a ?l)
    )
    :effect (and
      (not (loaded_in ?p ?a))
      (at_package ?p ?l)
    )
  )

  ;; drive truck between two locations inside the same city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (truck_assigned_to_city ?t ?c)
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
    )
  )

  ;; fly airplane between two airports when route exists
  (:action fly_plane
    :parameters (?a - airplane ?from - airport ?to - airport)
    :precondition (and
      (at ?a ?from)
      (air_route ?from ?to)
    )
    :effect (and
      (at ?a ?to)
      (not (at ?a ?from))
    )
  )
)