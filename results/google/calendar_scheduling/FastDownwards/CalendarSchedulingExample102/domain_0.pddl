(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (person ?p - person)
    (slot ?s - slot)
    (next ?s1 - slot ?s2 - slot)          ; s2 immediately follows s1 (30-min step)
    (busy ?p - person ?s - slot)          ; participant busy in that slot
    (occupied ?s - slot)                  ; meeting occupies this slot
    (assigned-start ?s - slot)            ; meeting start assigned at this slot
    (meeting-scheduled)
  )

  ; Schedule a 60-minute meeting (2 consecutive 30-min slots).
  ; This action is parameterised over the four participants so the planner can
  ; check each participant's busy status explicitly (keeps agent identities distinct).
  (:action schedule-meeting
    :parameters (?s1 - slot ?s2 - slot
                 ?dylan - person ?kathryn - person ?hannah - person ?anna - person)
    :precondition (and
      (slot ?s1) (slot ?s2)
      (next ?s1 ?s2)
      ; none of the participants is busy in either required slot
      (not (busy ?dylan ?s1)) (not (busy ?dylan ?s2))
      (not (busy ?kathryn ?s1)) (not (busy ?kathryn ?s2))
      (not (busy ?hannah ?s1)) (not (busy ?hannah ?s2))
      (not (busy ?anna ?s1)) (not (busy ?anna ?s2))
    )
    :effect (and
      (meeting-scheduled)
      (assigned-start ?s1)
      (occupied ?s1) (occupied ?s2)
    )
  )
)