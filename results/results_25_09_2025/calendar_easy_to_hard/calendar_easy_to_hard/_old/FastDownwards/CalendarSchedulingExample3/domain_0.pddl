(define (domain orchestrated-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types person meeting slot)

  (:predicates
    ;; Participant 1 (Arthur) predicates
    (free_person ?p - person ?s - slot)
    (meeting_scheduled ?s - slot)

    ;; Participant 2 (Michael) predicates
    (busy_slot ?s - slot)
    (within_work ?s - slot)
    (unscheduled ?m - meeting)
    (scheduled_michael ?m - meeting ?s - slot)

    ;; Participant 3 predicates
    (free_slot ?s - slot)
    (scheduled_global)
    (meeting-start ?s - slot)

    ;; shared adjacency predicate
    (next ?s1 - slot ?s2 - slot)
  )

  ;; Action derived from Participant 1's domain (kept distinct name)
  (:action schedule_arthur
    :parameters (?p - person ?s1 - slot ?s2 - slot)
    :precondition (and
      (free_person ?p ?s1)
      (next ?s1 ?s2)
      (free_person ?p ?s2)
    )
    :effect (and
      (meeting_scheduled ?s1)
      (not (free_person ?p ?s1))
      (not (free_person ?p ?s2))
    )
  )

  ;; Action derived from Participant 2's domain (kept distinct name)
  (:action schedule_michael
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (unscheduled ?m)
      (within_work ?s1)
      (within_work ?s2)
      (next ?s1 ?s2)
      (not (busy_slot ?s1))
      (not (busy_slot ?s2))
    )
    :effect (and
      (not (unscheduled ?m))
      (scheduled_michael ?m ?s1)
    )
  )

  ;; Action derived from Participant 3's domain (kept distinct name)
  (:action schedule_generic
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (free_slot ?s1)
      (free_slot ?s2)
      (next ?s1 ?s2)
      (not (scheduled_global))
    )
    :effect (and
      (not (free_slot ?s1))
      (not (free_slot ?s2))
      (scheduled_global)
      (meeting-start ?s1)
    )
  )
)