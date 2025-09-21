(define (domain integrated-meeting)
  (:requirements :typing :strips)
  (:types timeslot person)

  (:predicates
    (timeslot ?t - timeslot)
    (person ?p - person)
    (free ?p - person ?t - timeslot)        ; person is free at a timeslot
    (meeting-not-scheduled)                 ; global: meeting not yet scheduled
    (meeting-scheduled)                     ; global: meeting has been scheduled
    (meeting-at ?t - timeslot)              ; meeting is scheduled at this timeslot
    (attending ?p - person)                 ; person is attending the scheduled meeting
  )

  ;; We keep each agent's scheduling action distinct (one action per agent submission).
  ;; All these actions require the meeting not yet scheduled and that the chosen timeslot
  ;; is free for ALL participants (so the resulting schedule works for everyone).
  ;; Effects mark the meeting scheduled at the chosen timeslot and add attending facts
  ;; for all participants.

  (:action schedule_by_samantha
    :parameters (?t - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (timeslot ?t)
      (free samantha ?t) (free marilyn ?t) (free mark ?t)
      (free andrea ?t) (free matthew ?t) (free arthur ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (not (meeting-not-scheduled))

      (attending samantha) (attending marilyn) (attending mark)
      (attending andrea) (attending matthew) (attending arthur)

      (not (free samantha ?t)) (not (free marilyn ?t)) (not (free mark ?t))
      (not (free andrea ?t)) (not (free matthew ?t)) (not (free arthur ?t))
    )
  )

  (:action schedule_by_matthew
    :parameters (?t - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (timeslot ?t)
      (free samantha ?t) (free marilyn ?t) (free mark ?t)
      (free andrea ?t) (free matthew ?t) (free arthur ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (not (meeting-not-scheduled))

      (attending samantha) (attending marilyn) (attending mark)
      (attending andrea) (attending matthew) (attending arthur)

      (not (free samantha ?t)) (not (free marilyn ?t)) (not (free mark ?t))
      (not (free andrea ?t)) (not (free matthew ?t)) (not (free arthur ?t))
    )
  )

  (:action schedule_by_marilyn
    :parameters (?t - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (timeslot ?t)
      (free samantha ?t) (free marilyn ?t) (free mark ?t)
      (free andrea ?t) (free matthew ?t) (free arthur ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (not (meeting-not-scheduled))

      (attending samantha) (attending marilyn) (attending mark)
      (attending andrea) (attending matthew) (attending arthur)

      (not (free samantha ?t)) (not (free marilyn ?t)) (not (free mark ?t))
      (not (free andrea ?t)) (not (free matthew ?t)) (not (free arthur ?t))
    )
  )

  (:action schedule_by_mark
    :parameters (?t - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (timeslot ?t)
      (free samantha ?t) (free marilyn ?t) (free mark ?t)
      (free andrea ?t) (free matthew ?t) (free arthur ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (not (meeting-not-scheduled))

      (attending samantha) (attending marilyn) (attending mark)
      (attending andrea) (attending matthew) (attending arthur)

      (not (free samantha ?t)) (not (free marilyn ?t)) (not (free mark ?t))
      (not (free andrea ?t)) (not (free matthew ?t)) (not (free arthur ?t))
    )
  )

  (:action schedule_by_andrea
    :parameters (?t - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (timeslot ?t)
      (free samantha ?t) (free marilyn ?t) (free mark ?t)
      (free andrea ?t) (free matthew ?t) (free arthur ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (not (meeting-not-scheduled))

      (attending samantha) (attending marilyn) (attending mark)
      (attending andrea) (attending matthew) (attending arthur)

      (not (free samantha ?t)) (not (free marilyn ?t)) (not (free mark ?t))
      (not (free andrea ?t)) (not (free matthew ?t)) (not (free arthur ?t))
    )
  )

  (:action schedule_by_arthur
    :parameters (?t - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (timeslot ?t)
      (free samantha ?t) (free marilyn ?t) (free mark ?t)
      (free andrea ?t) (free matthew ?t) (free arthur ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (not (meeting-not-scheduled))

      (attending samantha) (attending marilyn) (attending mark)
      (attending andrea) (attending matthew) (attending arthur)

      (not (free samantha ?t)) (not (free marilyn ?t)) (not (free mark ?t))
      (not (free andrea ?t)) (not (free matthew ?t)) (not (free arthur ?t))
    )
  )

)