(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        timeslot
        person
    )
    (:predicates
        (available ?p - person ?ts - timeslot)
        (meeting_scheduled ?ts - timeslot)
    )
    (:action schedule_meeting
        :parameters (?ts - timeslot)
        :precondition (and
            (available benjamin ?ts)
            (available hannah ?ts)
            (available brenda ?ts)
            (not (meeting_scheduled ?ts)) ; Ensure only one meeting is scheduled
        )
        :effect (and
            (meeting_scheduled ?ts)
        )
    )
)