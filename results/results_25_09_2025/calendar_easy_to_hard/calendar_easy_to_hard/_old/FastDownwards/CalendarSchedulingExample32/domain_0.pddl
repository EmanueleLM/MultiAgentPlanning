(define (domain meeting-scheduling-combined)
  (:requirements :adl :typing :negative-preconditions :fluents :conditional-effects)
  (:types timeslot participant)

  (:predicates
    (available ?p - participant ?t - timeslot)   ; participant p is available at timeslot t
    (meeting-scheduled)                          ; true once a single meeting is scheduled
    (meeting-at ?t - timeslot)                   ; records which timeslot was chosen
    (before14 ?t - timeslot)                     ; timeslots that start before 14:00
  )

  (:functions
    (penalty) ; numeric penalty for scheduling before 14:00 (Anna's soft preference)
  )

  ;; Distinct scheduling actions for each participant (keeps agent actions distinct).
  ;; Each action requires that no meeting has been scheduled yet and that every participant
  ;; is available at the chosen timeslot. If chosen timeslot is before 14:00, the action
  ;; increases the global penalty by 1. All actions have the same effects (schedule the meeting).
  (:action schedule_by_nicole
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
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
      (when (before14 ?t) (increase (penalty) 1))
    )
  )

  (:action schedule_by_christine
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
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
      (when (before14 ?t) (increase (penalty) 1))
    )
  )

  (:action schedule_by_anna
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
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
      (when (before14 ?t) (increase (penalty) 1))
    )
  )

  (:action schedule_by_terry
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
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
      (when (before14 ?t) (increase (penalty) 1))
    )
  )

  (:action schedule_by_julie
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
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
      (when (before14 ?t) (increase (penalty) 1))
    )
  )

  (:action schedule_by_abigail
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
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
      (when (before14 ?t) (increase (penalty) 1))
    )
  )
)