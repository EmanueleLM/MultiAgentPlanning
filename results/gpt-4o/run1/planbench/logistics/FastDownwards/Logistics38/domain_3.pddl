(define (domain logistics)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location truck airplane package city
    )
    (:predicates
        (at ?x - (either truck airplane package) ?loc - location)
        (in ?pkg - package ?carrier - (either truck airplane))
        (airport ?loc - location)
        (city_of ?loc - location ?city - city)
        (connected ?from - location ?to - location ?city - city) ; added for clarity in driving within a city
    )
    (:action load_truck
        :parameters (?pkg - package ?trk - truck ?loc - location)
        :precondition (and (at ?trk ?loc) (at ?pkg ?loc))
        :effect (and (not (at ?pkg ?loc)) (in ?pkg ?trk))
    )
    (:action unload_truck
        :parameters (?pkg - package ?trk - truck ?loc - location)
        :precondition (and (in ?pkg ?trk) (at ?trk ?loc))
        :effect (and (not (in ?pkg ?trk)) (at ?pkg ?loc))
    )
    (:action drive_truck
        :parameters (?trk - truck ?from - location ?to - location ?city - city)
        :precondition (and (at ?trk ?from) (connected ?from ?to ?city))
        :effect (and (not (at ?trk ?from)) (at ?trk ?to))
    )
    (:action load_airplane
        :parameters (?pkg - package ?apl - airplane ?loc - location)
        :precondition (and (at ?apl ?loc) (at ?pkg ?loc))
        :effect (and (not (at ?pkg ?loc)) (in ?pkg ?apl))
    )
    (:action unload_airplane
        :parameters (?pkg - package ?apl - airplane ?loc - location)
        :precondition (and (in ?pkg ?apl) (at ?apl ?loc))
        :effect (and (not (in ?pkg ?apl)) (at ?pkg ?loc))
    )
    (:action fly_airplane
        :parameters (?apl - airplane ?from - location ?to - location)
        :precondition (and (at ?apl ?from) (airport ?from) (airport ?to))
        :effect (and (not (at ?apl ?from)) (at ?apl ?to))
    )
)