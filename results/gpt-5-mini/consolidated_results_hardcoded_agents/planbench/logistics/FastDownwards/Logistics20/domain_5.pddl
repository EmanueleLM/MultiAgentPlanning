(define (domain logistics-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city location time package truck airplane
  )

  (:predicates
    ;; vehicle locations
    (at-truck ?tr - truck ?loc - location)
    (at-plane ?a - airplane ?loc - location)

    ;; package location modes
    (at-pkg ?p - package ?loc - location)
    (in-truck ?p - package ?tr - truck)
    (in-plane ?p - package ?a - airplane)

    ;; topology and attributes
    (airport ?loc - location)
    (in-city ?loc - location ?c - city)

    ;; explicit discrete time / stages: ordering and current stage marker
    (stage ?s - time)
    (succ ?s1 - time ?s2 - time)
    (current-stage ?s - time)
  )

  ;; Truck actions: consume the single current-stage and produce its successor,
  ;; enforcing contiguous single-step progression of global time.
  (:action truck-load
    :parameters (?tr - truck ?p - package ?loc - location ?s - time ?s2 - time)
    :precondition (and
      (at-truck ?tr ?loc)
      (at-pkg ?p ?loc)
      (stage ?s)
      (stage ?s2)
      (succ ?s ?s2)
      (current-stage ?s)
    )
    :effect (and
      (not (at-pkg ?p ?loc))
      (in-truck ?p ?tr)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action truck-unload
    :parameters (?tr - truck ?p - package ?loc - location ?s - time ?s2 - time)
    :precondition (and
      (at-truck ?tr ?loc)
      (in-truck ?p ?tr)
      (stage ?s)
      (stage ?s2)
      (succ ?s ?s2)
      (current-stage ?s)
    )
    :effect (and
      (not (in-truck ?p ?tr))
      (at-pkg ?p ?loc)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - city ?s - time ?s2 - time)
    :precondition (and
      (at-truck ?tr ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (stage ?s)
      (stage ?s2)
      (succ ?s ?s2)
      (current-stage ?s)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Airplane actions: loading/unloading only at airport locations; flying between airports of different cities.
  ;; Each action consumes current-stage and produces its successor.
  (:action plane-load
    :parameters (?a - airplane ?p - package ?loc - location ?s - time ?s2 - time)
    :precondition (and
      (at-plane ?a ?loc)
      (at-pkg ?p ?loc)
      (airport ?loc)
      (stage ?s)
      (stage ?s2)
      (succ ?s ?s2)
      (current-stage ?s)
    )
    :effect (and
      (not (at-pkg ?p ?loc))
      (in-plane ?p ?a)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?loc - location ?s - time ?s2 - time)
    :precondition (and
      (at-plane ?a ?loc)
      (in-plane ?p ?a)
      (airport ?loc)
      (stage ?s)
      (stage ?s2)
      (succ ?s ?s2)
      (current-stage ?s)
    )
    :effect (and
      (not (in-plane ?p ?a))
      (at-pkg ?p ?loc)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Flying requires both endpoints to be airports and to lie in different cities.
  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location ?cfrom - city ?cto - city ?s - time ?s2 - time)
    :precondition (and
      (at-plane ?a ?from)
      (airport ?from)
      (airport ?to)
      (in-city ?from ?cfrom)
      (in-city ?to ?cto)
      ;; require different cities for a cross-city flight
      (not (in-city ?from ?cto))
      (stage ?s)
      (stage ?s2)
      (succ ?s ?s2)
      (current-stage ?s)
    )
    :effect (and
      (not (at-plane ?a ?from))
      (at-plane ?a ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)