(define (domain calendar_scheduling_example24)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
    meeting
  )

  (:predicates
    (required ?m - meeting ?p - participant)
    (free ?p - participant ?s - timeslot)
    (allowed_start ?m - meeting ?s - timeslot)
    (scheduled_at ?m - meeting ?s - timeslot)
    (unscheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - timeslot)
    :precondition (and
      (unscheduled ?m)
      (allowed_start ?m ?s)
      (free benjamin ?s)
      (free hannah ?s)
      (free brenda ?s)
      (required ?m benjamin)
      (required ?m hannah)
      (required ?m brenda)
    )
    :effect (and
      (scheduled_at ?m ?s)
      (not (unscheduled ?m))
    )
  )
)