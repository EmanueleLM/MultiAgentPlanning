(define (domain meeting-scheduling)
  (:requirements :typing :strips :adl :negative-preconditions)
  (:types person time)

  (:predicates
    (person ?p - person)
    (time ?t - time)
    (next ?t1 - time ?t2 - time)
    ;; True iff participant ?p is free for the half-hour slot that starts at ?t
    (free ?p - person ?t - time)
    ;; Meeting scheduled with start at ?t (occupies ?t and the next time slot)
    (meeting-scheduled ?t - time)
  )

  ;; Single action that schedules a 60-minute meeting (two consecutive 30-min slots).
  ;; It takes explicit parameters for the four participants so identities are preserved
  ;; and used as hard constraints in the precondition.
  (:action schedule-meeting
    :parameters (?t - time ?t2 - time
                 ?dylan - person ?kathryn - person ?hannah - person ?anna - person)
    :precondition (and
      (next ?t ?t2)
      (person ?dylan) (person ?kathryn) (person ?hannah) (person ?anna)
      ;; each participant must be free in both consecutive half-hour slots
      (free ?dylan ?t)   (free ?dylan ?t2)
      (free ?kathryn ?t) (free ?kathryn ?t2)
      (free ?hannah ?t)  (free ?hannah ?t2)
      (free ?anna ?t)    (free ?anna ?t2)
    )
    :effect (and (meeting-scheduled ?t))
  )
)