(define (domain jack_of_all_trades_transport_instance)
  (:requirements :typing :strips)
  (:types package truck airplane location city)
  (:predicates
    (at ?obj - (either package truck airplane) ?loc - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
    (in_city ?loc - location ?c - city)
    (airport ?loc - location)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (at ?p ?loc) (at ?t ?loc))
    :effect (and (in_truck ?p ?t) (not (at ?p ?loc)))
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (in_truck ?p ?t) (at ?t ?loc))
    :effect (and (at ?p ?loc) (not (in_truck ?p ?t)))
  )

  (:action load_plane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and (at ?p ?loc) (at ?a ?loc))
    :effect (and (in_plane ?p ?a) (not (at ?p ?loc)))
  )

  (:action unload_plane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and (in_plane ?p ?a) (at ?a ?loc))
    :effect (and (at ?p ?loc) (not (in_plane ?p ?a)))
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at ?t ?from) (in_city ?from ?c) (in_city ?to ?c))
    :effect (and (at ?t ?to) (not (at ?t ?from)))
  )

  (:action fly_plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at ?a ?from) (airport ?from) (airport ?to))
    :effect (and (at ?a ?to) (not (at ?a ?from)))
  )
)