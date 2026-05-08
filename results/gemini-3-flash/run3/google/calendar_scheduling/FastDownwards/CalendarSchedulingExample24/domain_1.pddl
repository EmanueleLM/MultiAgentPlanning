(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types participant timeslot)
  (:constants
    benjamin hannah brenda - participant
  )
  (:predicates
    (available ?p - participant ?t - timeslot)
    (meeting_held)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and 
      (available benjamin ?t)
      (available hannah ?t)
      (available brenda ?t)
    )
    :effect (meeting_held)
  )
)