(define (domain meeting-scheduler)
  (:requirements :typing)
  (:types person time)

  (:predicates
    (free_heather ?t - time)
    (free_nicholas ?t - time)
    (free_zachary ?t - time)
    (meeting_at ?t - time)
  )

  (:action schedule-meeting-heather
    :parameters (?t - time)
    :precondition (and (not (meeting_at ?t))
                       (free_heather ?t)
                       (free_nicholas ?t)
                       (free_zachary ?t))
    :effect (meeting_at ?t)
  )

  (:action schedule-meeting-nicholas
    :parameters (?t - time)
    :precondition (and (not (meeting_at ?t))
                       (free_heather ?t)
                       (free_nicholas ?t)
                       (free_zachary ?t))
    :effect (meeting_at ?t)
  )

  (:action schedule-meeting-zachary
    :parameters (?t - time)
    :precondition (and (not (meeting_at ?t))
                       (free_heather ?t)
                       (free_nicholas ?t)
                       (free_zachary ?t))
    :effect (meeting_at ?t)
  )
)