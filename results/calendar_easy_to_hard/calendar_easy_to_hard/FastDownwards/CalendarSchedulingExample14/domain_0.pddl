(define (domain orchestrated-meeting)
  (:requirements :typing :strips :negative-preconditions :fluents)
  (:types participant time)

  (:predicates
    (free ?p - participant ?t - time)      ; participant is free at start time ?t for a 30-min slot
    (preferred ?t - time)                 ; a time that Brandon prefers (>= 14:30)
    (meeting-scheduled)                   ; a meeting has been scheduled
    (scheduled-at ?t - time)              ; meeting scheduled at time ?t
  )

  (:functions
    (total-cost)                          ; cost to minimize: 0 for preferred slots, 1 otherwise
  )

  ;; We keep scheduling actions distinct per agent (initiator) as requested.
  ;; For each initiating agent we provide two actions:
  ;;  - schedule-preferred-<initiator>  : for times marked preferred (cost 0)
  ;;  - schedule-nonpreferred-<initiator> : for other times (cost 1)

  ;; Brandon-initiated scheduling (preferred)
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
              (increase (total-cost) 0)
            )
  )

  ;; Brandon-initiated scheduling (non-preferred)
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
              (increase (total-cost) 1)
            )
  )

  ;; Jerry-initiated scheduling (preferred)
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
              (increase (total-cost) 0)
            )
  )

  ;; Jerry-initiated scheduling (non-preferred)
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
              (increase (total-cost) 1)
            )
  )

  ;; Bradley-initiated scheduling (preferred)
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
              (increase (total-cost) 0)
            )
  )

  ;; Bradley-initiated scheduling (non-preferred)
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
              (increase (total-cost) 1)
            )
  )

)