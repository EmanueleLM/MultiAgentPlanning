(define (domain san_francisco_visit)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location person
    )
    (:predicates
        (at ?loc - location)
        (meeting_with_sarah_at_presidio)
        (satisfied_goal)
        (visited_richmond_district)
    )
    (:actions
        travel
        :parameters (?from - location ?to - location)
        :precondition (and (at ?from))
        :effect (and (not (at ?from)) (at ?to))

        start_meeting_sarah
        :parameters (?loc - location)
        :precondition (and (at presidio) (not (meeting_with_sarah_at_presidio)))
        :effect (meeting_with_sarah_at_presidio)

        end_meeting_sarah
        :parameters (?loc - location)
        :precondition (and (at presidio) (meeting_with_sarah_at_presidio))
        :effect (and (not (meeting_with_sarah_at_presidio)) (satisfied_goal))
    )
)