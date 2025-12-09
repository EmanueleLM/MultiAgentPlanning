(define (domain Logistics11)
  (:requirements :strips :typing)
  (:types package truck airplane location stage)

  (:predicates
    ;; vehicle and package locations
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)

    ;; package loaded predicates
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    ;; infrastructure predicates
    (is-airport ?l - location)
    (same-city ?l1 - location ?l2 - location)
    (air-route ?from - location ?to - location)

    ;; explicit ordered stages and successor relation
    (stage ?p - package ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; ----------------------
  ;; Truck actions
  ;; ----------------------

  ;; Load a package into a truck at the truck's current location.
  (:action truck-load
    :parameters (?t - truck ?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?loc)
      (at-package ?p ?loc)
      (stage ?p ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-truck ?p ?t)
      (not (stage ?p ?s))
      (stage ?p ?s2)
    )
  )

  ;; Unload a package from a truck at the truck's current location.
  (:action truck-unload
    :parameters (?t - truck ?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?loc)
      (in-truck ?p ?t)
      (stage ?p ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?loc)
      (not (stage ?p ?s))
      (stage ?p ?s2)
    )
  )

  ;; Drive a truck while empty (no package-stage change).
  (:action truck-drive-empty
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (at-truck ?t ?from)
      (same-city ?from ?to)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  ;; Drive a truck carrying a specific package: advances that package's stage.
  (:action truck-drive-loaded
    :parameters (?t - truck ?from - location ?to - location ?p - package ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?from)
      (in-truck ?p ?t)
      (same-city ?from ?to)
      (stage ?p ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
      (not (stage ?p ?s))
      (stage ?p ?s2)
    )
  )

  ;; ----------------------
  ;; Airplane actions
  ;; ----------------------

  ;; Load a package into an airplane at an airport.
  (:action airplane-load
    :parameters (?a - airplane ?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-airplane ?a ?loc)
      (at-package ?p ?loc)
      (is-airport ?loc)
      (stage ?p ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-airplane ?p ?a)
      (not (stage ?p ?s))
      (stage ?p ?s2)
    )
  )

  ;; Unload a package from an airplane at an airport.
  (:action airplane-unload
    :parameters (?a - airplane ?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-airplane ?a ?loc)
      (in-airplane ?p ?a)
      (is-airport ?loc)
      (stage ?p ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at-package ?p ?loc)
      (not (stage ?p ?s))
      (stage ?p ?s2)
    )
  )

  ;; Fly an airplane empty between airports (no package-stage change).
  (:action airplane-fly-empty
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at-airplane ?a ?from)
      (is-airport ?from)
      (is-airport ?to)
      (air-route ?from ?to)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
    )
  )

  ;; Fly an airplane while carrying a specific package: advances that package's stage.
  (:action airplane-fly-loaded
    :parameters (?a - airplane ?from - location ?to - location ?p - package ?s - stage ?s2 - stage)
    :precondition (and
      (at-airplane ?a ?from)
      (in-airplane ?p ?a)
      (is-airport ?from)
      (is-airport ?to)
      (air-route ?from ?to)
      (stage ?p ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
      (not (stage ?p ?s))
      (stage ?p ?s2)
    )
  )
)