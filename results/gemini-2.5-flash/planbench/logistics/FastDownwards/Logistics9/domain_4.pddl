(define (domain logistics9)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    city - object
    location - object
    package - object
    vehicle - object
    truck - vehicle
    airplane - vehicle
  )

  (:predicates
    (at ?obj - object ?loc - location)
    (in ?pkg - package ?veh - vehicle)
    (is-airport ?loc - location)
    (is-city-loc ?loc - location ?city - city)
    (vehicle-city ?veh - truck ?city - city)
  )

  (:functions
    (total-cost)
  )

  (:action load-truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (at ?pkg ?loc) (at ?truck ?loc))
    :effect (and (not (at ?pkg ?loc))
                 (in ?pkg ?truck)
                 (increase (total-cost) 1))
  )

  (:action unload-truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and (in ?pkg ?truck) (at ?truck ?loc))
    :effect (and (not (in ?pkg ?truck))
                 (at ?pkg ?loc)
                 (increase (total-cost) 1))
  )

  (:action drive-truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and (at ?truck ?from)
                       (vehicle-city ?truck ?city)
                       (is-city-loc ?from ?city)
                       (is-city-loc ?to ?city))
    :effect (and (not (at ?truck ?from))
                 (at ?truck ?to)
                 (increase (total-cost) 1))
  )

  (:action load-airplane
    :parameters (?pkg - package ?plane - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc)
                       (at ?plane ?loc)
                       (is-airport ?loc))
    :effect (and (not (at ?pkg ?loc))
                 (in ?pkg ?plane)
                 (increase (total-cost) 1))
  )

  (:action unload-airplane
    :parameters (?pkg - package ?plane - airplane ?loc - location)
    :precondition (and (in ?pkg ?plane)
                       (at ?plane ?loc)
                       (is-airport ?loc))
    :effect (and (not (in ?pkg ?plane))
                 (at ?pkg ?loc)
                 (increase (total-cost) 1))
  )

  (:action fly-airplane
    :parameters (?plane - airplane ?from - location ?to - location ?from-city - city ?to-city - city)
    :precondition (and (at ?plane ?from)
                       (is-airport ?from)
                       (is-airport ?to)
                       (is-city-loc ?from ?from-city)
                       (is-city-loc ?to ?to-city)
                       (not (= ?from-city ?to-city)))
    :effect (and (not (at ?plane ?from))
                 (at ?plane ?to)
                 (increase (total-cost) 1))
  )
)