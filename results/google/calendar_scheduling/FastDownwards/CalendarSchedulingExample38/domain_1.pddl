(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :adl :action-costs)
  (:types person slot)
  (:constants
    adam frances natalie patrick willie diana - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:predicates
    (available ?p - person ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  (:action schedule-s0900
    :precondition (and
      (not (meeting-scheduled))
      (available adam s0900) (available frances s0900) (available natalie s0900)
      (available patrick s0900) (available willie s0900) (available diana s0900)
    )
    :effect (and (meeting-scheduled) (scheduled s0900))
    :cost 0
  )

  (:action schedule-s0930
    :precondition (and
      (not (meeting-scheduled))
      (available adam s0930) (available frances s0930) (available natalie s0930)
      (available patrick s0930) (available willie s0930) (available diana s0930)
    )
    :effect (and (meeting-scheduled) (scheduled s0930))
    :cost 1
  )

  (:action schedule-s1000
    :precondition (and
      (not (meeting-scheduled))
      (available adam s1000) (available frances s1000) (available natalie s1000)
      (available patrick s1000) (available willie s1000) (available diana s1000)
    )
    :effect (and (meeting-scheduled) (scheduled s1000))
    :cost 2
  )

  (:action schedule-s1030
    :precondition (and
      (not (meeting-scheduled))
      (available adam s1030) (available frances s1030) (available natalie s1030)
      (available patrick s1030) (available willie s1030) (available diana s1030)
    )
    :effect (and (meeting-scheduled) (scheduled s1030))
    :cost 3
  )

  (:action schedule-s1100
    :precondition (and
      (not (meeting-scheduled))
      (available adam s1100) (available frances s1100) (available natalie s1100)
      (available patrick s1100) (available willie s1100) (available diana s1100)
    )
    :effect (and (meeting-scheduled) (scheduled s1100))
    :cost 4
  )

  (:action schedule-s1130
    :precondition (and
      (not (meeting-scheduled))
      (available adam s1130) (available frances s1130) (available natalie s1130)
      (available patrick s1130) (available willie s1130) (available diana s1130)
    )
    :effect (and (meeting-scheduled) (scheduled s1130))
    :cost 5
  )

  (:action schedule-s1200
    :precondition (and
      (not (meeting-scheduled))
      (available adam s1200) (available frances s1200) (available natalie s1200)
      (available patrick s1200) (available willie s1200) (available diana s1200)
    )
    :effect (and (meeting-scheduled) (scheduled s1200))
    :cost 6
  )

  (:action schedule-s1230
    :precondition (and
      (not (meeting-scheduled))
      (available adam s1230) (available frances s1230) (available natalie s1230)
      (available patrick s1230) (available willie s1230) (available diana s1230)
    )
    :effect (and (meeting-scheduled) (scheduled s1230))
    :cost 7
  )

  (:action schedule-s1300
    :precondition (and
      (not (meeting-scheduled))
      (available adam s1300) (available frances s1300) (available natalie s1300)
      (available patrick s1300) (available willie s1300) (available diana s1300)
    )
    :effect (and (meeting-scheduled) (scheduled s1300))
    :cost 8
  )

  (:action schedule-s1330
    :precondition (and
      (not (meeting-scheduled))
      (available adam s1330) (available frances s1330) (available natalie s1330)
      (available patrick s1330) (available willie s1330) (available diana s1330)
    )
    :effect (and (meeting-scheduled) (scheduled s1330))
    :cost 9
  )

  (:action schedule-s1400
    :precondition (and
      (not (meeting-scheduled))
      (available adam s1400) (available frances s1400) (available natalie s1400)
      (available patrick s1400) (available willie s1400) (available diana s1400)
    )
    :effect (and (meeting-scheduled) (scheduled s1400))
    :cost 10
  )

  (:action schedule-s1430
    :precondition (and
      (not (meeting-scheduled))
      (available adam s1430) (available frances s1430) (available natalie s1430)
      (available patrick s1430) (available willie s1430) (available diana s1430)
    )
    :effect (and (meeting-scheduled) (scheduled s1430))
    :cost 11
  )

  (:action schedule-s1500
    :precondition (and
      (not (meeting-scheduled))
      (available adam s1500) (available frances s1500) (available natalie s1500)
      (available patrick s1500) (available willie s1500) (available diana s1500)
    )
    :effect (and (meeting-scheduled) (scheduled s1500))
    :cost 12
  )

  (:action schedule-s1530
    :precondition (and
      (not (meeting-scheduled))
      (available adam s1530) (available frances s1530) (available natalie s1530)
      (available patrick s1530) (available willie s1530) (available diana s1530)
    )
    :effect (and (meeting-scheduled) (scheduled s1530))
    :cost 13
  )

  (:action schedule-s1600
    :precondition (and
      (not (meeting-scheduled))
      (available adam s1600) (available frances s1600) (available natalie s1600)
      (available patrick s1600) (available willie s1600) (available diana s1600)
    )
    :effect (and (meeting-scheduled) (scheduled s1600))
    :cost 14
  )

  (:action schedule-s1630
    :precondition (and
      (not (meeting-scheduled))
      (available adam s1630) (available frances s1630) (available natalie s1630)
      (available patrick s1630) (available willie s1630) (available diana s1630)
    )
    :effect (and (meeting-scheduled) (scheduled s1630))
    :cost 15
  )
)