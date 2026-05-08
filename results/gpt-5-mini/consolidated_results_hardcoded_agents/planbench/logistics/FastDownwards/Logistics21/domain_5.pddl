(define (domain integrated_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city stage)

  (:predicates
    (airport_loc ?l - location)
    (air_connected ?from - location ?to - location)

    (atpkg ?p - package ?l - location)
    (attruck ?t - truck ?l - location)
    (atplane ?pl - airplane ?l - location)

    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?pl - airplane)

    (in-city ?l - location ?c - city)

    (current-stage ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; Truck actions (operate only within a single city; require truck and package co-location)
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (succ ?s ?s2)
                    (attruck ?t ?l)
                    (atpkg ?p ?l)
                    (in-city ?l ?c)
                  )
    :effect (and
              (in-truck ?p ?t)
              (not (atpkg ?p ?l))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (succ ?s ?s2)
                    (attruck ?t ?l)
                    (in-truck ?p ?t)
                    (in-city ?l ?c)
                  )
    :effect (and
              (atpkg ?p ?l)
              (not (in-truck ?p ?t))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
                    (current-stage ?s)
                    (succ ?s ?s2)
                    (attruck ?t ?from)
                    (in-city ?from ?c)
                    (in-city ?to ?c)
                    (not (= ?from ?to))
                  )
    :effect (and
              (attruck ?t ?to)
              (not (attruck ?t ?from))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  ;; Airplane actions (operate only at airport locations; flights are between airport locations)
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
                    (not (= ?from ?to))
                  )
    :effect (and
              (atplane ?pl ?to)
              (not (atplane ?pl ?from))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )
)