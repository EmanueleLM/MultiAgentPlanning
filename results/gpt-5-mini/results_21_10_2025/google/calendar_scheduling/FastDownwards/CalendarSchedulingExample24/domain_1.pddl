(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:constants
    benjamin hannah brenda - participant
  )

  (:predicates
    (available ?p - participant ?s - slot)  ; participant ?p is available for a meeting starting at slot ?s
    (unscheduled)                           ; no meeting scheduled yet
    (scheduled ?s - slot)                   ; meeting scheduled at slot ?s
    (meeting-scheduled)                     ; a meeting has been scheduled (slot not named in the goal)
  )

  ;; Schedule the meeting at a specific slot if all participants are available and no meeting is already scheduled.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available benjamin ?s)
      (available hannah ?s)
      (available brenda ?s)
    )
    :effect (and
      (not (unscheduled))
      (scheduled ?s)
      (meeting-scheduled)
    )
  )
)