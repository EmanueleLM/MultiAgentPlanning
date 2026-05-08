(define (domain jack_of_all_trades)
  (:requirements :typing :strips)
  (:types city location truck airplane package)

  (:predicates
    (in_city ?l - location ?c - city)
    (airport ?l - location)
    (at_truck ?t - truck ?l - location)
    (at_plane ?p - airplane ?l - location)
    (at_pkg ?pkg - package ?l - location)
    (in_truck ?pkg - package ?t - truck)
    (in_plane ?pkg - package ?p - airplane)
  )

  (:action load_truck
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

  (:action unload_truck
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

  (:action load_plane
    :parameters (?pkg - package ?pl - airplane ?loc - location)
    :precondition (and
      (at_pkg ?pkg ?loc)
      (at_plane ?pl ?loc)
    )
    :effect (and
      (in_plane ?pkg ?pl)
      (not (at_pkg ?pkg ?loc))
    )
  )

  (:action unload_plane
    :parameters (?pkg - package ?pl - airplane ?loc - location)
    :precondition (and
      (in_plane ?pkg ?pl)
      (at_plane ?pl ?loc)
    )
    :effect (and
      (at_pkg ?pkg ?loc)
      (not (in_plane ?pkg ?pl))
    )
  )

  (:action drive_truck
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

  (:action fly_plane
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