(define (domain logistics)
    (:requirements :strips :typing)
    (:types
        package truck airplane location city - object
    )
    (:predicates
        (at ?obj - object ?loc - location)
        (in_truck ?pkg - package ?truck - truck)
        (in_airplane ?pkg - package ?airplane - airplane)
        (is_airport ?loc - location)
        (in_city ?loc - location ?city - city)
    )

    (:action load_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (at ?p ?l) (at ?t ?l))
        :effect (and (not (at ?p ?l)) (in_truck ?p ?t))
    )

    (:action load_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (at ?p ?l) (at ?a ?l))
        :effect (and (not (at ?p ?l)) (in_airplane ?p ?a))
    )

    (:action unload_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (in_truck ?p ?t) (at ?t ?l))
        :effect (and (not (in_truck ?p ?t)) (at ?p ?l))
    )

    (:action unload_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (in_airplane ?p ?a) (at ?a ?l))
        :effect (and (not (in_airplane ?p ?a)) (at ?p ?l))
    )

    (:action drive_truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and (at ?t ?from) (in_city ?from ?c) (in_city ?to ?c))
        :effect (and (not (at ?t ?from)) (at ?t ?to))
    )

    (:action fly_airplane
        :parameters (?a - airplane ?from - location ?to - location)
        :precondition (and (at ?a ?from) (is_airport ?from) (is_airport ?to))
        :effect (and (not (at ?a ?from)) (at ?a ?to))
    )
)