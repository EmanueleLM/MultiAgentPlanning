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
    ;; dynamic location fluents
    (at-package ?p - package ?l - location)
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)

    ;; package inside a vehicle (truck or airplane)
    (in ?p - package ?v - vehicle)

    ;; static relations
    (location_in_city ?l - location ?c - city)
    (is_airport ?l - location)
    (truck_belongs_to_city ?t - truck ?c - city)

    ;; discrete ordered stage progression (hard requirement)
    (stage_succ ?s - stage ?s2 - stage)
    (current-stage ?s - stage)
  )

  ;; Truck actions (internal-city movement and load/unload)
  (:action truck_load
    :parameters (?p - package ?t - truck ?loc - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (stage_succ ?s ?s2)
                    (at-truck ?t ?loc)
                    (at-package ?p ?loc)
                    (truck_belongs_to_city ?t ?c)
                    (location_in_city ?loc ?c)
                  )
    :effect (and
              (in ?p ?t)
              (not (at-package ?p ?loc))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  (:action truck_unload
    :parameters (?p - package ?t - truck ?loc - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (stage_succ ?s ?s2)
                    (in ?p ?t)
                    (at-truck ?t ?loc)
                    (truck_belongs_to_city ?t ?c)
                    (location_in_city ?loc ?c)
                  )
    :effect (and
              (not (in ?p ?t))
              (at-package ?p ?loc)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  (:action truck_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (stage_succ ?s ?s2)
                    (at-truck ?t ?from)
                    (location_in_city ?from ?c)
                    (location_in_city ?to ?c)
                    (truck_belongs_to_city ?t ?c)
                    (not (at-truck ?t ?to))
                  )
    :effect (and
              (not (at-truck ?t ?from))
              (at-truck ?t ?to)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  ;; Airplane actions (airport-only load/unload and inter-city flight)
  (:action airplane_load
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

  (:action airplane_unload
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

  (:action airplane_fly
    :parameters (?a - airplane ?from - location ?to - location ?c_from - city ?c_to - city ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (stage_succ ?s ?s2)
                    (at-airplane ?a ?from)
                    (is_airport ?from)
                    (is_airport ?to)
                    (location_in_city ?from ?c_from)
                    (location_in_city ?to ?c_to)
                    ;; prevent no-op flight to same airport and prevent flight within same city
                    (not (at-airplane ?a ?to))
                    (not (location_in_city ?to ?c_from))
                  )
    :effect (and
              (not (at-airplane ?a ?from))
              (at-airplane ?a ?to)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )
)