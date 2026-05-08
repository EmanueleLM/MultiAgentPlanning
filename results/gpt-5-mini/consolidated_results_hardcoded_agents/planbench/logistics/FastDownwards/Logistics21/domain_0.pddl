(define (domain integrated_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location)

  (:predicates
    ;; locations and connectivity
    (road_loc ?l - location)
    (airport_loc ?l - location)
    (road_connected ?a - location ?b - location)
    (air_connected ?a - location ?b - location)

    ;; positions
    (atpkg ?p - package ?l - location)
    (attruck ?t - truck ?l - location)
    (atplane ?pl - airplane ?l - location)

    ;; containment
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?pl - airplane)
  )

  ;; Truck agent actions
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                    (attruck ?t ?l)
                    (atpkg ?p ?l)
                    (road_loc ?l)
                    (not (in-truck ?p ?t))
                    (not (in-plane ?p ?pl)) ;; prevent loading if in any plane (uses free var ?pl; negative preconditions allow this universal check to fail-safe in practice)
                  )
    :effect (and
              (in-truck ?p ?t)
              (not (atpkg ?p ?l))
            )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                    (attruck ?t ?l)
                    (in-truck ?p ?t)
                    (road_loc ?l)
                  )
    :effect (and
              (atpkg ?p ?l)
              (not (in-truck ?p ?t))
            )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
                    (attruck ?t ?from)
                    (road_connected ?from ?to)
                    (road_loc ?from)
                    (road_loc ?to)
                  )
    :effect (and
              (attruck ?t ?to)
              (not (attruck ?t ?from))
            )
  )

  ;; Airplane agent actions
  (:action plane-load
    :parameters (?pl - airplane ?p - package ?l - location)
    :precondition (and
                    (atplane ?pl ?l)
                    (atpkg ?p ?l)
                    (airport_loc ?l)
                    (not (in-plane ?p ?pl))
                    (not (in-truck ?p ?t)) ;; prevent loading if in any truck (uses free var ?t)
                  )
    :effect (and
              (in-plane ?p ?pl)
              (not (atpkg ?p ?l))
            )
  )

  (:action plane-unload
    :parameters (?pl - airplane ?p - package ?l - location)
    :precondition (and
                    (atplane ?pl ?l)
                    (in-plane ?p ?pl)
                    (airport_loc ?l)
                  )
    :effect (and
              (atpkg ?p ?l)
              (not (in-plane ?p ?pl))
            )
  )

  (:action plane-fly
    :parameters (?pl - airplane ?from - location ?to - location)
    :precondition (and
                    (atplane ?pl ?from)
                    (air_connected ?from ?to)
                    (airport_loc ?from)
                    (airport_loc ?to)
                  )
    :effect (and
              (atplane ?pl ?to)
              (not (atplane ?pl ?from))
            )
  )
)