(define (domain meeting-scheduling)
  (:requirements :typing :strips :negative-preconditions)
  (:types participant time)
  (:constants karen brandon donald kelly - participant)
  (:predicates
    (free ?p - participant ?t - time)
    (meeting-scheduled)
    (scheduled-at ?t - time)
  )

  (:action schedule-by-karen
    :parameters (?t - time)
    :precondition (and
      (not (meeting-scheduled))
      (free karen ?t)
      (free brandon ?t)
      (free donald ?t)
      (free kelly ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
      (not (free karen ?t))
      (not (free brandon ?t))
      (not (free donald ?t))
      (not (free kelly ?t))
    )
  )

  (:action schedule-by-brandon
    :parameters (?t - time)
    :precondition (and
      (not (meeting-scheduled))
      (free karen ?t)
      (free brandon ?t)
      (free donald ?t)
      (free kelly ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
      (not (free karen ?t))
      (not (free brandon ?t))
      (not (free donald ?t))
      (not (free kelly ?t))
    )
  )

  (:action schedule-by-donald
    :parameters (?t - time)
    :precondition (and
      (not (meeting-scheduled))
      (free karen ?t)
      (free brandon ?t)
      (free donald ?t)
      (free kelly ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
      (not (free karen ?t))
      (not (free brandon ?t))
      (not (free donald ?t))
      (not (free kelly ?t))
    )
  )

  (:action schedule-by-kelly
    :parameters (?t - time)
    :precondition (and
      (not (meeting-scheduled))
      (free karen ?t)
      (free brandon ?t)
      (free donald ?t)
      (free kelly ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
      (not (free karen ?t))
      (not (free brandon ?t))
      (not (free donald ?t))
      (not (free kelly ?t))
    )
  )
)