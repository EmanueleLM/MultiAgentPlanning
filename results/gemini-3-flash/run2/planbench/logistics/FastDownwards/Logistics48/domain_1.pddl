(define (domain logistics)
    (:requirements :strips :typing)
    (:types
        city location thing - object
        package vehicle - thing
        truck airplane - vehicle
    )
    (:predicates
        (at ?obj - thing ?loc - location)
        (in ?pkg - package ?veh - vehicle)
        (in_city ?loc - location ?city - city)
        (airport ?loc - location)
    )
    (:action load-truck
        :parameters (?p - package ?v - truck ?l - location)
        :precondition (and (at ?p ?l) (at ?v ?l))
        :effect (and (not (at ?p ?l)) (in ?p ?v))
    )
    (:action load-airplane
        :parameters (?p - package ?v - airplane ?l - location)
        :precondition (and (at ?p ?l) (at ?v ?l))
        :effect (and (not (at ?p ?l)) (in ?p ?v))
    )
    (:action unload-truck
        :parameters (?p - package ?v - truck ?l - location)
        :precondition (and (in ?p ?v) (at ?v ?l))
        :effect (and (not (in ?p ?v)) (at ?p ?l))
    )
    (:action unload-airplane
        :parameters (?p - package ?v - airplane ?l - location)
        :precondition (and (in ?p ?v) (at ?v ?l))
        :effect (and (not (in ?p ?v)) (at ?p ?l))
    )
    (:action drive-truck
        :parameters (?v - truck ?from - location ?to - location ?c - city)
        :precondition (and (at ?v ?from) (in_city ?from ?c) (in_city ?to ?c))
        :effect (and (not (at ?v ?from)) (at ?v ?to))
    )
    (:action fly-airplane
        :parameters (?v - airplane ?from - location ?to - location)
        :precondition (and (at ?v ?from) (airport ?from) (airport ?to))
        :effect (and (not (at ?v ?from)) (at ?v ?to))
    )
)