(define (domain logistics-multi-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city)

  (:predicates
    ;; Locations of vehicles and packages
    (truck_at ?t - truck ?l - location)
    (airplane_at ?a - airplane ?l - location)
    (pkg_at ?p - package ?l - location)

    ;; Containment relations
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)

    ;; Static relations
    (location_in_city ?l - location ?c - city)
    (truck_in_city ?t - truck ?c - city)
    (is_airport ?l - location)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Truck actions (prefix: truck_)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action truck_load
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
                    (truck_at ?t ?l)
                    (pkg_at ?p ?l)
                    (truck_in_city ?t ?c)
                    (location_in_city ?l ?c)
                  )
    :effect (and
              (not (pkg_at ?p ?l))
              (in_truck ?p ?t)
            )
  )

  (:action truck_unload
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
                    (truck_at ?t ?l)
                    (in_truck ?p ?t)
                    (truck_in_city ?t ?c)
                    (location_in_city ?l ?c)
                  )
    :effect (and
              (not (in_truck ?p ?t))
              (pkg_at ?p ?l)
            )
  )

  (:action truck_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
                    (truck_at ?t ?from)
                    (truck_in_city ?t ?c)
                    (location_in_city ?from ?c)
                    (location_in_city ?to ?c)
                  )
    :effect (and
              (not (truck_at ?t ?from))
              (truck_at ?t ?to)
            )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Airplane actions (prefix: airplane_)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action airplane_load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
                    (airplane_at ?a ?l)
                    (pkg_at ?p ?l)
                    (is_airport ?l)
                  )
    :effect (and
              (not (pkg_at ?p ?l))
              (in_plane ?p ?a)
            )
  )

  (:action airplane_unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
                    (airplane_at ?a ?l)
                    (in_plane ?p ?a)
                    (is_airport ?l)
                  )
    :effect (and
              (not (in_plane ?p ?a))
              (pkg_at ?p ?l)
            )
  )

  (:action airplane_fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
                    (airplane_at ?a ?from)
                    (is_airport ?from)
                    (is_airport ?to)
                  )
    :effect (and
              (not (airplane_at ?a ?from))
              (airplane_at ?a ?to)
            )
  )
)