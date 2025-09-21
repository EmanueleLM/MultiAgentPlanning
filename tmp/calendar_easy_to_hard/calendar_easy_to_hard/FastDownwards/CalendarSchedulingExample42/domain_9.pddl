(define (domain integrated-meeting)
  (:requirements :typing :strips)
  (:types timeslot person)

  (:constants samantha brian arthur matthew marilyn mark andrea - person)

  (:predicates
    (is-timeslot ?t - timeslot)
    (is-person ?p - person)
    (free ?p - person ?t - timeslot)
    (meeting-not-scheduled)
    (meeting-scheduled)
    (meeting-at ?t - timeslot)
    (attending ?p - person)
  )

  (:action schedule_by_samantha
    :parameters (?t - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (is-timeslot ?t)
      (free samantha ?t) (free brian ?t) (free arthur ?t)
      (free matthew ?t) (free marilyn ?t) (free mark ?t) (free andrea ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (not (meeting-not-scheduled))

      (attending samantha) (attending brian) (attending arthur)
      (attending matthew) (attending marilyn) (attending mark) (attending andrea)

      (not (free samantha ?t)) (not (free brian ?t)) (not (free arthur ?t))
      (not (free matthew ?t)) (not (free marilyn ?t)) (not (free mark ?t)) (not (free andrea ?t))
    )
  )

  (:action schedule_by_brian
    :parameters (?t - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (is-timeslot ?t)
      (free samantha ?t) (free brian ?t) (free arthur ?t)
      (free matthew ?t) (free marilyn ?t) (free mark ?t) (free andrea ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (not (meeting-not-scheduled))

      (attending samantha) (attending brian) (attending arthur)
      (attending matthew) (attending marilyn) (attending mark) (attending andrea)

      (not (free samantha ?t)) (not (free brian ?t)) (not (free arthur ?t))
      (not (free matthew ?t)) (not (free marilyn ?t)) (not (free mark ?t)) (not (free andrea ?t))
    )
  )

  (:action schedule_by_arthur
    :parameters (?t - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (is-timeslot ?t)
      (free samantha ?t) (free brian ?t) (free arthur ?t)
      (free matthew ?t) (free marilyn ?t) (free mark ?t) (free andrea ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (not (meeting-not-scheduled))

      (attending samantha) (attending brian) (attending arthur)
      (attending matthew) (attending marilyn) (attending mark) (attending andrea)

      (not (free samantha ?t)) (not (free brian ?t)) (not (free arthur ?t))
      (not (free matthew ?t)) (not (free marilyn ?t)) (not (free mark ?t)) (not (free andrea ?t))
    )
  )

  (:action schedule_by_matthew
    :parameters (?t - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (is-timeslot ?t)
      (free samantha ?t) (free brian ?t) (free arthur ?t)
      (free matthew ?t) (free marilyn ?t) (free mark ?t) (free andrea ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (not (meeting-not-scheduled))

      (attending samantha) (attending brian) (attending arthur)
      (attending matthew) (attending marilyn) (attending mark) (attending andrea)

      (not (free samantha ?t)) (not (free brian ?t)) (not (free arthur ?t))
      (not (free matthew ?t)) (not (free marilyn ?t)) (not (free mark ?t)) (not (free andrea ?t))
    )
  )

  (:action schedule_by_marilyn
    :parameters (?t - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (is-timeslot ?t)
      (free samantha ?t) (free brian ?t) (free arthur ?t)
      (free matthew ?t) (free marilyn ?t) (free mark ?t) (free andrea ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (not (meeting-not-scheduled))

      (attending samantha) (attending brian) (attending arthur)
      (attending matthew) (attending marilyn) (attending mark) (attending andrea)

      (not (free samantha ?t)) (not (free brian ?t)) (not (free arthur ?t))
      (not (free matthew ?t)) (not (free marilyn ?t)) (not (free mark ?t)) (not (free andrea ?t))
    )
  )

  (:action schedule_by_mark
    :parameters (?t - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (is-timeslot ?t)
      (free samantha ?t) (free brian ?t) (free arthur ?t)
      (free matthew ?t) (free marilyn ?t) (free mark ?t) (free andrea ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (not (meeting-not-scheduled))

      (attending samantha) (attending brian) (attending arthur)
      (attending matthew) (attending marilyn) (attending mark) (attending andrea)

      (not (free samantha ?t)) (not (free brian ?t)) (not (free arthur ?t))
      (not (free matthew ?t)) (not (free marilyn ?t)) (not (free mark ?t)) (not (free andrea ?t))
    )
  )

  (:action schedule_by_andrea
    :parameters (?t - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (is-timeslot ?t)
      (free samantha ?t) (free brian ?t) (free arthur ?t)
      (free matthew ?t) (free marilyn ?t) (free mark ?t) (free andrea ?t)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (not (meeting-not-scheduled))

      (attending samantha) (attending brian) (attending arthur)
      (attending matthew) (attending marilyn) (attending mark) (attending andrea)

      (not (free samantha ?t)) (not (free brian ?t)) (not (free arthur ?t))
      (not (free matthew ?t)) (not (free marilyn ?t)) (not (free mark ?t)) (not (free andrea ?t))
    )
  )

)