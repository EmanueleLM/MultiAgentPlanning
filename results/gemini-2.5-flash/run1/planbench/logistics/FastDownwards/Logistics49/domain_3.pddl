(define (domain logistics49)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        package
        vehicle - object
        truck - vehicle
        airplane - vehicle
    )

    (:predicates
        (at ?o - object ?l - location) ; Fixed: Changed (either package vehicle) to object for strict PDDL 1.2 compliance.
        (in ?p - package ?v - vehicle)
        (in_city ?l - location ?c - city)
        (is_airport ?l - location)
    )

    (:action load_package_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (at ?p ?l)
                           (at ?t ?l))
        :effect (and (not (at ?p ?l))
                     (in ?p ?t))
    )

    (:action unload_package_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (in ?p ?t)
                           (at ?t ?l))
        :effect (and (not (in ?p ?t))
                     (at ?p ?l))
    )

    (:action load_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (at ?p ?l)
                           (at ?a ?l))
        :effect (and (not (at ?p ?l))
                     (in ?p ?a))
    )

    (:action unload_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (in ?p ?a)
                           (at ?a ?l))
        :effect (and (not (in ?p ?a))
                     (at ?p ?l))
    )

    (:action drive_truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and (at ?t ?from)
                           (in_city ?from ?c)
                           (in_city ?to ?c)
                           (not (= ?from ?to)))
        :effect (and (not (at ?t ?from))
                     (at ?t ?to))
    )

    (:action fly_airplane
        :parameters (?a - airplane ?from - location ?to - location ?c1 - city ?c2 - city)
        :precondition (and (at ?a ?from)
                           (is_airport ?from)
                           (is_airport ?to)
                           (in_city ?from ?c1)
                           (in_city ?to ?c2)
                           (not (= ?c1 ?c2))) ; Ensure flight is between different cities
        :effect (and (not (at ?a ?from))
                     (at ?a ?to))
    )
)