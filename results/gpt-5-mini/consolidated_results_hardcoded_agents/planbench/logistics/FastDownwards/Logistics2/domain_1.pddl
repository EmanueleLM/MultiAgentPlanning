(define (domain logistics_integrated)
  ;; Integrated logistics domain with explicit discrete stage progression to enforce temporal ordering.
  ;; Hard constraints:
  ;;  - Sequential stage advancement: every action consumes the current stage and advances to its successor.
  ;;  - No bookkeeping tokens (like "unloaded") are used; package exclusivity is enforced by state and action effects.
  ;;  - Trucks drive only within their assigned city. Airplanes fly between airport locations.
  ;;  - Loading/unloading requires strict co-location of package and vehicle.
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    stage
    object
    vehicle - object
    package - object
    truck airplane - vehicle
  )

  (:predicates
    ;; object location facts (packages when not loaded, trucks, and airplanes)
    (at ?o - object ?l - location)

    ;; package-in-vehicle relation (package is inside a vehicle)
    (in ?p - package ?v - vehicle)

    ;; mapping of a location to its city (static)
    (location_in_city ?l - location ?c - city)

    ;; airport predicate
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
                    (at ?t ?loc)
                    (at ?p ?loc)
                  )
    :effect (and
              (in ?p ?t)
              (not (at ?p ?loc))
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
                    (at ?t ?loc)
                  )
    :effect (and
              (not (in ?p ?t))
              (at ?p ?loc)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  (:action truck_operator_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (stage_succ ?s ?s2)
                    (at ?t ?from)
                    (location_in_city ?from ?c)
                    (location_in_city ?to ?c)
                    (truck_belongs_to_city ?t ?c)
                  )
    :effect (and
              (not (at ?t ?from))
              (at ?t ?to)
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
                    (at ?a ?loc)
                    (at ?p ?loc)
                    (is_airport ?loc)
                  )
    :effect (and
              (in ?p ?a)
              (not (at ?p ?loc))
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
                    (at ?a ?loc)
                    (is_airport ?loc)
                  )
    :effect (and
              (not (in ?p ?a))
              (at ?p ?loc)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  (:action airplane_operator_fly
    :parameters (?a - airplane ?from - location ?to - location ?c_from - city ?c_to - city ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (stage_succ ?s ?s2)
                    (at ?a ?from)
                    (is_airport ?from)
                    (is_airport ?to)
                    (location_in_city ?from ?c_from)
                    (location_in_city ?to ?c_to)
                    (not (= ?c_from ?c_to))
                  )
    :effect (and
              (not (at ?a ?from))
              (at ?a ?to)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )
)