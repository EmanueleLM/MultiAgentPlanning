(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)            ; person ?p is free during slot ?s
    (next ?s1 - slot ?s2 - slot)            ; ?s2 immediately follows ?s1 (consecutive 30-min slots)
    (meeting-scheduled ?s1 - slot ?s2 - slot)
  )

  ;; Schedule a 1-hour meeting spanning two consecutive 30-minute slots
  ;; Action distinct and concrete: requires that all three participants are free in both slots
  (:action schedule-meeting
    :parameters (?a - person ?b - person ?c - person ?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free ?a ?s1) (free ?a ?s2)
      (free ?b ?s1) (free ?b ?s2)
      (free ?c ?s1) (free ?c ?s2)
    )
    :effect (and
      (meeting-scheduled ?s1 ?s2)
      (not (free ?a ?s1)) (not (free ?a ?s2))
      (not (free ?b ?s1)) (not (free ?b ?s2))
      (not (free ?c ?s1)) (not (free ?c ?s2))
    )
  )
)