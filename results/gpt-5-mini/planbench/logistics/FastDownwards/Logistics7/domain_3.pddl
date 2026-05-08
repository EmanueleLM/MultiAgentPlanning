(define (domain logistics7)
  (:requirements :strips :typing)
  (:types truck airplane package location city)

  (:predicates
    (at-truck ?t - truck ?l - location)
    (at-plane ?p - airplane ?l - location)
    (at-pkg ?pkg - package ?l - location)
    (in-truck ?pkg - package ?t - truck)
    (in-plane ?pkg - package ?p - airplane)
    (loc-in-city ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; Drive a truck between two locations in the same city
  (:action drive-truck
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?tr ?from)
      (loc-in-city ?from ?c)
      (loc-in-city ?to ?c)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Load a package into a truck when co-located
  (:action load-into-truck
    :parameters (?tr - truck ?pkg - package ?loc - location)
    :precondition (and
      (at-truck ?tr ?loc)
      (at-pkg ?pkg ?loc)
    )
    :effect (and
      (in-truck ?pkg ?tr)
      (not (at-pkg ?pkg ?loc))
    )
  )

  ;; Unload a package from a truck to the truck's current location
  (:action unload-from-truck
    :parameters (?tr - truck ?pkg - package ?loc - location)
    :precondition (and
      (at-truck ?tr ?loc)
      (in-truck ?pkg ?tr)
    )
    :effect (and
      (not (in-truck ?pkg ?tr))
      (at-pkg ?pkg ?loc)
    )
  )

  ;; Load a package into an airplane at an airport
  (:action load-into-plane
    :parameters (?pl - airplane ?pkg - package ?loc - location)
    :precondition (and
      (at-plane ?pl ?loc)
      (at-pkg ?pkg ?loc)
      (airport ?loc)
    )
    :effect (and
      (in-plane ?pkg ?pl)
      (not (at-pkg ?pkg ?loc))
    )
  )

  ;; Unload a package from an airplane to the airplane's current airport location
  (:action unload-from-plane
    :parameters (?pl - airplane ?pkg - package ?loc - location)
    :precondition (and
      (at-plane ?pl ?loc)
      (in-plane ?pkg ?pl)
      (airport ?loc)
    )
    :effect (and
      (not (in-plane ?pkg ?pl))
      (at-pkg ?pkg ?loc)
    )
  )

  ;; Fly an airplane between two airports (airport locations may belong to cities)
  (:action fly-plane
    :parameters (?pl - airplane ?from - location ?to - location)
    :precondition (and
      (at-plane ?pl ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at-plane ?pl ?from))
      (at-plane ?pl ?to)
    )
  )
)