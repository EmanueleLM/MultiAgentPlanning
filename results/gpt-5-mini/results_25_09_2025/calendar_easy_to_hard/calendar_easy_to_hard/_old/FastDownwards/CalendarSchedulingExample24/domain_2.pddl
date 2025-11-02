(define (domain integrated-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot meeting)

  (:predicates
    (is_slot ?s - slot)
    (is_meeting ?m - meeting)
    (within_workhours ?s - slot)

    (busy ?p - person ?s - slot)
    (occupied ?s - slot)
    (free_slot ?s - slot)

    (participant_of ?m - meeting ?p - person)
    (meeting_at ?m - meeting ?s - slot)
    (scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot ?b - person ?j - person ?h - person ?n - person ?jc - person)
    :precondition (and
      (is_meeting ?m)
      (is_slot ?s)
      (within_workhours ?s)
      (not (occupied ?s))
      (participant_of ?m ?b)
      (participant_of ?m ?j)
      (participant_of ?m ?h)
      (participant_of ?m ?n)
      (participant_of ?m ?jc)
      (not (busy ?b ?s))
      (not (busy ?j ?s))
      (not (busy ?h ?s))
      (not (busy ?n ?s))
      (not (busy ?jc ?s))
    )
    :effect (and
      (meeting_at ?m ?s)
      (scheduled ?m)
      (occupied ?s)
      (not (free_slot ?s))
    )
  )
)