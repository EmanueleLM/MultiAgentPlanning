(define (domain logistics)

 (:requirements :strips :typing :negative-preconditions)

 (:types
    location package vehicle - object
    truck airplane - vehicle
    city)

 (:predicates
    (at ?obj - object ?loc - location)
    (in ?pkg - package ?veh - vehicle)
    (truck-in-city ?truck - truck ?city - city)
    (airplane-at-airport ?airplane - airplane ?loc - location)
    (airport ?loc - location)
    (connected ?from ?to - location)
    (in-city ?loc - location ?city - city))

 (:action load-truck
    :parameters (?pkg - package ?truck - truck ?loc - location ?city - city)
    :precondition (and (at ?pkg ?loc) (at ?truck ?loc) (truck-in-city ?truck ?city) (in-city ?loc ?city))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?truck)))

 (:action unload-truck
    :parameters (?pkg - package ?truck - truck ?loc - location ?city - city)
    :precondition (and (in ?pkg ?truck) (at ?truck ?loc) (truck-in-city ?truck ?city) (in-city ?loc ?city))
    :effect (and (not (in ?pkg ?truck)) (at ?pkg ?loc)))

 (:action drive-truck
    :parameters (?truck - truck ?from ?to - location ?city - city)
    :precondition (and (at ?truck ?from) (truck-in-city ?truck ?city) (in-city ?from ?city) (in-city ?to ?city) (connected ?from ?to))
    :effect (and (not (at ?truck ?from)) (at ?truck ?to)))

 (:action load-airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (at ?pkg ?loc) (airplane-at-airport ?airplane ?loc) (airport ?loc))
    :effect (and (not (at ?pkg ?loc)) (in ?pkg ?airplane)))

 (:action unload-airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and (in ?pkg ?airplane) (airplane-at-airport ?airplane ?loc) (airport ?loc))
    :effect (and (not (in ?pkg ?airplane)) (at ?pkg ?loc)))

 (:action fly-airplane
    :parameters (?airplane - airplane ?from ?to - location)
    :precondition (and (airplane-at-airport ?airplane ?from) (airport ?from) (airport ?to))
    :effect (and (not (airplane-at-airport ?airplane ?from)) (airplane-at-airport ?airplane ?to)))
)