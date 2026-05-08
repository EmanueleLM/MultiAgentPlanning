(define (domain logistics_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    ;; dynamic position predicates
    (at-pkg ?p - package ?l - location)
    (at-truck ?t - truck ?l - location)
    (at-plane ?a - airplane ?l - location)

    ;; containment predicates for packages inside vehicles
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    ;; static topology / classification
    (airport ?l - location)
    (in-city ?l - location ?c - city)

    ;; explicit connectivity predicates (model movement routes)
    (driveable ?from - location ?to - location)  ;; truck movement allowed
    (air-route ?from - location ?to - location)  ;; airplane movement allowed between airports
  )

  ;; Truck actions (ground-level)
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
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
                    (at-truck ?t ?from)
                    (driveable ?from ?to)
                  )
    :effect (and
              (at-truck ?t ?to)
              (not (at-truck ?t ?from))
            )
  )

  ;; Airplane actions (air-level)
  (:action airplane_load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
                    (at-plane ?a ?l)
                    (at-pkg ?p ?l)
                    (airport ?l)
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
                    (airport ?l)
                  )
    :effect (and
              (at-pkg ?p ?l)
              (not (in-plane ?p ?a))
            )
  )

  (:action airplane_fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
                    (at-plane ?a ?from)
                    (airport ?from)
                    (airport ?to)
                    (air-route ?from ?to)
                  )
    :effect (and
              (at-plane ?a ?to)
              (not (at-plane ?a ?from))
            )
  )
)