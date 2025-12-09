(define (domain integrated_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location stage)

  (:predicates
    ;; location types
    (road_loc ?l - location)
    (airport_loc ?l - location)

    ;; connectivity (direct connections within a city for roads; between airports for air)
    (road_connected ?a - location ?b - location)
    (air_connected ?a - location ?b - location)

    ;; positions
    (atpkg ?p - package ?l - location)
    (attruck ?t - truck ?l - location)
    (atplane ?pl - airplane ?l - location)

    ;; containment
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?pl - airplane)

    ;; discrete stage progression
    (current-stage ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; Truck agent actions
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (succ ?s ?s2)
                    (attruck ?t ?l)
                    (atpkg ?p ?l)
                    (road_loc ?l)
                  )
    :effect (and
              (in-truck ?p ?t)
              (not (atpkg ?p ?l))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (succ ?s ?s2)
                    (attruck ?t ?l)
                    (in-truck ?p ?t)
                    (road_loc ?l)
                  )
    :effect (and
              (atpkg ?p ?l)
              (not (in-truck ?p ?t))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (succ ?s ?s2)
                    (attruck ?t ?from)
                    (road_connected ?from ?to)
                    (road_loc ?from)
                    (road_loc ?to)
                  )
    :effect (and
              (attruck ?t ?to)
              (not (attruck ?t ?from))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  ;; Airplane agent actions
  (:action plane-load
    :parameters (?pl - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (succ ?s ?s2)
                    (atplane ?pl ?l)
                    (atpkg ?p ?l)
                    (airport_loc ?l)
                  )
    :effect (and
              (in-plane ?p ?pl)
              (not (atpkg ?p ?l))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  (:action plane-unload
    :parameters (?pl - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (succ ?s ?s2)
                    (atplane ?pl ?l)
                    (in-plane ?p ?pl)
                    (airport_loc ?l)
                  )
    :effect (and
              (atpkg ?p ?l)
              (not (in-plane ?p ?pl))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  (:action plane-fly
    :parameters (?pl - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (succ ?s ?s2)
                    (atplane ?pl ?from)
                    (air_connected ?from ?to)
                    (airport_loc ?from)
                    (airport_loc ?to)
                  )
    :effect (and
              (atplane ?pl ?to)
              (not (atplane ?pl ?from))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )
)