(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types person timeslot)
  (:predicates
    (free ?p - person ?t - timeslot)
    (meeting_scheduled)
    (meeting_at ?t - timeslot)
  )
  (:functions (total-cost))

  ;; Actions to schedule the meeting at each 30-minute slot.
  ;; Slots before 14:30 carry a penalty (increase total-cost 1) to reflect Brandon's preference.
  (:action schedule-ts_0900
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_0900)
      (free jerry ts_0900)
      (free bradley ts_0900)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_0900)
      (not (free brandon ts_0900))
      (not (free jerry ts_0900))
      (not (free bradley ts_0900))
      (increase (total-cost) 1)
    )
  )

  (:action schedule-ts_0930
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_0930)
      (free jerry ts_0930)
      (free bradley ts_0930)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_0930)
      (not (free brandon ts_0930))
      (not (free jerry ts_0930))
      (not (free bradley ts_0930))
      (increase (total-cost) 1)
    )
  )

  (:action schedule-ts_1000
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_1000)
      (free jerry ts_1000)
      (free bradley ts_1000)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_1000)
      (not (free brandon ts_1000))
      (not (free jerry ts_1000))
      (not (free bradley ts_1000))
      (increase (total-cost) 1)
    )
  )

  (:action schedule-ts_1030
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_1030)
      (free jerry ts_1030)
      (free bradley ts_1030)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_1030)
      (not (free brandon ts_1030))
      (not (free jerry ts_1030))
      (not (free bradley ts_1030))
      (increase (total-cost) 1)
    )
  )

  (:action schedule-ts_1100
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_1100)
      (free jerry ts_1100)
      (free bradley ts_1100)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_1100)
      (not (free brandon ts_1100))
      (not (free jerry ts_1100))
      (not (free bradley ts_1100))
      (increase (total-cost) 1)
    )
  )

  (:action schedule-ts_1130
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_1130)
      (free jerry ts_1130)
      (free bradley ts_1130)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_1130)
      (not (free brandon ts_1130))
      (not (free jerry ts_1130))
      (not (free bradley ts_1130))
      (increase (total-cost) 1)
    )
  )

  (:action schedule-ts_1200
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_1200)
      (free jerry ts_1200)
      (free bradley ts_1200)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_1200)
      (not (free brandon ts_1200))
      (not (free jerry ts_1200))
      (not (free bradley ts_1200))
      (increase (total-cost) 1)
    )
  )

  (:action schedule-ts_1230
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_1230)
      (free jerry ts_1230)
      (free bradley ts_1230)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_1230)
      (not (free brandon ts_1230))
      (not (free jerry ts_1230))
      (not (free bradley ts_1230))
      (increase (total-cost) 1)
    )
  )

  (:action schedule-ts_1300
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_1300)
      (free jerry ts_1300)
      (free bradley ts_1300)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_1300)
      (not (free brandon ts_1300))
      (not (free jerry ts_1300))
      (not (free bradley ts_1300))
      (increase (total-cost) 1)
    )
  )

  (:action schedule-ts_1330
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_1330)
      (free jerry ts_1330)
      (free bradley ts_1330)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_1330)
      (not (free brandon ts_1330))
      (not (free jerry ts_1330))
      (not (free bradley ts_1330))
      (increase (total-cost) 1)
    )
  )

  (:action schedule-ts_1400
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_1400)
      (free jerry ts_1400)
      (free bradley ts_1400)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_1400)
      (not (free brandon ts_1400))
      (not (free jerry ts_1400))
      (not (free bradley ts_1400))
      (increase (total-cost) 1)
    )
  )

  ;; 14:30 and later are considered preferred for Brandon (no penalty).
  (:action schedule-ts_1430
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_1430)
      (free jerry ts_1430)
      (free bradley ts_1430)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_1430)
      (not (free brandon ts_1430))
      (not (free jerry ts_1430))
      (not (free bradley ts_1430))
      (increase (total-cost) 0)
    )
  )

  (:action schedule-ts_1500
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_1500)
      (free jerry ts_1500)
      (free bradley ts_1500)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_1500)
      (not (free brandon ts_1500))
      (not (free jerry ts_1500))
      (not (free bradley ts_1500))
      (increase (total-cost) 0)
    )
  )

  (:action schedule-ts_1530
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_1530)
      (free jerry ts_1530)
      (free bradley ts_1530)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_1530)
      (not (free brandon ts_1530))
      (not (free jerry ts_1530))
      (not (free bradley ts_1530))
      (increase (total-cost) 0)
    )
  )

  (:action schedule-ts_1600
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_1600)
      (free jerry ts_1600)
      (free bradley ts_1600)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_1600)
      (not (free brandon ts_1600))
      (not (free jerry ts_1600))
      (not (free bradley ts_1600))
      (increase (total-cost) 0)
    )
  )

  (:action schedule-ts_1630
    :parameters ()
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ts_1630)
      (free jerry ts_1630)
      (free bradley ts_1630)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ts_1630)
      (not (free brandon ts_1630))
      (not (free jerry ts_1630))
      (not (free bradley ts_1630))
      (increase (total-cost) 0)
    )
  )
)