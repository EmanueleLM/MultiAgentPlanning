(define (domain logistics_orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    ; Location predicates
    (at-truck ?tr - truck ?loc - location)
    (at-airplane ?ap - airplane ?loc - location)
    (at-package ?p - package ?loc - location)

    ; Containment predicates for being aboard a vehicle
    (in-package-truck ?p - package ?tr - truck)
    (in-package-airplane ?p - package ?ap - airplane)

    ; Geographic / facility predicates
    (airport ?loc - location)
    (loc-in-city ?loc - location ?c - city)
  )

  ; Truck actions: load, unload, drive (trucks move only within same city)
  (:action load-truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (at-package ?p ?loc)
      (at-truck ?tr ?loc)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-package-truck ?p ?tr)
    )
  )

  (:action unload-truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (in-package-truck ?p ?tr)
      (at-truck ?tr ?loc)
    )
    :effect (and
      (at-package ?p ?loc)
      (not (in-package-truck ?p ?tr))
    )
  )

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

  ; Airplane actions: load, unload, fly (airplanes only operate between airport locations)
  (:action load-airplane
    :parameters (?p - package ?ap - airplane ?loc - location)
    :precondition (and
      (at-package ?p ?loc)
      (at-airplane ?ap ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-package-airplane ?p ?ap)
    )
  )

  (:action unload-airplane
    :parameters (?p - package ?ap - airplane ?loc - location)
    :precondition (and
      (in-package-airplane ?p ?ap)
      (at-airplane ?ap ?loc)
      (airport ?loc)
    )
    :effect (and
      (at-package ?p ?loc)
      (not (in-package-airplane ?p ?ap))
    )
  )

  (:action fly-airplane
    :parameters (?ap - airplane ?from - location ?to - location)
    :precondition (and
      (at-airplane ?ap ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at-airplane ?ap ?from))
      (at-airplane ?ap ?to)
    )
  )
)