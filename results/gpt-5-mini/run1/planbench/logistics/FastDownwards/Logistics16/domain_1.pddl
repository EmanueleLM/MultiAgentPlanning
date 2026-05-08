(define (domain logistics16)
  (:requirements :strips :typing)
  (:types package truck airplane location city)

  (:predicates
    ;; positions
    (at-truck ?t - truck ?loc - location)
    (at-airplane ?a - airplane ?loc - location)
    (at ?p - package ?loc - location)

    ;; containment
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    ;; topological and facility facts
    (in-city ?loc - location ?c - city)
    (is-airport ?loc - location)
  )

  ;; Load a package into a truck when both are co-located.
  (:action load-truck
    :parameters (?pkg - package ?tr - truck ?loc - location)
    :precondition (and (at ?pkg ?loc) (at-truck ?tr ?loc))
    :effect (and
      (not (at ?pkg ?loc))
      (in-truck ?pkg ?tr)
    )
  )

  ;; Unload a package from a truck to the truck's current location.
  (:action unload-truck
    :parameters (?pkg - package ?tr - truck ?loc - location)
    :precondition (and (in-truck ?pkg ?tr) (at-truck ?tr ?loc))
    :effect (and
      (not (in-truck ?pkg ?tr))
      (at ?pkg ?loc)
    )
  )

  ;; Drive a truck between two locations in the same city.
  (:action drive-truck
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?tr ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; Load a package into an airplane at an airport.
  (:action load-airplane
    :parameters (?pkg - package ?ap - airplane ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at-airplane ?ap ?loc)
      (is-airport ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in-airplane ?pkg ?ap)
    )
  )

  ;; Unload a package from an airplane at an airport.
  (:action unload-airplane
    :parameters (?pkg - package ?ap - airplane ?loc - location)
    :precondition (and
      (in-airplane ?pkg ?ap)
      (at-airplane ?ap ?loc)
      (is-airport ?loc)
    )
    :effect (and
      (not (in-airplane ?pkg ?ap))
      (at ?pkg ?loc)
    )
  )

  ;; Fly an airplane between two airports.
  (:action fly-airplane
    :parameters (?ap - airplane ?from - location ?to - location)
    :precondition (and
      (at-airplane ?ap ?from)
      (is-airport ?from)
      (is-airport ?to)
    )
    :effect (and
      (not (at-airplane ?ap ?from))
      (at-airplane ?ap ?to)
    )
  )
)