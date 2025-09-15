(define (domain integrated-scheduling)
  (:requirements :strips :typing)
  (:types timeslot meeting)

  (:predicates
    (time ?t - timeslot)
    (next ?t1 ?t2 - timeslot)
    (startable ?t - timeslot)
    (free-michelle ?t - timeslot)
    (free-steven-start ?t - timeslot)
    (free-jerry ?t - timeslot)
    (meeting ?m - meeting)
    (meeting-start ?m ?t - timeslot)
    (meeting-confirm-michelle ?m ?t - timeslot)
    (meeting-confirm-steven ?m ?t - timeslot)
    (meeting-confirm-jerry ?m ?t - timeslot)
    (meeting-finalized ?m - meeting)
  )

  (:action schedule-michelle
    :parameters (?m - meeting ?t1 - timeslot ?t2 - timeslot)
    :precondition (and
      (meeting ?m)
      (startable ?t1)
      (next ?t1 ?t2)
      (free-michelle ?t1)
      (free-michelle ?t2)
    )
    :effect (and
      (meeting-confirm-michelle ?m ?t1)
    )
  )

  (:action schedule-steven
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (meeting ?m)
      (startable ?t)
      (free-steven-start ?t)
    )
    :effect (and
      (meeting-confirm-steven ?m ?t)
    )
  )

  (:action schedule-jerry
    :parameters (?m - meeting ?t1 - timeslot ?t2 - timeslot)
    :precondition (and
      (meeting ?m)
      (startable ?t1)
      (next ?t1 ?t2)
      (free-jerry ?t1)
      (free-jerry ?t2)
    )
    :effect (and
      (meeting-confirm-jerry ?m ?t1)
    )
  )

  (:action finalize-meeting
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (meeting ?m)
      (meeting-confirm-michelle ?m ?t)
      (meeting-confirm-steven ?m ?t)
      (meeting-confirm-jerry ?m ?t)
    )
    :effect (and
      (meeting-finalized ?m)
      (meeting-start ?m ?t)
    )
  )
)