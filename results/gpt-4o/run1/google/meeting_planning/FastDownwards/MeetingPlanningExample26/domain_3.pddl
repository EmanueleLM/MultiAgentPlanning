```lisp
(define (domain san_francisco_trip)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location person
    )
    (:predicates
        (at ?p - person ?l - location)
        (available_sarah ?time)
        (meeting_in_progress)
        (goal_achieved)
    )
    (:action travel
        :parameters (?p - person ?from - location ?to - location)
        :precondition (at ?p ?from)
        :effect (and (not (at ?p ?from)) (at ?p ?to))
    )
    (:action start_meeting
        :parameters (?p1 - person ?p2 - person ?loc - location)
        :precondition (and (at ?p1 ?loc) (at ?p2 ?loc) (available_sarah t1315) (not (goal_achieved)) (not meeting_in_progress))
        :effect (and (meeting_in_progress))
    )
    (:action continue_meeting
        :parameters ()
        :precondition (and meeting_in_progress (available_sarah t1415))
        :effect (and))
    (:action end_meeting
        :parameters ()
        :precondition (and meeting_in_progress (available_sarah t1515))
        :effect (and (not meeting_in_progress) (goal_achieved))
    )
)
```