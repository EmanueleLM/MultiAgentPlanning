(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent slot)
  (:predicates
    (slot ?s - slot)
    (busy ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  (:action schedule-by-donna
    :parameters (?s - slot)
    :precondition (and
                    (slot ?s)
                    (not (busy donna ?s))
                    (not (busy john ?s))
                    (not (busy billy ?s))
                    (not (meeting-scheduled ?s))
                  )
    :effect (meeting-scheduled ?s)
    :cost 1
  )

  (:action schedule-by-john
    :parameters (?s - slot)
    :precondition (and
                    (slot ?s)
                    (not (busy john ?s))
                    (not (busy donna ?s))
                    (not (busy billy ?s))
                    (not (meeting-scheduled ?s))
                  )
    :effect (meeting-scheduled ?s)
    :cost 1
  )

  (:action schedule-by-billy
    :parameters (?s - slot)
    :precondition (and
                    (slot ?s)
                    (not (busy billy ?s))
                    (not (busy donna ?s))
                    (not (busy john ?s))
                    (not (meeting-scheduled ?s))
                  )
    :effect (meeting-scheduled ?s)
    :cost 1
  )
)