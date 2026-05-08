(define (domain san_francisco_trip)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location person
    )
    (:predicates
        (at ?p - person ?l - location)
        (time_available ?p - person ?start ?end - time)
        (meeting_with ?p1 - person ?p2 - person)
        (goal_achieved)
    )
    (:action travel
        :parameters (?p - person ?from - location ?to - location)
        :precondition (at ?p ?from)
        :effect (and (not (at ?p ?from)) (at ?p ?to))
    )
    (:action start_meeting
        :parameters (?p1 - person ?p2 - person ?loc - location ?start ?end - time)
        :precondition (and (at ?p1 ?loc) (at ?p2 ?loc) (time_available ?p2 ?start ?end) (not (goal_achieved)))
        :effect (and (meeting_with ?p1 ?p2))
    )
    (:action end_meeting
        :parameters (?p1 - person ?p2 - person ?start ?end - time)
        :precondition (meeting_with ?p1 ?p2)
        :effect (and (not (meeting_with ?p1 ?p2)) (goal_achieved))
    )
)