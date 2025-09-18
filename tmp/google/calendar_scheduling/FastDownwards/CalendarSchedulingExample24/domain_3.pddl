(define (domain orchestrated-meeting)
  (:requirements :typing :negative-preconditions)
  (:types person slot meeting)
  (:constants benjamin hannah brenda - person)

  (:predicates
    (within-workhours ?s - slot)
    (free ?p - person ?s - slot)
    (preferred ?p - person ?s - slot)
    (occupied ?s - slot)
    (proposed ?p - person ?m - meeting ?s - slot)
    (scheduled ?m - meeting ?s - slot)
    (in-meeting ?p - person ?m - meeting)
  )

  (:action propose-benjamin
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (within-workhours ?s)
      (free benjamin ?s)
      (preferred benjamin ?s)
      (not (occupied ?s))
    )
    :effect (proposed benjamin ?m ?s)
  )

  (:action propose-hannah
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (within-workhours ?s)
      (free hannah ?s)
      (not (occupied ?s))
    )
    :effect (proposed hannah ?m ?s)
  )

  (:action propose-brenda
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (within-workhours ?s)
      (free brenda ?s)
      (not (occupied ?s))
    )
    :effect (proposed brenda ?m ?s)
  )

  (:action finalize-by-orchestrator
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (within-workhours ?s)
      (proposed benjamin ?m ?s)
      (proposed hannah ?m ?s)
      (proposed brenda ?m ?s)
      (not (occupied ?s))
    )
    :effect (and
      (scheduled ?m ?s)
      (occupied ?s)
      (in-meeting benjamin ?m)
      (in-meeting hannah ?m)
      (in-meeting brenda ?m)
    )
  )
)