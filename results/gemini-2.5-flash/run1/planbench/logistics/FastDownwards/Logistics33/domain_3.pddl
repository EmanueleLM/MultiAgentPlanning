(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        vehicle
        truck - vehicle
        airplane - vehicle
        package
    )
    (:predicates
        (at_location ?obj - (either package vehicle) ?loc - location)
        (in_vehicle ?p - package ?v - vehicle)
        (in_city ?loc - location ?c - city)
        (is_airport ?loc - location)
    )

    (:action load_package_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (at_location ?p ?l)
                           (at_location ?t ?l))
        :effect (and (not (at_location ?p ?l))
                     (in_vehicle ?p ?t)))

    (:action unload_package_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and (in_vehicle ?p ?t)
                           (at_location ?t ?l))
        :effect (and (not (in_vehicle ?p ?t))
                     (at_location ?p ?l)))

    (:action load_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (at_location ?p ?l)
                           (at_location ?a ?l))
        :effect (and (not (at_location ?p ?l))
                     (in_vehicle ?p ?a)))

    (:action unload_package_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (in_vehicle ?p ?a)
                           (at_location ?a ?l))
        :effect (and (not (in_vehicle ?p ?a))
                     (at_location ?p ?l)))

    (:action drive_truck
        :parameters (?t - truck ?l_from - location ?l_to - location ?c - city)
        :precondition (and (at_location ?t ?l_from)
                           (in_city ?l_from ?c)
                           (in_city ?l_to ?c)
                           (not (= ?l_from ?l_to)))
        :effect (and (not (at_location ?t ?l_from))
                     (at_location ?t ?l_to)))

    (:action fly_airplane
        :parameters (?a - airplane ?l_from - location ?l_to - location ?c_from - city ?c_to - city)
        :precondition (and (at_location ?a ?l_from)
                           (is_airport ?l_from)
                           (is_airport ?l_to)
                           (in_city ?l_from ?c_from)
                           (in_city ?l_to ?c_to)
                           (not (= ?l_from ?l_to)) ; Prevent flying to same airport
                           (not (= ?c_from ?c_to))) ; Enforce inter-city flight
        :effect (and (not (at_location ?a ?l_from))
                     (at_location ?a ?l_to)))