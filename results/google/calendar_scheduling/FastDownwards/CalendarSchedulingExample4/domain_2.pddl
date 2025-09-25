(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :fluents)
  (:types agent slot)
  (:constants donna john billy - agent)
  (:predicates
    (busy ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )
  (:functions (total-cost))

  (:action schedule-by-donna
    :parameters (?s - slot)
    :precondition (and
                    (not (busy donna ?s))
                    (not (busy john ?s))
                    (not (busy billy ?s))
                    (not (meeting-scheduled ?s))
                  )
    :effect (and
              (meeting-scheduled ?s)
              (increase (total-cost) 1)
            )
  )

  (:action schedule-by-john
    :parameters (?s - slot)
    :precondition (and
                    (not (busy john ?s))
                    (not (busy donna ?s))
                    (not (busy billy ?s))
                    (not (meeting-scheduled ?s))
                  )
    :effect (and
              (meeting-scheduled ?s)
              (increase (total-cost) 1)
            )
  )

  (:action schedule-by-billy
    :parameters (?s - slot)
    :precondition (and
                    (not (busy billy ?s))
                    (not (busy donna ?s))
                    (not (busy john ?s))
                    (not (meeting-scheduled ?s))
                  )
    :effect (and
              (meeting-scheduled ?s)
              (increase (total-cost) 1)
            )
  )
)