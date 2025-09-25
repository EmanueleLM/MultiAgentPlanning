(define (domain orchestrated-meeting)
  (:requirements :typing :strips :negative-preconditions)
  (:types participant time)

  (:predicates
    (free ?p - participant ?t - time)
    (preferred ?t - time)
    (meeting-scheduled)
    (scheduled-at ?t - time)
  )

  (:action schedule-preferred-brandon
    :parameters (?t - time)
    :precondition (and
                    (not (meeting-scheduled))
                    (preferred ?t)
                    (free brandon ?t)
                    (free jerry ?t)
                    (free bradley ?t)
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?t)
              (not (free brandon ?t))
              (not (free jerry ?t))
              (not (free bradley ?t))
            )
  )

  (:action schedule-nonpreferred-brandon
    :parameters (?t - time)
    :precondition (and
                    (not (meeting-scheduled))
                    (not (preferred ?t))
                    (free brandon ?t)
                    (free jerry ?t)
                    (free bradley ?t)
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?t)
              (not (free brandon ?t))
              (not (free jerry ?t))
              (not (free bradley ?t))
            )
  )

  (:action schedule-preferred-jerry
    :parameters (?t - time)
    :precondition (and
                    (not (meeting-scheduled))
                    (preferred ?t)
                    (free brandon ?t)
                    (free jerry ?t)
                    (free bradley ?t)
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?t)
              (not (free brandon ?t))
              (not (free jerry ?t))
              (not (free bradley ?t))
            )
  )

  (:action schedule-nonpreferred-jerry
    :parameters (?t - time)
    :precondition (and
                    (not (meeting-scheduled))
                    (not (preferred ?t))
                    (free brandon ?t)
                    (free jerry ?t)
                    (free bradley ?t)
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?t)
              (not (free brandon ?t))
              (not (free jerry ?t))
              (not (free bradley ?t))
            )
  )

  (:action schedule-preferred-bradley
    :parameters (?t - time)
    :precondition (and
                    (not (meeting-scheduled))
                    (preferred ?t)
                    (free brandon ?t)
                    (free jerry ?t)
                    (free bradley ?t)
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?t)
              (not (free brandon ?t))
              (not (free jerry ?t))
              (not (free bradley ?t))
            )
  )

  (:action schedule-nonpreferred-bradley
    :parameters (?t - time)
    :precondition (and
                    (not (meeting-scheduled))
                    (not (preferred ?t))
                    (free brandon ?t)
                    (free jerry ?t)
                    (free bradley ?t)
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?t)
              (not (free brandon ?t))
              (not (free jerry ?t))
              (not (free bradley ?t))
            )
  )

)