(define (domain logistics)
    (:requirements :strips :typing)
    (:types location city package vehicle - object airplane truck - vehicle)

    (:predicates
        (at ?object - object ?location - location)
        (in ?package - package ?vehicle - vehicle)
        (airport ?location - location)
        (location_in_city ?location - location ?city - city)
        (airplane_at ?airplane - airplane ?city - city)
    )

    (:action load_truck
        :parameters (?package - package ?truck - truck ?loc - location)
        :precondition (and (at ?package ?loc) (at ?truck ?loc))
        :effect (and (not (at ?package ?loc)) (in ?package ?truck))
    )

    (:action unload_truck
        :parameters (?package - package ?truck - truck ?loc - location)
        :precondition (and (in ?package ?truck) (at ?truck ?loc))
        :effect (and (not (in ?package ?truck)) (at ?package ?loc))
    )

    (:action load_airplane
        :parameters (?package - package ?airplane - airplane ?loc - location)
        :precondition (and (at ?package ?loc) (at ?airplane ?loc))
        :effect (and (not (at ?package ?loc)) (in ?package ?airplane))
    )

    (:action unload_airplane
        :parameters (?package - package ?airplane - airplane ?loc - location)
        :precondition (and (in ?package ?airplane) (at ?airplane ?loc))
        :effect (and (not (in ?package ?airplane)) (at ?package ?loc))
    )

    (:action drive_truck
        :parameters (?truck - truck ?from - location ?to - location ?city - city)
        :precondition (and (at ?truck ?from) (location_in_city ?from ?city) (location_in_city ?to ?city))
        :effect (and (not (at ?truck ?from)) (at ?truck ?to))
    )

    (:action fly_airplane
        :parameters (?airplane - airplane ?from - location ?to - location)
        :precondition (and (at ?airplane ?from) (airport ?from) (airport ?to))
        :effect (and (not (at ?airplane ?from)) (at ?airplane ?to))
    )
)