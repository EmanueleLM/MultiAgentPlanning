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
    (meeting_scheduled_lawrence)
    (meeting_scheduled_christine)
    (meeting_scheduled_barbara)
    (meeting_scheduled_stephanie)
    (meeting_scheduled_hannah)
  )

  (:action propose_orchestrator
    :parameters (?s - slot)
    :precondition ()
    :effect (proposed ?s)
  )

  (:action accept_lawrence
    :parameters (?s - slot)
    :precondition (and (proposed ?s) (available_lawrence ?s))
    :effect (meeting_scheduled_lawrence)
  )

  (:action accept_christine
    :parameters (?s - slot)
    :precondition (and (proposed ?s) (available_christine ?s))
    :effect (meeting_scheduled_christine)
  )

  (:action accept_barbara
    :parameters (?s - slot)
    :precondition (and (proposed ?s) (available_barbara ?s))
    :effect (meeting_scheduled_barbara)
  )

  (:action accept_stephanie
    :parameters (?s - slot)
    :precondition (and (proposed ?s) (available_stephanie ?s))
    :effect (meeting_scheduled_stephanie)
  )

  (:action accept_hannah
    :parameters (?s - slot)
    :precondition (and (proposed ?s) (available_hannah ?s))
    :effect (meeting_scheduled_hannah)
  )
)