(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        timeslot
    )
    (:constants
        benjamin - person
        hannah - person
        brenda - person
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
            (not (meeting_scheduled ?ts))
        )
        :effect (and
            (meeting_scheduled ?ts)
        )
    )
)