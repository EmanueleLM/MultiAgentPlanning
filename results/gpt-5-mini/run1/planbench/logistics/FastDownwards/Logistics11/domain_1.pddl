(define (domain logistics11)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city)

  (:predicates
    ;; positions
    (at_truck ?t - truck ?loc - location)
    (at_plane ?p - airplane ?loc - location)
    (at_pkg ?pkg - package ?loc - location)
    ;; containment
    (in_truck ?pkg - package ?t - truck)
    (in_plane ?pkg - package ?p - airplane)
    ;; location properties
    (airport ?loc - location)
    (in_city ?loc - location ?c - city)
  )

  ;; Truck actions (intra-city)
  (:action truck_agent_load
    :parameters (?pkg - package ?t - truck ?loc - location)
    :precondition (and
      (at_pkg ?pkg ?loc)
      (at_truck ?t ?loc)
    )
    :effect (and
      (in_truck ?pkg ?t)
      (not (at_pkg ?pkg ?loc))
    )
  )

  (:action truck_agent_unload
    :parameters (?pkg - package ?t - truck ?loc - location)
    :precondition (and
      (in_truck ?pkg ?t)
      (at_truck ?t ?loc)
    )
    :effect (and
      (at_pkg ?pkg ?loc)
      (not (in_truck ?pkg ?t))
    )
  )

  ;; Drive only allowed between locations in the same city
  (:action truck_agent_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (at_truck ?t ?to)
      (not (at_truck ?t ?from))
    )
  )

  ;; Airplane actions (inter-city via airports)
  (:action airplane_agent_load
    :parameters (?pkg - package ?pl - airplane ?loc - location)
    :precondition (and
      (at_pkg ?pkg ?loc)
      (at_plane ?pl ?loc)
      (airport ?loc)
    )
    :effect (and
      (in_plane ?pkg ?pl)
      (not (at_pkg ?pkg ?loc))
    )
  )

  (:action airplane_agent_unload
    :parameters (?pkg - package ?pl - airplane ?loc - location)
    :precondition (and
      (in_plane ?pkg ?pl)
      (at_plane ?pl ?loc)
      (airport ?loc)
    )
    :effect (and
      (at_pkg ?pkg ?loc)
      (not (in_plane ?pkg ?pl))
    )
  )

  (:action airplane_agent_fly
    :parameters (?pl - airplane ?from - location ?to - location)
    :precondition (and
      (at_plane ?pl ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (at_plane ?pl ?to)
      (not (at_plane ?pl ?from))
    )
  )
)