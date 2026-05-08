(define (domain logistics11)
  (:requirements :strips :typing)
  (:types truck airplane location city package)

  (:predicates
    (at_truck ?t - truck ?loc - location)
    (at_plane ?a - airplane ?loc - location)
    (at_pkg ?p - package ?loc - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
    (in_city ?loc - location ?c - city)
    (airport ?loc - location)
    (road_connected ?l1 - location ?l2 - location)
    (air_route ?l1 - location ?l2 - location)
  )

  (:action truck-load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and (at_truck ?t ?loc) (at_pkg ?p ?loc))
    :effect (and (not (at_pkg ?p ?loc)) (in_truck ?p ?t))
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and (at_truck ?t ?loc) (in_truck ?p ?t))
    :effect (and (not (in_truck ?p ?t)) (at_pkg ?p ?loc))
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at_truck ?t ?from) (in_city ?from ?c) (in_city ?to ?c) (road_connected ?from ?to))
    :effect (and (not (at_truck ?t ?from)) (at_truck ?t ?to))
  )

  (:action airplane-load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and (at_plane ?a ?loc) (airport ?loc) (at_pkg ?p ?loc))
    :effect (and (not (at_pkg ?p ?loc)) (in_plane ?p ?a))
  )

  (:action airplane-unload
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and (at_plane ?a ?loc) (airport ?loc) (in_plane ?p ?a))
    :effect (and (not (in_plane ?p ?a)) (at_pkg ?p ?loc))
  )

  (:action airplane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at_plane ?a ?from) (airport ?from) (airport ?to) (air_route ?from ?to))
    :effect (and (not (at_plane ?a ?from)) (at_plane ?a ?to))
  )
)