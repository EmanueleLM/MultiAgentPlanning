(define (domain monday_meeting_scheduling)
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
    (allowed ?s - slot)
    (chosen ?s - slot)
    (scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (allowed ?s)
      (free benjamin ?s)
      (free hannah ?s)
      (free brenda ?s)
    )
    :effect (and
      (chosen ?s)
      (scheduled)
    )
  )
)