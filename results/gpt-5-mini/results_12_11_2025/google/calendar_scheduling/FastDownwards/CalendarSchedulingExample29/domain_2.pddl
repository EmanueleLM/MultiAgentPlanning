(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions :strips)
  (:types person slot)

  (:predicates
    (free ?p - person ?s - slot)        ; person ?p is free during slot ?s
    (next ?s1 - slot ?s2 - slot)       ; ?s2 immediately follows ?s1 (consecutive 30-min slots)
    (meeting_scheduled)                ; true when the meeting has been scheduled
  )

  (:action schedule-meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
                    (next ?s1 ?s2)
                    (not (meeting_scheduled))
                    ;; each required participant must be free in both consecutive slots
                    (free madison ?s1) (free madison ?s2)
                    (free diana  ?s1) (free diana  ?s2)
                    (free shirley ?s1) (free shirley ?s2)
                  )
    :effect (and
              (meeting_scheduled)
              ;; mark those person-slot occupancies as no longer free (book the meeting)
              (not (free madison ?s1)) (not (free madison ?s2))
              (not (free diana  ?s1)) (not (free diana  ?s2))
              (not (free shirley ?s1)) (not (free shirley ?s2))
            )
  )
)