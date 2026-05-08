(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants benjamin hannah brenda - person)
  (:predicates
    (free ?p - person ?s - slot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and 
      (free benjamin ?s)
      (free hannah ?s)
      (free brenda ?s)
    )
    :effect (meeting_scheduled)
  )
)