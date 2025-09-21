(define (domain meeting-scheduling-combined)
  (:requirements :typing :negative-preconditions :adl :action-costs)
  (:types timeslot participant)

  (:functions (total-cost))

  (:predicates
    (available ?p - participant ?t - timeslot)
    (meeting-scheduled)
    (meeting-at ?t - timeslot)
    (before14 ?t - timeslot)
  )

  ;; Actions kept distinct per agent to preserve agent-specific actions.
  ;; "Before" actions are penalized to encode Anna's preference (would rather not meet before 14:00).
  (:action schedule_by_nicole_before
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (before14 ?t)
      (available nicole ?t)
      (available christine ?t)
      (available anna ?t)
      (available terry ?t)
      (available julie ?t)
      (available abigail ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 10)
    )
  )

  (:action schedule_by_nicole_after
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (not (before14 ?t))
      (available nicole ?t)
      (available christine ?t)
      (available anna ?t)
      (available terry ?t)
      (available julie ?t)
      (available abigail ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 0)
    )
  )

  (:action schedule_by_christine_before
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (before14 ?t)
      (available nicole ?t)
      (available christine ?t)
      (available anna ?t)
      (available terry ?t)
      (available julie ?t)
      (available abigail ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 10)
    )
  )

  (:action schedule_by_christine_after
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (not (before14 ?t))
      (available nicole ?t)
      (available christine ?t)
      (available anna ?t)
      (available terry ?t)
      (available julie ?t)
      (available abigail ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 0)
    )
  )

  (:action schedule_by_anna_before
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (before14 ?t)
      (available nicole ?t)
      (available christine ?t)
      (available anna ?t)
      (available terry ?t)
      (available julie ?t)
      (available abigail ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      ;; Heavier penalty for scheduling before 14:00 to reflect Anna's preference
      (increase (total-cost) 20)
    )
  )

  (:action schedule_by_anna_after
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (not (before14 ?t))
      (available nicole ?t)
      (available christine ?t)
      (available anna ?t)
      (available terry ?t)
      (available julie ?t)
      (available abigail ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 0)
    )
  )

  (:action schedule_by_terry_before
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (before14 ?t)
      (available nicole ?t)
      (available christine ?t)
      (available anna ?t)
      (available terry ?t)
      (available julie ?t)
      (available abigail ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 10)
    )
  )

  (:action schedule_by_terry_after
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (not (before14 ?t))
      (available nicole ?t)
      (available christine ?t)
      (available anna ?t)
      (available terry ?t)
      (available julie ?t)
      (available abigail ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 0)
    )
  )

  (:action schedule_by_julie_before
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (before14 ?t)
      (available nicole ?t)
      (available christine ?t)
      (available anna ?t)
      (available terry ?t)
      (available julie ?t)
      (available abigail ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 10)
    )
  )

  (:action schedule_by_julie_after
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (not (before14 ?t))
      (available nicole ?t)
      (available christine ?t)
      (available anna ?t)
      (available terry ?t)
      (available julie ?t)
      (available abigail ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 0)
    )
  )

  (:action schedule_by_abigail_before
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (before14 ?t)
      (available nicole ?t)
      (available christine ?t)
      (available anna ?t)
      (available terry ?t)
      (available julie ?t)
      (available abigail ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 10)
    )
  )

  (:action schedule_by_abigail_after
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (not (before14 ?t))
      (available nicole ?t)
      (available christine ?t)
      (available anna ?t)
      (available terry ?t)
      (available julie ?t)
      (available abigail ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 0)
    )
  )
)