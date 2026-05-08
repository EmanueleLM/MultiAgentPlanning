(define (domain jack_of_all_trades)
  (:requirements :typing :strips)
  (:types city location truck airplane package)

  (:predicates
    (in_city ?l - location ?c - city)     ; location belongs to a city
    (airport ?l - location)               ; location is an airport
    (at_truck ?t - truck ?l - location)   ; truck at location
    (at_plane ?p - airplane ?l - location); airplane at location (airports)
    (at_pkg ?pkg - package ?l - location) ; package at location
    (in_truck ?pkg - package ?t - truck)  ; package inside truck
    (in_plane ?pkg - package ?pl - airplane) ; package inside airplane
  )

  ;; load a package into a truck (same location)
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

  ;; unload a package from a truck to the truck's current location
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

  ;; load a package into an airplane (airplane must be at an airport)
  (:action load_plane
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

  ;; unload a package from an airplane to the airplane's current airport
  (:action unload_plane
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

  ;; drive a truck between two locations that are in the same city
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

  ;; fly an airplane between two airports (airports may be in different cities)
  (:action fly_plane
    :parameters (?pl - airplane ?from - location ?to - location ?cf - city ?ct - city)
    :precondition (and
      (at_plane ?pl ?from)
      (airport ?from)
      (airport ?to)
      (in_city ?from ?cf)
      (in_city ?to ?ct)
    )
    :effect (and
      (at_plane ?pl ?to)
      (not (at_plane ?pl ?from))
    )
  )
)