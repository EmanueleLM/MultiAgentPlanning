(define (domain orchestration_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city)

  (:predicates
    ;; dynamic / fluents
    (at_truck ?t - truck ?l - location)    ; truck T is at location L
    (at_plane ?a - airplane ?l - location) ; airplane A is at airport location L
    (at_pkg ?p - package ?l - location)    ; package P is on the ground at location L
    (in_truck ?p - package ?t - truck)     ; package P is loaded in truck T
    (in_plane ?p - package ?a - airplane)  ; package P is loaded in airplane A

    ;; static relations
    (location_in_city ?l - location ?c - city) ; location L belongs to city C
    (truck_in_city ?t - truck ?c - city)       ; truck T is assigned to city C
    (airport ?l - location)                    ; location L is an airport
    (drive_edge ?l1 - location ?l2 - location) ; allowed direct drive from l1 to l2
    (flight_edge ?l1 - location ?l2 - location) ; allowed flight from airport l1 to airport l2
  )

  ;; Truck agent actions (prefixed with truck_)
  (:action truck_LOAD
    :parameters (?t - truck ?p - package ?l - location ?c - city)
    :precondition (and
                    (at_truck ?t ?l)
                    (at_pkg ?p ?l)
                    (truck_in_city ?t ?c)
                    (location_in_city ?l ?c)
                  )
    :effect (and
              (in_truck ?p ?t)
              (not (at_pkg ?p ?l))
            )
  )

  (:action truck_UNLOAD
    :parameters (?t - truck ?p - package ?l - location ?c - city)
    :precondition (and
                    (at_truck ?t ?l)
                    (in_truck ?p ?t)
                    (truck_in_city ?t ?c)
                    (location_in_city ?l ?c)
                  )
    :effect (and
              (at_pkg ?p ?l)
              (not (in_truck ?p ?t))
            )
  )

  (:action truck_DRIVE
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
                    (at_truck ?t ?from)
                    (drive_edge ?from ?to)
                    (truck_in_city ?t ?c)
                    (location_in_city ?from ?c)
                    (location_in_city ?to ?c)
                  )
    :effect (and
              (at_truck ?t ?to)
              (not (at_truck ?t ?from))
            )
  )

  ;; Airplane agent actions (prefixed with airplane_)
  (:action airplane_LOAD
    :parameters (?a - airplane ?p - package ?ap - location)
    :precondition (and
                    (at_plane ?a ?ap)
                    (at_pkg ?p ?ap)
                    (airport ?ap)
                  )
    :effect (and
              (in_plane ?p ?a)
              (not (at_pkg ?p ?ap))
            )
  )

  (:action airplane_UNLOAD
    :parameters (?a - airplane ?p - package ?ap - location)
    :precondition (and
                    (at_plane ?a ?ap)
                    (in_plane ?p ?a)
                    (airport ?ap)
                  )
    :effect (and
              (at_pkg ?p ?ap)
              (not (in_plane ?p ?a))
            )
  )

  (:action airplane_FLY
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
                    (at_plane ?a ?from)
                    (airport ?from)
                    (airport ?to)
                    (flight_edge ?from ?to)
                  )
    :effect (and
              (at_plane ?a ?to)
              (not (at_plane ?a ?from))
            )
  )
)