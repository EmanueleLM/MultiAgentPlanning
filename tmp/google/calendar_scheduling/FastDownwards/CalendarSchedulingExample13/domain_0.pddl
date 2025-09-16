(define (domain meeting-schedule-merge)
  (:requirements :typing)
  (:types time-slot)

  (:predicates
    (free-gerald ?t - time-slot)
    (free-barbara ?t - time-slot)
    (free-roy ?t - time-slot)
    (scheduled ?t - time-slot)
  )

  ; Gerald's agent action
  (:action schedule-meeting-gerald
    :parameters (?t - time-slot)
    :precondition (and (free-gerald ?t)
                       (free-barbara ?t)
                       (free-roy ?t)
                       (not (scheduled ?t)))
    :effect (and (not (free-gerald ?t))
                 (not (free-barbara ?t))
                 (not (free-roy ?t))
                 (scheduled ?t))
  )

  ; Barbara's agent action
  (:action schedule-meeting-barbara
    :parameters (?t - time-slot)
    :precondition (and (free-barbara ?t)
                       (free-gerald ?t)
                       (free-roy ?t)
                       (not (scheduled ?t)))
    :effect (and (not (free-barbara ?t))
                 (not (free-gerald ?t))
                 (not (free-roy ?t))
                 (scheduled ?t))
  )

  ; Roy's agent action
  (:action schedule-meeting-roy
    :parameters (?t - time-slot)
    :precondition (and (free-roy ?t)
                       (free-gerald ?t)
                       (free-barbara ?t)
                       (not (scheduled ?t)))
    :effect (and (not (free-roy ?t))
                 (not (free-gerald ?t))
                 (not (free-barbara ?t))
                 (scheduled ?t))
  )
)