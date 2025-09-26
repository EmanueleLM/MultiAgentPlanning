(define (domain meeting-scheduling)
  (:requirements :strips :typing :fluents)
  (:types participant time)
  (:predicates
    (available ?p - participant ?t - time)
    (workslot ?t - time)
    (meeting-scheduled ?t - time)
    (scheduled) ; flag: some meeting was scheduled
  )
  (:functions
    (total-cost)
    (time-index ?t - time)
  )

  ;; Pick a meeting start time. Requires that every participant is available at that time.
  ;; The action increases total-cost by the time-index of the chosen time; the planner will minimize total-cost
  ;; (thus preferring the earliest feasible time).
  (:action pick-time
    :parameters (?t - time)
    :precondition (and
      (workslot ?t)
      (available donald ?t)
      (available zachary ?t)
      (available kathryn ?t)
      (available deborah ?t)
      (available teresa ?t)
      (available james ?t)
    )
    :effect (and
      (meeting-scheduled ?t)
      (scheduled)
      (increase (total-cost) (time-index ?t))
    )
  )
)