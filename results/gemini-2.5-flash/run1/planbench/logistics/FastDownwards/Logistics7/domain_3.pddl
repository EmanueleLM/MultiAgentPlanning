(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package truck airplane - object
        location - object
        city - object
    )

    (:predicates
        (at ?obj - (either package truck airplane) ?loc - location)
        (in ?pkg - package ?veh - (either truck airplane))
        (in-city ?loc - location ?city - city)
        (airport ?loc - location)
    )

    (:action load-package-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (at ?p ?l)
                           (at ?t ?l))
        :effect (and (not (at ?p ?l))
                     (in ?p ?t))
    )

    (:action unload-package-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (in ?p ?t)
                           (at ?t ?l))
        :effect (and (not (in ?p ?t))
                     (at ?p ?l))
    )

    (:action load-package-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (at ?p ?l)
                           (at ?a ?l))
        :effect (and (not (at ?p ?l))
                     (in ?p ?a))
    )

    (:action unload-package-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (in ?p ?a)
                           (at ?a ?l))
        :effect (and (not (in ?p ?a))
                     (at ?p ?l))
    )

    (:action drive-truck
        :parameters (?t - truck ?from - location ?to - location ?city - city)
        :precondition (and (at ?t ?from)
                           (in-city ?from ?city)
                           (in-city ?to ?city)
                           (not (= ?from ?to)))
        :effect (and (not (at ?t ?from))
                     (at ?t ?to))
    )

    (:action fly-airplane
        :parameters (?a - airplane ?from - location ?to - location ?city_from - city ?city_to - city)
        :precondition (and (at ?a ?from)
                           (airport ?from)
                           (airport ?to)
                           (in-city ?from ?city_from)
                           (in-city ?to ?city_to)
                           (not (= ?city_from ?city_to))) ; Ensure flying between different cities
        :effect (and (not (at ?a ?from))
                     (at ?a ?to))
    )
)