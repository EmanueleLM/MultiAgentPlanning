(define (domain Logistics8)
  (:requirements :typing :negative-preconditions :equality)
  (:types
    location city - object
    vehicle - object
    truck airplane - vehicle
    package - object
  )

  (:predicates
    (at ?obj - (either package vehicle) ?loc - location)
    (in ?pkg - package ?veh - vehicle)
    (loc-in-city ?loc - location ?city - city)
    (is-airport ?loc - location)
  )

  (:action load
    :parameters (?pkg - package ?veh - vehicle ?loc - location)
    :precondition (and (at ?pkg ?loc)
                        (at ?veh ?loc))
    :effect (and (not (at ?pkg ?loc))
                  (in ?pkg ?veh)))

  (:action unload
    :parameters (?pkg - package ?veh - vehicle ?loc - location)
    :precondition (and (in ?pkg ?veh)
                        (at ?veh ?loc))
    :effect (and (at ?pkg ?loc)
                  (not (in ?pkg ?veh))))

  (:action drive
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and (at ?truck ?from)
                        (loc-in-city ?from ?city)
                        (loc-in-city ?to ?city)
                        (not (= ?from ?to)))
    :effect (and (not (at ?truck ?from))
                  (at ?truck ?to)))

  (:action fly
    :parameters (?airplane - airplane ?from - location ?to - location ?city1 - city ?city2 - city)
    :precondition (and (at ?airplane ?from)
                        (is-airport ?from)
                        (is-airport ?to)
                        (loc-in-city ?from ?city1)
                        (loc-in-city ?to ?city2)
                        (not (= ?city1 ?city2))
                        (not (= ?from ?to)))
    :effect (and (not (at ?airplane ?from))
                  (at ?airplane ?to)))