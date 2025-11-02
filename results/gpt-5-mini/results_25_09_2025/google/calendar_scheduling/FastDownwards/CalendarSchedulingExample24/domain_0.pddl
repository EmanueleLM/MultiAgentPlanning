(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)

  (:predicates
    (participant ?p - person)
    (slot ?s - slot)
    (free ?p - person ?s - slot)        ; person p is free at slot s
    (scheduled ?s - slot)               ; meeting scheduled at slot s
    (acceptable-for-benjamin ?s - slot) ; slot acceptable to Benjamin (his preference)
  )

  ;; Benjamin, Hannah, and Brenda each have a distinct scheduling action.
  ;; Each action requires that all participants are free in the chosen slot.
  ;; The Benjamin action additionally enforces Benjamin's stated preference.
  ;; Effects mark the slot as scheduled and remove the free status for participants
  ;; so the slot cannot be reused.

  (:action schedule-by-benjamin
    :parameters (?s - slot)
    :precondition (and
      (participant benjamin)
      (participant hannah)
      (participant brenda)
      (free benjamin ?s)
      (free hannah ?s)
      (free brenda ?s)
      (acceptable-for-benjamin ?s)
    )
    :effect (and
      (scheduled ?s)
      (not (free benjamin ?s))
      (not (free hannah ?s))
      (not (free brenda ?s))
    )
  )

  (:action schedule-by-hannah
    :parameters (?s - slot)
    :precondition (and
      (participant benjamin)
      (participant hannah)
      (participant brenda)
      (free benjamin ?s)
      (free hannah ?s)
      (free brenda ?s)
    )
    :effect (and
      (scheduled ?s)
      (not (free benjamin ?s))
      (not (free hannah ?s))
      (not (free brenda ?s))
    )
  )

  (:action schedule-by-brenda
    :parameters (?s - slot)
    :precondition (and
      (participant benjamin)
      (participant hannah)
      (participant brenda)
      (free benjamin ?s)
      (free hannah ?s)
      (free brenda ?s)
    )
    :effect (and
      (scheduled ?s)
      (not (free benjamin ?s))
      (not (free hannah ?s))
      (not (free brenda ?s))
    )
  )
)