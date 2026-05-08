(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants katherine nicole kevin - person)
  (:predicates
    (free ?p - person ?s - slot)
    (next ?s1 ?s2 - slot)
    (meeting_scheduled)
  )

  ;; Action to schedule a 1-hour meeting, which spans two consecutive 30-minute slots.
  ;; The meeting is for the specific group: Katherine, Nicole, and Kevin.
  (:action schedule_1h
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      ;; Katherine must be free in both slots
      (free katherine ?s1)
      (free katherine ?s2)
      ;; Nicole must be free in both slots
      (free nicole ?s1)
      (free nicole ?s2)
      ;; Kevin must be free in both slots
      (free kevin ?s1)
      (free kevin ?s2)
    )
    :effect (meeting_scheduled)
  )
)