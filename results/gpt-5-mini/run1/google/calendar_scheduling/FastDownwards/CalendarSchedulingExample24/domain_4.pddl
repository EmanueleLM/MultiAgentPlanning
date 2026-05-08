(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person meeting slot)

  (:constants
    benjamin hannah brenda - person
  )

  (:predicates
    (available ?p - person ?s - slot)
    (proposed ?m - meeting ?s - slot)
    (proposed-by ?m - meeting ?p - person)
    (accepted ?m - meeting ?p - person)
    (meeting-scheduled ?m - meeting)
    (meeting-start ?m - meeting ?s - slot)
  )

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