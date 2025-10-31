(define (domain integrated-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot meeting)

  (:predicates
    ;; basic objects
    (slot ?s - slot)
    (meeting ?m - meeting)

    ;; time/availability/constraints
    (within_workhours ?s - slot)
    (ben_pref_ok ?s - slot)        ;; Benjamin's preference: acceptable start slots
    (occupied ?s - slot)           ;; slot already taken by a scheduled meeting
    (free_slot ?s - slot)          ;; alternative marker (used by Hannah's model)

    ;; participant membership and invites
    (participant ?p - person)              ;; unary: person is in the global participant list
    (participant_of ?m - meeting ?p - person) ;; meeting membership (which persons are required)
    (invited ?m - meeting ?p - person)

    ;; availability / conflicts
    (available ?p - person ?s - slot)   ;; person is known available at slot
    (busy ?p - person ?s - slot)        ;; person known busy at slot

    ;; meeting scheduling markers
    (meeting_at ?m - meeting ?s - slot) ;; meeting scheduled at a slot
    (proposed ?m - meeting)             ;; meeting has been proposed/scheduled
  )

  ;; Agent 1 actions (Benjamin's model)
  (:action schedule_meeting_ben
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (within_workhours ?s)
      (ben_pref_ok ?s)
      (not (occupied ?s))
    )
    :effect (and
      (meeting_at ?m ?s)
      (proposed ?m)
      (occupied ?s)
      (not (free_slot ?s))
    )
  )

  (:action invite_from_ben
    :parameters (?m - meeting ?p - person)
    :precondition (and
      (meeting ?m)
      (participant ?p)
      (proposed ?m)
      (not (invited ?m ?p))
    )
    :effect (invited ?m ?p)
  )

  ;; Agent 2 actions (Hannah's model)
  ;; Hannah's model required that all participants are available and the slot is free.
  ;; We keep her action distinct; it requires explicit availability for three participants.
  (:action schedule_meeting_hannah
    :parameters (?m - meeting ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (free_slot ?s)
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s)
      ;; Ensure these persons are the declared participants of the meeting
      (participant_of ?m ?p1)
      (participant_of ?m ?p2)
      (participant_of ?m ?p3)
    )
    :effect (and
      (meeting_at ?m ?s)
      (proposed ?m)
      (not (free_slot ?s))
      (occupied ?s)
      (not (available ?p1 ?s)) ;; mark them busy at that slot
      (not (available ?p2 ?s))
      (not (available ?p3 ?s))
    )
  )

  ;; Agent 3 actions (Brenda's model)
  ;; Brenda's model required that no participant is busy at the chosen slot.
  ;; We encode this with explicit person parameters corresponding to the meeting participants.
  (:action schedule_meeting_brenda
    :parameters (?m - meeting ?s - slot ?p_ben - person ?p_hannah - person ?p_brenda - person)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (within_workhours ?s)
      ;; enforce Benjamin's preference as part of a safe joint scheduling (so chosen slot respects Ben)
      (ben_pref_ok ?s)
      ;; ensure the parameters are the meeting participants
      (participant_of ?m ?p_ben)
      (participant_of ?m ?p_hannah)
      (participant_of ?m ?p_brenda)
      ;; Hannah's known availability must hold
      (available ?p_hannah ?s)
      ;; Brenda must not be busy at that slot; also ensure no known busy facts for other participants
      (not (busy ?p_brenda ?s))
      (not (busy ?p_ben ?s))
      (not (busy ?p_hannah ?s))
      (not (occupied ?s))
    )
    :effect (and
      (meeting_at ?m ?s)
      (proposed ?m)
      (occupied ?s)
      (not (free_slot ?s))
    )
  )
)