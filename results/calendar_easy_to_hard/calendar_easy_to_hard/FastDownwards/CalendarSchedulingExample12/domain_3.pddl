(define (domain meeting-scheduling)
  (:requirements :typing :strips :fluents :action-costs)
  (:types person time)

  (:constants dylan kathryn hannah anna - person)

  (:functions (total-cost) (time-cost ?t - time))

  (:predicates
    (next ?t1 - time ?t2 - time)
    (free ?p - person ?t - time)
    (meeting-scheduled ?t - time)
  )

  (:action schedule-meeting
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (free dylan ?t) (free dylan ?t2)
      (free kathryn ?t) (free kathryn ?t2)
      (free hannah ?t) (free hannah ?t2)
      (free anna ?t) (free anna ?t2)
    )
    :effect (and
      (meeting-scheduled ?t)
      (increase (total-cost) (time-cost ?t))
    )
  )
)