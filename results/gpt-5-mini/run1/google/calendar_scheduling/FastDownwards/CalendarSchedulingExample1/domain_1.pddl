(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot person)

  (:predicates
    (slot_exists ?s - slot)
    (free ?p - person ?s - slot)
    (before_1500 ?s - slot)
    (meeting_scheduled)
    (scheduled_at ?s - slot)
  )

  ;; Preferred scheduling action: respects Billy's preference by requiring starts strictly before 15:00.
  (:action schedule-preferred
    :parameters (?s - slot)
    :precondition (and
                    (slot_exists ?s)
                    (not (meeting_scheduled))
                    (before_1500 ?s)
                    (free raymond ?s)
                    (free billy ?s)
                    (free donald ?s)
                  )
    :effect (and
              (meeting_scheduled)
              (scheduled_at ?s)
            )
  )

  ;; Fallback scheduling action: used only if no preferred slot is available.
  (:action schedule-any
    :parameters (?s - slot)
    :precondition (and
                    (slot_exists ?s)
                    (not (meeting_scheduled))
                    (free raymond ?s)
                    (free billy ?s)
                    (free donald ?s)
                  )
    :effect (and
              (meeting_scheduled)
              (scheduled_at ?s)
            )
  )
)