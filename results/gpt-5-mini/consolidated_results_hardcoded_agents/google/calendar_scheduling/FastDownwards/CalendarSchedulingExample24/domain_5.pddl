(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (available ?p - participant ?s - slot)
    (slot-in-window ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
    (slot-successor ?s1 - slot ?s2 - slot)
  )

  (:action choose-slot
    :parameters (?s - slot)
    :precondition (and
      (slot-in-window ?s)
      (not (meeting-scheduled))
      (available benjamin ?s)
      (available hannah ?s)
      (available brenda ?s)
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
  )
)