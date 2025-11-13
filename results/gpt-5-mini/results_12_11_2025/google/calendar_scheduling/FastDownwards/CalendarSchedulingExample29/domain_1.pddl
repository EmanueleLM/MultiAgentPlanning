(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions :strips)
  (:types person slot)

  (:predicates
    (free ?p - person ?s - slot)        ; person ?p is free during slot ?s
    (next ?s1 - slot ?s2 - slot)       ; ?s2 immediately follows ?s1 (consecutive 30-min slots)
    (meeting_scheduled)                ; true when meeting has been scheduled
  )

  (:action schedule-meeting
    :parameters (?s1 - slot ?s2 - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
                    (next ?s1 ?s2)
                    ;; each participant must be free in both consecutive slots
                    (free ?p1 ?s1) (free ?p1 ?s2)
                    (free ?p2 ?s1) (free ?p2 ?s2)
                    (free ?p3 ?s1) (free ?p3 ?s2)
                  )
    :effect (and
              (meeting_scheduled)
              ;; mark those person-slot occupancies as no longer free (book the meeting)
              (not (free ?p1 ?s1)) (not (free ?p1 ?s2))
              (not (free ?p2 ?s1)) (not (free ?p2 ?s2))
              (not (free ?p3 ?s1)) (not (free ?p3 ?s2))
            )
  )
)