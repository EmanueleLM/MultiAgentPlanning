(define (domain integrated-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (slot ?s - slot)
    (available ?p - person ?s - slot)    ; person is available at slot
    (attends ?p - person ?s - slot)      ; person attends meeting at slot
    (meeting-scheduled)                  ; meeting has been finalized
    (scheduled-at ?s - slot)             ; meeting scheduled at this slot
  )

  ;; Each agent's "attend" action (keeps agents' actions distinct).
  (:action attend-alice
    :parameters (?s - slot)
    :precondition (and (slot ?s) (available alice ?s))
    :effect (attends alice ?s)
  )

  (:action attend-daniel
    :parameters (?s - slot)
    :precondition (and (slot ?s) (available daniel ?s))
    :effect (attends daniel ?s)
  )

  (:action attend-scott
    :parameters (?s - slot)
    :precondition (and (slot ?s) (available scott ?s))
    :effect (attends scott ?s)
  )

  (:action attend-lori
    :parameters (?s - slot)
    :precondition (and (slot ?s) (available lori ?s))
    :effect (attends lori ?s)
  )

  (:action attend-cynthia
    :parameters (?s - slot)
    :precondition (and (slot ?s) (available cynthia ?s))
    :effect (attends cynthia ?s)
  )

  (:action attend-jeffrey
    :parameters (?s - slot)
    :precondition (and (slot ?s) (available jeffrey ?s))
    :effect (attends jeffrey ?s)
  )

  (:action attend-hannah
    :parameters (?s - slot)
    :precondition (and (slot ?s) (available hannah ?s))
    :effect (attends hannah ?s)
  )

  ;; Finalize the meeting only if every listed participant attends the same slot.
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (attends alice ?s)
      (attends daniel ?s)
      (attends scott ?s)
      (attends lori ?s)
      (attends cynthia ?s)
      (attends jeffrey ?s)
      (attends hannah ?s)
    )
    :effect (and (meeting-scheduled) (scheduled-at ?s))
  )
)