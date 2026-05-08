(define (domain logistics_orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city stage)

  (:predicates
    (at-truck ?tr - truck ?loc - location)
    (at-airplane ?ap - airplane ?loc - location)
    (at-package ?p - package ?loc - location)
    (in-package-truck ?p - package ?tr - truck)
    (in-package-airplane ?p - package ?ap - airplane)
    (airport ?loc - location)
    (loc-in-city ?loc - location ?c - city)
    (current-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action load-truck
    :parameters (?p - package ?tr - truck ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-package ?p ?loc)
      (at-truck ?tr ?loc)
      (current-stage ?s)
      (succ ?s ?s2)
      (not (in-package-truck ?p ?tr))
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-package-truck ?p ?tr)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action unload-truck
    :parameters (?p - package ?tr - truck ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (in-package-truck ?p ?tr)
      (at-truck ?tr ?loc)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (at-package ?p ?loc)
      (not (in-package-truck ?p ?tr))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action drive-truck
    :parameters (?tr - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?tr ?from)
      (loc-in-city ?from ?c)
      (loc-in-city ?to ?c)
      (current-stage ?s)
      (succ ?s ?s2)
      (not (at-truck ?tr ?to))
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action load-airplane
    :parameters (?p - package ?ap - airplane ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-package ?p ?loc)
      (at-airplane ?ap ?loc)
      (airport ?loc)
      (current-stage ?s)
      (succ ?s ?s2)
      (not (in-package-airplane ?p ?ap))
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-package-airplane ?p ?ap)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action unload-airplane
    :parameters (?p - package ?ap - airplane ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (in-package-airplane ?p ?ap)
      (at-airplane ?ap ?loc)
      (airport ?loc)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (at-package ?p ?loc)
      (not (in-package-airplane ?p ?ap))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action fly-airplane
    :parameters (?ap - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-airplane ?ap ?from)
      (airport ?from)
      (airport ?to)
      (current-stage ?s)
      (succ ?s ?s2)
      (not (at-airplane ?ap ?to))
    )
    :effect (and
      (not (at-airplane ?ap ?from))
      (at-airplane ?ap ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)