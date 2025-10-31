(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:constants benjamin hannah brenda - participant)

  (:predicates
    (available ?p - participant ?s - slot)
    (unscheduled)
    (scheduled ?s - slot)
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
    )
  )
)