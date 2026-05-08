(define (domain transport_combined)
  :requirements :strips :typing :negative-preconditions
  :types
    object
    package - object
    vehicle - object
    truck - vehicle
    airplane - vehicle
    location - object
    city - object
    stage - object

  :predicates
    ;; Location of objects (packages and vehicles)
    (at ?o - object ?l - location)

    ;; Package is inside a vehicle
    (in ?p - package ?v - vehicle)

    ;; Package currently not in any vehicle (explicit, maintained by actions)
    (free ?p - package)

    ;; Location to city mapping
    (in-city ?l - location ?c - city)

    ;; Airport marker for locations
    (airport ?l - location)

    ;; Discrete staged time objects and global current stage
    (stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; Truck actions (prefixed with 'truck-'): require and advance the global current stage.
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (at ?t ?l)
      (at ?p ?l)
      (free ?p)
    )
    :effect (and
      ;; advance global stage
      (not (current ?s))
      (current ?s2)

      ;; package moves into truck
      (in ?p ?t)
      (not (at ?p ?l))
      (not (free ?p))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (at ?t ?l)
      (in ?p ?t)
    )
    :effect (and
      ;; advance global stage
      (not (current ?s))
      (current ?s2)

      ;; package removed from truck and placed at truck location
      (not (in ?p ?t))
      (at ?p ?l)
      (free ?p)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      ;; advance global stage
      (not (current ?s))
      (current ?s2)

      ;; truck moves between locations within same city
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Airplane actions (prefixed with 'plane-'): require and advance the global current stage.
  (:action plane-load
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (at ?a ?l)
      (at ?p ?l)
      (airport ?l)
      (free ?p)
    )
    :effect (and
      ;; advance global stage
      (not (current ?s))
      (current ?s2)

      ;; package moves into airplane
      (in ?p ?a)
      (not (at ?p ?l))
      (not (free ?p))
    )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (at ?a ?l)
      (in ?p ?a)
      (airport ?l)
    )
    :effect (and
      ;; advance global stage
      (not (current ?s))
      (current ?s2)

      ;; package removed from airplane and placed at airport location
      (not (in ?p ?a))
      (at ?p ?l)
      (free ?p)
    )
  )

  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      ;; advance global stage
      (not (current ?s))
      (current ?s2)

      ;; airplane moves between airports of possibly different cities
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)