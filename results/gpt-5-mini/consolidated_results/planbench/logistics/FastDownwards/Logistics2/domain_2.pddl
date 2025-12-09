(define (domain logistics_integrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    stage
    vehicle
    truck airplane - vehicle
    package
  )

  (:predicates
    ;; precise location fluents for each entity type
    (at-package ?p - package ?l - location)
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)

    ;; package-in-vehicle relation
    (in ?p - package ?v - vehicle)

    ;; mapping of a location to its city (static)
    (location_in_city ?l - location ?c - city)

    ;; airport predicate (static)
    (is_airport ?l - location)

    ;; static assignment: truck belongs to a city
    (truck_belongs_to_city ?t - truck ?c - city)

    ;; stage-linked predicates to enforce ordered progression
    (stage_succ ?s - stage ?s2 - stage)
    (current-stage ?s - stage)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Truck actions
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action truck_operator_load
    :parameters (?p - package ?t - truck ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (stage_succ ?s ?s2)
                    (at-truck ?t ?loc)
                    (at-package ?p ?loc)
                  )
    :effect (and
              (in ?p ?t)
              (not (at-package ?p ?loc))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  (:action truck_operator_unload
    :parameters (?p - package ?t - truck ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (stage_succ ?s ?s2)
                    (in ?p ?t)
                    (at-truck ?t ?loc)
                  )
    :effect (and
              (not (in ?p ?t))
              (at-package ?p ?loc)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  (:action truck_operator_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (stage_succ ?s ?s2)
                    (at-truck ?t ?from)
                    (location_in_city ?from ?c)
                    (location_in_city ?to ?c)
                    (truck_belongs_to_city ?t ?c)
                  )
    :effect (and
              (not (at-truck ?t ?from))
              (at-truck ?t ?to)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Airplane actions
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action airplane_operator_load
    :parameters (?p - package ?a - airplane ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (stage_succ ?s ?s2)
                    (at-airplane ?a ?loc)
                    (at-package ?p ?loc)
                    (is_airport ?loc)
                  )
    :effect (and
              (in ?p ?a)
              (not (at-package ?p ?loc))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  (:action airplane_operator_unload
    :parameters (?p - package ?a - airplane ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (stage_succ ?s ?s2)
                    (in ?p ?a)
                    (at-airplane ?a ?loc)
                    (is_airport ?loc)
                  )
    :effect (and
              (not (in ?p ?a))
              (at-package ?p ?loc)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  (:action airplane_operator_fly
    :parameters (?a - airplane ?from - location ?to - location ?c_from - city ?c_to - city ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (stage_succ ?s ?s2)
                    (at-airplane ?a ?from)
                    (is_airport ?from)
                    (is_airport ?to)
                    (location_in_city ?from ?c_from)
                    (location_in_city ?to ?c_to)
                    (not (= ?c_from ?c_to))
                  )
    :effect (and
              (not (at-airplane ?a ?from))
              (at-airplane ?a ?to)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )
)