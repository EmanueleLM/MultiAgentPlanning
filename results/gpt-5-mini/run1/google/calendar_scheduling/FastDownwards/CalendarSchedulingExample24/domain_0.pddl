(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person meeting slot day)

  (:predicates
    (slot ?s - slot)
    (day ?d - day)
    (slot-on-day ?s - slot ?d - day)
    (slot-successor ?s1 - slot ?s2 - slot)

    (available ?p - person ?s - slot)

    (proposed ?m - meeting ?s - slot)
    (proposed-by ?m - meeting ?p - person)

    (accepted ?m - meeting ?p - person)

    (meeting-scheduled ?m - meeting)
    (meeting-start ?m - meeting ?s - slot)
  )

  ;; Benjamin proposes a meeting at a given slot.
  ;; Preconditions require that all required attendees are available at that slot.
  (:action propose-by-benjamin
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (proposed ?m ?s))
      (available benjamin ?s)
      (available hannah ?s)
      (available brenda ?s)
    )
    :effect (and
      (proposed ?m ?s)
      (proposed-by ?m benjamin)
      (accepted ?m benjamin)
    )
  )

  ;; Hannah can propose similarly (keeps participant actions distinct).
  (:action propose-by-hannah
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (proposed ?m ?s))
      (available benjamin ?s)
      (available hannah ?s)
      (available brenda ?s)
    )
    :effect (and
      (proposed ?m ?s)
      (proposed-by ?m hannah)
      (accepted ?m hannah)
    )
  )

  ;; Brenda can propose similarly.
  (:action propose-by-brenda
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (proposed ?m ?s))
      (available benjamin ?s)
      (available hannah ?s)
      (available brenda ?s)
    )
    :effect (and
      (proposed ?m ?s)
      (proposed-by ?m brenda)
      (accepted ?m brenda)
    )
  )

  ;; Each participant can accept a proposed meeting (requires a proposal at that slot).
  (:action accept-by-benjamin
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (proposed ?m ?s)
      (not (accepted ?m benjamin))
      (available benjamin ?s)
    )
    :effect (accepted ?m benjamin)
  )

  (:action accept-by-hannah
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (proposed ?m ?s)
      (not (accepted ?m hannah))
      (available hannah ?s)
    )
    :effect (accepted ?m hannah)
  )

  (:action accept-by-brenda
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (proposed ?m ?s)
      (not (accepted ?m brenda))
      (available brenda ?s)
    )
    :effect (accepted ?m brenda)
  )

  ;; Finalize the meeting once all required attendees have accepted.
  (:action finalize-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (proposed ?m ?s)
      (accepted ?m benjamin)
      (accepted ?m hannah)
      (accepted ?m brenda)
      (not (meeting-scheduled ?m))
    )
    :effect (and
      (meeting-scheduled ?m)
      (meeting-start ?m ?s)
    )
  )
)