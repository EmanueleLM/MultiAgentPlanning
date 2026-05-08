(define (domain meeting_schedule_monday_instance)
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
      (required ?m benjamin)
      (free benjamin ?s)
      (required ?m hannah)
      (free hannah ?s)
      (required ?m brenda)
      (free brenda ?s)
    )
    :effect (and
      (scheduled_at ?m ?s)
      (not (unscheduled ?m))
    )
  )
)