(define (domain meeting-scheduling-combined)
  (:requirements :adl :typing :negative-preconditions :action-costs)
  (:types timeslot participant)

  (:predicates
    (available ?p - participant ?t - timeslot)
    (meeting-scheduled)
    (meeting-at ?t - timeslot)
    (before14 ?t - timeslot)
  )

  ;; Nicole actions
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
    )
    :cost 1
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
    )
    :cost 0
  )

  ;; Christine actions
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
    )
    :cost 1
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
    )
    :cost 0
  )

  ;; Anna actions
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
    )
    :cost 1
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
    )
    :cost 0
  )

  ;; Terry actions
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
    )
    :cost 1
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
    )
    :cost 0
  )

  ;; Julie actions
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
    )
    :cost 1
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
    )
    :cost 0
  )

  ;; Abigail actions
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
    )
    :cost 1
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
    )
    :cost 0
  )
)