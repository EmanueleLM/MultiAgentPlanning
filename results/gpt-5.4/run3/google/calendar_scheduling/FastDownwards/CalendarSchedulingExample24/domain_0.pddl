(define (domain meeting_schedule_monday_benjamin_hannah_brenda)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    benjamin hannah brenda - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (allowed_slot ?s - slot)
    (scheduled ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting_at
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (allowed_slot ?s)
      (free benjamin ?s)
      (free hannah ?s)
      (free brenda ?s)
    )
    :effect (and
      (scheduled ?s)
      (meeting_scheduled)
    )
  )
)