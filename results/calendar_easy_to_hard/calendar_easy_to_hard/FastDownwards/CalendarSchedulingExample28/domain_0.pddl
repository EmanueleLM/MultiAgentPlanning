(define (domain meeting-domain)
  :requirements :strips :typing
  :types agent slot
  :predicates
    (free ?a - agent ?s - slot)
    (unscheduled)
    (meeting-at ?s - slot)
    (scheduled-by ?a - agent ?s - slot)
    (work ?s - slot)
  ;; Brittany's scheduling action
  (:action schedule-by-brittany
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (free brittany ?s)
      (free emily ?s)
      (free doris ?s)
      (work ?s)
    )
    :effect (and
      (not (unscheduled))
      (meeting-at ?s)
      (scheduled-by brittany ?s)
    )
  )
  ;; Emily's scheduling action
  (:action schedule-by-emily
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (free brittany ?s)
      (free emily ?s)
      (free doris ?s)
      (work ?s)
    )
    :effect (and
      (not (unscheduled))
      (meeting-at ?s)
      (scheduled-by emily ?s)
    )
  )
  ;; Doris's scheduling action
  (:action schedule-by-doris
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (free brittany ?s)
      (free emily ?s)
      (free doris ?s)
      (work ?s)
    )
    :effect (and
      (not (unscheduled))
      (meeting-at ?s)
      (scheduled-by doris ?s)
    )
  )
)