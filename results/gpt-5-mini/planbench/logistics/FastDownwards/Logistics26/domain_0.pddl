(define (domain logistics_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    ;; position predicates separated by object type to keep typing simple and explicit
    (at-pkg ?p - package ?l - location)
    (at-truck ?t - truck ?l - location)
    (at-plane ?a - airplane ?l - location)

    ;; containment predicates for packages inside vehicles
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    ;; static topology / classification
    (airport ?l - location)
    (in-city ?l - location ?c - city)
  )

  ;; Truck agent actions (named with truck_ prefix)
  (:action truck_load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                    (at-truck ?t ?l)
                    (at-pkg ?p ?l)
                  )
    :effect (and
              (in-truck ?p ?t)
              (not (at-pkg ?p ?l))
            )
  )

  (:action truck_unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                    (at-truck ?t ?l)
                    (in-truck ?p ?t)
                  )
    :effect (and
              (at-pkg ?p ?l)
              (not (in-truck ?p ?t))
            )
  )

  (:action truck_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
                    (at-truck ?t ?from)
                    (in-city ?from ?c)     ; ensures source is in some city ?c
                    (in-city ?to ?c)       ; ensures destination is in exactly the same city ?c
                  )
    :effect (and
              (at-truck ?t ?to)
              (not (at-truck ?t ?from))
            )
  )

  ;; Airplane agent actions (named with airplane_ prefix)
  (:action airplane_load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
                    (at-plane ?a ?l)
                    (at-pkg ?p ?l)
                    (airport ?l)           ; loading onto airplane only at an airport
                  )
    :effect (and
              (in-plane ?p ?a)
              (not (at-pkg ?p ?l))
            )
  )

  (:action airplane_unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
                    (at-plane ?a ?l)
                    (in-plane ?p ?a)
                    (airport ?l)           ; unloading from airplane only at an airport
                  )
    :effect (and
              (at-pkg ?p ?l)
              (not (in-plane ?p ?a))
            )
  )

  (:action airplane_fly
    :parameters (?a - airplane ?from - location ?to - location ?c1 - city ?c2 - city)
    :precondition (and
                    (at-plane ?a ?from)
                    (airport ?from)
                    (airport ?to)
                    (in-city ?from ?c1)    ; identify city of source airport
                    (in-city ?to ?c2)      ; identify city of destination airport
                    (not (= ?c1 ?c2))      ; require airplane flies between airports in different cities
                  )
    :effect (and
              (at-plane ?a ?to)
              (not (at-plane ?a ?from))
            )
  )
)