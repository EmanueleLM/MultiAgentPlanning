(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types agent timeslot)
  (:predicates
    (free ?a - agent ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting-scheduled)
  )
  (:action schedule-s0900
    :parameters ()
    :precondition (and
      (free adam s0900)
      (free jerry s0900)
      (free matthew s0900)
    )
    :effect (and (scheduled s0900) (meeting-scheduled))
  )
  (:action schedule-s0930
    :parameters ()
    :precondition (and
      (free adam s0930)
      (free jerry s0930)
      (free matthew s0930)
    )
    :effect (and (scheduled s0930) (meeting-scheduled))
  )
  (:action schedule-s1000
    :parameters ()
    :precondition (and
      (free adam s1000)
      (free jerry s1000)
      (free matthew s1000)
    )
    :effect (and (scheduled s1000) (meeting-scheduled))
  )
  (:action schedule-s1030
    :parameters ()
    :precondition (and
      (free adam s1030)
      (free jerry s1030)
      (free matthew s1030)
    )
    :effect (and (scheduled s1030) (meeting-scheduled))
  )
  (:action schedule-s1100
    :parameters ()
    :precondition (and
      (free adam s1100)
      (free jerry s1100)
      (free matthew s1100)
    )
    :effect (and (scheduled s1100) (meeting-scheduled))
  )
  (:action schedule-s1130
    :parameters ()
    :precondition (and
      (free adam s1130)
      (free jerry s1130)
      (free matthew s1130)
    )
    :effect (and (scheduled s1130) (meeting-scheduled))
  )
  (:action schedule-s1200
    :parameters ()
    :precondition (and
      (free adam s1200)
      (free jerry s1200)
      (free matthew s1200)
    )
    :effect (and (scheduled s1200) (meeting-scheduled))
  )
  (:action schedule-s1230
    :parameters ()
    :precondition (and
      (free adam s1230)
      (free jerry s1230)
      (free matthew s1230)
    )
    :effect (and (scheduled s1230) (meeting-scheduled))
  )
  (:action schedule-s1300
    :parameters ()
    :precondition (and
      (free adam s1300)
      (free jerry s1300)
      (free matthew s1300)
    )
    :effect (and (scheduled s1300) (meeting-scheduled))
  )
  (:action schedule-s1330
    :parameters ()
    :precondition (and
      (free adam s1330)
      (free jerry s1330)
      (free matthew s1330)
    )
    :effect (and (scheduled s1330) (meeting-scheduled))
  )
  (:action schedule-s1400
    :parameters ()
    :precondition (and
      (free adam s1400)
      (free jerry s1400)
      (free matthew s1400)
    )
    :effect (and (scheduled s1400) (meeting-scheduled))
  )
  (:action schedule-s1430
    :parameters ()
    :precondition (and
      (free adam s1430)
      (free jerry s1430)
      (free matthew s1430)
    )
    :effect (and (scheduled s1430) (meeting-scheduled))
  )
  (:action schedule-s1500
    :parameters ()
    :precondition (and
      (free adam s1500)
      (free jerry s1500)
      (free matthew s1500)
    )
    :effect (and (scheduled s1500) (meeting-scheduled))
  )
  (:action schedule-s1530
    :parameters ()
    :precondition (and
      (free adam s1530)
      (free jerry s1530)
      (free matthew s1530)
    )
    :effect (and (scheduled s1530) (meeting-scheduled))
  )
  (:action schedule-s1600
    :parameters ()
    :precondition (and
      (free adam s1600)
      (free jerry s1600)
      (free matthew s1600)
    )
    :effect (and (scheduled s1600) (meeting-scheduled))
  )
  (:action schedule-s1630
    :parameters ()
    :precondition (and
      (free adam s1630)
      (free jerry s1630)
      (free matthew s1630)
    )
    :effect (and (scheduled s1630) (meeting-scheduled))
  )
)