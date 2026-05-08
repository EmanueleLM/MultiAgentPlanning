(define (domain jack_of_all_trades)
  (:requirements :strips :typing)
  (:types city location truck airplane package)

  (:predicates
    (in_city ?loc - location ?c - city)
    (airport ?loc - location)
    (at_truck ?t - truck ?loc - location)
    (at_plane ?p - airplane ?loc - location)
    (at_pkg ?pkg - package ?loc - location)
    (in_truck ?pkg - package ?t - truck)
    (in_plane ?pkg - package ?a - airplane)
  )

  ;; Load a package into a truck: package and truck must be co-located.
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

  ;; Unload a package from a truck: package must be in the truck and truck at location.
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

  ;; Load a package into an airplane: package and airplane must be co-located.
  (:action load_plane
    :parameters (?pkg - package ?a - airplane ?loc - location)
    :precondition (and
      (at_pkg ?pkg ?loc)
      (at_plane ?a ?loc)
    )
    :effect (and
      (in_plane ?pkg ?a)
      (not (at_pkg ?pkg ?loc))
    )
  )

  ;; Unload a package from an airplane: package must be in the airplane and airplane at location.
  (:action unload_plane
    :parameters (?pkg - package ?a - airplane ?loc - location)
    :precondition (and
      (in_plane ?pkg ?a)
      (at_plane ?a ?loc)
    )
    :effect (and
      (at_pkg ?pkg ?loc)
      (not (in_plane ?pkg ?a))
    )
  )

  ;; Drive a truck between two locations in the same city.
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

  ;; Fly an airplane between airports.
  (:action fly_plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_plane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (at_plane ?a ?to)
      (not (at_plane ?a ?from))
    )
  )
)