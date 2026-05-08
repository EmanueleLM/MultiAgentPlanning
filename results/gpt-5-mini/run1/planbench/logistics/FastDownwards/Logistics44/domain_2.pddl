(define (domain jack_of_all_trades)
  (:requirements :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    ;; dynamic location/status predicates
    (at_pkg ?p - package ?l - location)
    (at_truck ?t - truck ?l - location)
    (at_plane ?a - airplane ?l - location)

    ;; containment relations: package inside vehicle
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)

    ;; static/location properties
    (airport ?l - location)
    (in_city ?l - location ?c - city)
  )

  ;; load a package into a truck (requires co-location)
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (at_truck ?t ?l)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at_pkg ?p ?l))
    )
  )

  ;; unload a package from a truck (package becomes at the truck's location)
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?l)
    )
    :effect (and
      (at_pkg ?p ?l)
      (not (in_truck ?p ?t))
    )
  )

  ;; load a package into an airplane (requires co-location)
  (:action load_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (at_plane ?a ?l)
    )
    :effect (and
      (in_plane ?p ?a)
      (not (at_pkg ?p ?l))
    )
  )

  ;; unload a package from an airplane (package becomes at the airplane's location)
  (:action unload_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_plane ?p ?a)
      (at_plane ?a ?l)
    )
    :effect (and
      (at_pkg ?p ?l)
      (not (in_plane ?p ?a))
    )
  )

  ;; drive a truck between two locations in the same city (locations in same city required)
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

  ;; fly an airplane between two airport locations
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