(define (domain logistics)
        (:requirements :strips :typing :negative-preconditions)
        (:types
            location truck airplane package city
        )
        (:predicates
            (at ?loc - location ?x - (truck airplane package))
            (in ?pkg - package ?carrier - (truck airplane))
            (airport ?loc - location)
            (city_of ?loc - location ?city - city)
        )
        (:action load_truck
            :parameters (?pkg - package ?trk - truck ?loc - location)
            :precondition (and (at ?loc ?trk) (at ?loc ?pkg))
            :effect (and (not (at ?loc ?pkg)) (in ?pkg ?trk))
        )
        (:action unload_truck
            :parameters (?pkg - package ?trk - truck ?loc - location)
            :precondition (and (in ?pkg ?trk) (at ?loc ?trk))
            :effect (and (not (in ?pkg ?trk)) (at ?loc ?pkg))
        )
        (:action drive_truck
            :parameters (?trk - truck ?from - location ?to - location ?city - city)
            :precondition (and (at ?from ?trk) (city_of ?from ?city) (city_of ?to ?city))
            :effect (and (not (at ?from ?trk)) (at ?to ?trk))
        )
        (:action load_airplane
            :parameters (?pkg - package ?apl - airplane ?loc - location)
            :precondition (and (at ?loc ?apl) (at ?loc ?pkg))
            :effect (and (not (at ?loc ?pkg)) (in ?pkg ?apl))
        )
        (:action unload_airplane
            :parameters (?pkg - package ?apl - airplane ?loc - location)
            :precondition (and (in ?pkg ?apl) (at ?loc ?apl))
            :effect (and (not (in ?pkg ?apl)) (at ?loc ?pkg))
        )
        (:action fly_airplane
            :parameters (?apl - airplane ?from - location ?to - location)
            :precondition (and (at ?from ?apl) (airport ?from) (airport ?to))
            :effect (and (not (at ?from ?apl)) (at ?to ?apl))
        )
    )