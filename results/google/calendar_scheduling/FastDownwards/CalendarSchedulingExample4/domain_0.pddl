(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)
  (:predicates
    (slot ?s - slot)
    (busy ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  ;; Donna proposes scheduling (requires all participants free for that slot)
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
  )

  ;; John proposes scheduling (distinct action)
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
  )

  ;; Billy proposes scheduling (distinct action)
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
  )
)