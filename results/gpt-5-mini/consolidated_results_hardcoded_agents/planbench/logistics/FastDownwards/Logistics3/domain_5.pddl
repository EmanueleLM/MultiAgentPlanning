(define (domain city-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    vehicle
    truck - vehicle
    airplane - vehicle
    package
    stage
  )

  (:predicates
    (in-city ?loc - location ?c - city)
    (airport ?loc - location)
    (air-route ?l1 - location ?l2 - location)

    (succ ?s1 - stage ?s2 - stage)
    (current-stage ?s - stage)

    (at-truck ?tr - truck ?loc - location)
    (at-airplane ?ap - airplane ?loc - location)
    (at-package ?p - package ?loc - location)

    (in-vehicle ?p - package ?v - vehicle)
  )

  (:action drive-truck
    :parameters (?tr - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-truck ?tr ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action fly-airplane
    :parameters (?ap - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-airplane ?ap ?from)
      (airport ?from)
      (airport ?to)
      (air-route ?from ?to)
    )
    :effect (and
      (not (at-airplane ?ap ?from))
      (at-airplane ?ap ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action truck-load
    :parameters (?tr - truck ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-truck ?tr ?loc)
      (at-package ?pkg ?loc)
    )
    :effect (and
      (not (at-package ?pkg ?loc))
      (in-vehicle ?pkg ?tr)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action truck-unload
    :parameters (?tr - truck ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-truck ?tr ?loc)
      (in-vehicle ?pkg ?tr)
    )
    :effect (and
      (not (in-vehicle ?pkg ?tr))
      (at-package ?pkg ?loc)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action airplane-load
    :parameters (?ap - airplane ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-airplane ?ap ?loc)
      (airport ?loc)
      (at-package ?pkg ?loc)
    )
    :effect (and
      (not (at-package ?pkg ?loc))
      (in-vehicle ?pkg ?ap)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action airplane-unload
    :parameters (?ap - airplane ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-airplane ?ap ?loc)
      (airport ?loc)
      (in-vehicle ?pkg ?ap)
    )
    :effect (and
      (not (in-vehicle ?pkg ?ap))
      (at-package ?pkg ?loc)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)