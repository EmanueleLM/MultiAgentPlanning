(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    benjamin hannah brenda - person
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available benjamin ?t)
      (available hannah ?t)
      (available brenda ?t)
    )
    :effect (meeting_scheduled)
  )
)