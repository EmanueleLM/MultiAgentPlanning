(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants
    andrew grace samuel - person
  )
  (:predicates
    (at_slot ?s - slot)
    (next ?s1 ?s2 - slot)
    (free ?p - person ?s - slot)
    (scheduled)
  )

  ;; Moves the current focus to the next symbolic time slot.
  ;; This sequential structure allows a BFS or shortest-path search
  ;; to naturally find the earliest possible meeting time.
  (:action advance_time
    :parameters (?s1 ?s2 - slot)
    :precondition (and (at_slot ?s1) (next ?s1 ?s2))
    :effect (and (not (at_slot ?s1)) (at_slot ?s2))
  )

  ;; Schedules the meeting at the current focused time slot
  ;; if and only if all participants are free at that time.
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and 
      (at_slot ?s)
      (free andrew ?s)
      (free grace ?s)
      (free samuel ?s)
    )
    :effect (scheduled)
  )
)