(define (domain multi-agent-meeting)
  (:requirements :typing :strips)
  (:types agent time)

  (:predicates
    (unscheduled)                       ; true until a meeting is scheduled
    (meeting-scheduled)                 ; becomes true when meeting scheduled
    (scheduled-at ?t - time)            ; records start time of scheduled meeting
    (succ ?t1 - time ?t2 - time)        ; successor half-hour timepoint
    (free ?a - agent ?t - time)         ; agent is free at this half-hour slot
    (pamela-accepts-start ?t - time)    ; pamela allows a meeting to start at ?t (preference)
  )

  ;; Three distinct scheduling actions (one per agent identity).
  ;; All require both consecutive half-hour slots to be free for every participant,
  ;; and require the meeting is still unscheduled. They also require Pamela's
  ;; preference predicate for the chosen start time.
  (:action schedule-anthony
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (unscheduled)
      (succ ?t ?t2)
      (free anthony ?t) (free anthony ?t2)
      (free pamela ?t)  (free pamela ?t2)
      (free zachary ?t) (free zachary ?t2)
      (pamela-accepts-start ?t)
    )
    :effect (and
      (not (unscheduled))
      (meeting-scheduled)
      (scheduled-at ?t)

      (not (free anthony ?t)) (not (free anthony ?t2))
      (not (free pamela ?t))  (not (free pamela ?t2))
      (not (free zachary ?t)) (not (free zachary ?t2))
    )
  )

  (:action schedule-pamela
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (unscheduled)
      (succ ?t ?t2)
      (free anthony ?t) (free anthony ?t2)
      (free pamela ?t)  (free pamela ?t2)
      (free zachary ?t) (free zachary ?t2)
      (pamela-accepts-start ?t)
    )
    :effect (and
      (not (unscheduled))
      (meeting-scheduled)
      (scheduled-at ?t)

      (not (free anthony ?t)) (not (free anthony ?t2))
      (not (free pamela ?t))  (not (free pamela ?t2))
      (not (free zachary ?t)) (not (free zachary ?t2))
    )
  )

  (:action schedule-zachary
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (unscheduled)
      (succ ?t ?t2)
      (free anthony ?t) (free anthony ?t2)
      (free pamela ?t)  (free pamela ?t2)
      (free zachary ?t) (free zachary ?t2)
      (pamela-accepts-start ?t)
    )
    :effect (and
      (not (unscheduled))
      (meeting-scheduled)
      (scheduled-at ?t)

      (not (free anthony ?t)) (not (free anthony ?t2))
      (not (free pamela ?t))  (not (free pamela ?t2))
      (not (free zachary ?t)) (not (free zachary ?t2))
    )
  )

)