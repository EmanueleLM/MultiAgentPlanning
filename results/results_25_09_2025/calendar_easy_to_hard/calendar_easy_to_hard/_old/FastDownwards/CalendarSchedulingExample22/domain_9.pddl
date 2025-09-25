(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types slot)
  (:predicates
    (proposed ?s - slot)
    (available_lawrence ?s - slot)
    (available_christine ?s - slot)
    (available_barbara ?s - slot)
    (available_stephanie ?s - slot)
    (available_hannah ?s - slot)
    (accepted_lawrence ?s - slot)
    (accepted_christine ?s - slot)
    (accepted_barbara ?s - slot)
    (accepted_stephanie ?s - slot)
    (accepted_hannah ?s - slot)
    (meeting_scheduled)
  )

  (:action propose_orchestrator
    :parameters (?s - slot)
    :precondition (and)
    :effect (proposed ?s)
  )

  (:action accept_lawrence
    :parameters (?s - slot)
    :precondition (and (proposed ?s) (available_lawrence ?s))
    :effect (accepted_lawrence ?s)
  )

  (:action accept_christine
    :parameters (?s - slot)
    :precondition (and (proposed ?s) (available_christine ?s))
    :effect (accepted_christine ?s)
  )

  (:action accept_barbara
    :parameters (?s - slot)
    :precondition (and (proposed ?s) (available_barbara ?s))
    :effect (accepted_barbara ?s)
  )

  (:action accept_stephanie
    :parameters (?s - slot)
    :precondition (and (proposed ?s) (available_stephanie ?s))
    :effect (accepted_stephanie ?s)
  )

  (:action accept_hannah
    :parameters (?s - slot)
    :precondition (and (proposed ?s) (available_hannah ?s))
    :effect (accepted_hannah ?s)
  )

  (:action finalize_meeting
    :parameters (?s - slot)
    :precondition (and
      (proposed ?s)
      (accepted_lawrence ?s)
      (accepted_christine ?s)
      (accepted_barbara ?s)
      (accepted_stephanie ?s)
      (accepted_hannah ?s))
    :effect (meeting_scheduled)
  )
)