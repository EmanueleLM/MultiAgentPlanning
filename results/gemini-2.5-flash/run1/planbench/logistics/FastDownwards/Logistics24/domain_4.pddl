(define (domain logistics-24)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        package
        vehicle
        truck - vehicle
        airplane - vehicle
    )

    (:predicates
        (at_package ?p - package ?l - location)
        (at_vehicle ?v - vehicle ?l - location)
        (in ?p - package ?v - vehicle)
        (is_airport ?l - location)
        (in_city ?l - location ?c - city)
    )

    (:action load_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (at_package ?p ?l)
                           (at_vehicle ?t ?l))
        :effect (and (not (at_package ?p ?l))
                     (in ?p ?t)))

    (:action unload_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (in ?p ?t)
                           (at_vehicle ?t ?l))
        :effect (and (not (in ?p ?t))
                     (at_package ?p ?l)))

    (:action drive_truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and (at_vehicle ?t ?from)
                           (in_city ?from ?c)
                           (in_city ?to ?c)
                           (not (= ?from ?to)))
        :effect (and (not (at_vehicle ?t ?from))
                     (at_vehicle ?t ?to)))

    (:action load_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (at_package ?p ?l)
                           (at_vehicle ?a ?l))
        :effect (and (not (at_package ?p ?l))
                     (in ?p ?a)))

    (:action unload_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (in ?p ?a)
                           (at_vehicle ?a ?l))
        :effect (and (not (in ?p ?a))
                     (at_package ?p ?l)))

    (:action fly_airplane
        :parameters (?a - airplane ?from_loc - location ?to_loc - location ?from_city - city ?to_city - city)
        :precondition (and (at_vehicle ?a ?from_loc)
                           (is_airport ?from_loc)
                           (is_airport ?to_loc)
                           (in_city ?from_loc ?from_city)
                           (in_city ?to_loc ?to_city)
                           (not (= ?from_city ?to_city)))
        :effect (and (not (at_vehicle ?a ?from_loc))
                     (at_vehicle ?a ?to_loc)))
)