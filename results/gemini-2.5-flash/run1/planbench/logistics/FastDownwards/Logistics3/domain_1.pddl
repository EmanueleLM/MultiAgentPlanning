(define (domain logistics3)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        package
        vehicle
        truck airplane - vehicle
        location
        city
    )

    (:predicates
        (at ?obj - (or package truck airplane) ?loc - location)
        (in ?pkg - package ?veh - (or truck airplane))
        (is_airport ?loc - location)
        (loc_in_city ?loc - location ?city - city)
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
                           (loc_in_city ?from ?c)
                           (loc_in_city ?to ?c)
                           (not (= ?from ?to)))
        :effect (and (not (at ?t ?from))
                     (at ?t ?to))
    )

    (:action fly_airplane
        :parameters (?a - airplane ?from_airport - location ?to_airport - location ?from_city - city ?to_city - city)
        :precondition (and (at ?a ?from_airport)
                           (is_airport ?from_airport)
                           (is_airport ?to_airport)
                           (loc_in_city ?from_airport ?from_city)
                           (loc_in_city ?to_airport ?to_city)
                           (not (= ?from_city ?to_city))
                           (not (= ?from_airport ?to_airport))) ; Redundant if only one airport per city and cities are distinct, but harmless.
        :effect (and (not (at ?a ?from_airport))
                     (at ?a ?to_airport))
    )
)