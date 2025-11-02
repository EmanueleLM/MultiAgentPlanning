(define (domain integrated-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot meeting)

  (:predicates
    (is_slot ?s - slot)
    (is_meeting ?m - meeting)

    (within_workhours ?s - slot)
    (ben_pref_ok ?s - slot)
    (occupied ?s - slot)
    (free_slot ?s - slot)

    (participant ?p - person)
    (participant_of ?m - meeting ?p - person)
    (invited ?m - meeting ?p - person)

    (available ?p - person ?s - slot)
    (busy ?p - person ?s - slot)

    (meeting_at ?m - meeting ?s - slot)
    (proposed ?m - meeting)
  )

  (:action schedule_meeting_ben
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (is_meeting ?m)
      (is_slot ?s)
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
      (is_meeting ?m)
      (participant ?p)
      (proposed ?m)
      (not (invited ?m ?p))
    )
    :effect (invited ?m ?p)
  )

  (:action schedule_meeting_hannah
    :parameters (?m - meeting ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (is_meeting ?m)
      (is_slot ?s)
      (free_slot ?s)
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s)
      (participant_of ?m ?p1)
      (participant_of ?m ?p2)
      (participant_of ?m ?p3)
    )
    :effect (and
      (meeting_at ?m ?s)
      (proposed ?m)
      (not (free_slot ?s))
      (occupied ?s)
      (not (available ?p1 ?s))
      (not (available ?p2 ?s))
      (not (available ?p3 ?s))
    )
  )

  (:action schedule_meeting_brenda
    :parameters (?m - meeting ?s - slot ?p_ben - person ?p_hannah - person ?p_brenda - person)
    :precondition (and
      (is_meeting ?m)
      (is_slot ?s)
      (within_workhours ?s)
      (ben_pref_ok ?s)
      (participant_of ?m ?p_ben)
      (participant_of ?m ?p_hannah)
      (participant_of ?m ?p_brenda)
      (available ?p_hannah ?s)
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