(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        package
        vehicle
        truck - vehicle
        airplane - vehicle
        location
        airport - location
    )

    (:predicates
        (at ?obj - (or package truck airplane) ?loc - location)
        (in ?pkg - package ?veh - (or truck airplane))
        (in_city ?loc - location ?city - city)
    )

    ;; Action to load a package into a truck
    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (at ?p ?l)
                           (at ?t ?l))
        :effect (and (not (at ?p ?l))
                     (in ?p ?t))
    )

    ;; Action to unload a package from a truck
    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (in ?p ?t)
                           (at ?t ?l))
        :effect (and (not (in ?p ?t))
                     (at ?p ?l))
    )

    ;; Action to drive a truck within a city
    (:action drive-truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and (at ?t ?from)
                           (in_city ?from ?c)
                           (in_city ?to ?c)
                           (not (= ?from ?to)))
        :effect (and (not (at ?t ?from))
                     (at ?t ?to))
    )

    ;; Action to load a package into an airplane
    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - airport)
        :precondition (and (at ?p ?l)
                           (at ?a ?l))
        :effect (and (not (at ?p ?l))
                     (in ?p ?a))
    )

    ;; Action to unload a package from an airplane
    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - airport)
        :precondition (and (in ?p ?a)
                           (at ?a ?l))
        :effect (and (not (in ?p ?a))
                     (at ?p ?l))
    )

    ;; Action to fly an airplane between cities (via airports)
    (:action fly-airplane
        :parameters (?a - airplane ?from - airport ?to - airport ?c1 - city ?c2 - city)
        :precondition (and (at ?a ?from)
                           (in_city ?from ?c1)
                           (in_city ?to ?c2)
                           (not (= ?c1 ?c2)))
        :effect (and (not (at ?a ?from))
                     (at ?a ?to))
    )
)