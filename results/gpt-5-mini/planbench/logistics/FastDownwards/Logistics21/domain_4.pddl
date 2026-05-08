(define (domain logistics21)
  (:requirements :strips :typing)
  (:types
    package
    truck
    plane
    city
    location
  )

  (:predicates
    ;; package at a location (locations include airports)
    (at_pkg ?p - package ?l - location)

    ;; truck at a location
    (at_truck ?t - truck ?l - location)

    ;; airplane at a location (plane operations restricted to airports by preconditions)
    (at_plane ?pl - plane ?l - location)

    ;; package inside a truck or inside a plane
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?pl - plane)

    ;; location belongs to a city
    (in_city ?l - location ?c - city)

    ;; marks which locations are airports
    (is_airport ?l - location)
  )

  ;; Truck actions: local movement and load/unload inside the same city
  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  (:action truck-load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at_truck ?t ?loc)
      (at_pkg ?p ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in_truck ?p ?t)
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at_truck ?t ?loc)
      (in_truck ?p ?t)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at_pkg ?p ?loc)
    )
  )

  ;; Airplane actions: operate only at airports
  (:action plane-fly
    :parameters (?pl - plane ?from - location ?to - location)
    :precondition (and
      (at_plane ?pl ?from)
      (is_airport ?from)
      (is_airport ?to)
    )
    :effect (and
      (not (at_plane ?pl ?from))
      (at_plane ?pl ?to)
    )
  )

  (:action plane-load
    :parameters (?pl - plane ?p - package ?loc - location)
    :precondition (and
      (at_plane ?pl ?loc)
      (is_airport ?loc)
      (at_pkg ?p ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in_plane ?p ?pl)
    )
  )

  (:action plane-unload
    :parameters (?pl - plane ?p - package ?loc - location)
    :precondition (and
      (at_plane ?pl ?loc)
      (is_airport ?loc)
      (in_plane ?p ?pl)
    )
    :effect (and
      (not (in_plane ?p ?pl))
      (at_pkg ?p ?loc)
    )
  )
)