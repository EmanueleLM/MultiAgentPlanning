(define (domain schedule-meeting)
  (:requirements :typing)
  (:types person time)
  (:predicates
    (available ?p - person ?t - time)
    (selected ?t - time)
    (confirmed ?p - person ?t - time)
    (meeting-scheduled ?t - time)
  )

  ;; Michelle chooses/locks a time and confirms for herself
  (:action michelle-select
    :parameters (?t - time)
    :precondition (available michelle ?t)
    :effect (and
              (selected ?t)
              (confirmed michelle ?t)
            )
  )

  ;; Steven confirms the already-selected time (must be available for him)
  (:action steven-confirm
    :parameters (?t - time)
    :precondition (and
                    (selected ?t)
                    (available steven ?t)
                  )
    :effect (confirmed steven ?t)
  )

  ;; Jerry confirms the already-selected time (must be available for him)
  (:action jerry-confirm
    :parameters (?t - time)
    :precondition (and
                    (selected ?t)
                    (available jerry ?t)
                  )
    :effect (confirmed jerry ?t)
  )

  ;; Finalize the meeting once all participants have confirmed the same time
  (:action finalize-meeting
    :parameters (?t - time)
    :precondition (and
                    (confirmed michelle ?t)
                    (confirmed steven ?t)
                    (confirmed jerry ?t)
                  )
    :effect (meeting-scheduled ?t)
  )
)