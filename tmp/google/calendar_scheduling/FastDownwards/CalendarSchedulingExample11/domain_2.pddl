(define (domain scheduling-merge)
  (:requirements :typing)
  (:types person slot meeting)

  (:constants
     Alexander Elizabeth Walter - person
     slot-0900-0930 slot-0930-1000 slot-1000-1030 slot-1030-1100
     slot-1100-1130 slot-1130-1200 slot-1200-1230 slot-1230-1300
     slot-1300-1330 slot-1330-1400 slot-1400-1430 slot-1430-1500
     slot-1500-1530 slot-1530-1600 slot-1600-1630 slot-1630-1700 - slot
     M1 - meeting
  )

  (:predicates
     (free ?p - person ?t - slot)
     (meeting-at ?t - slot)
     (available ?p - person ?t - slot)
  )

  (:action schedule-meeting
     :parameters (?t - slot)
     :precondition (and (free Alexander ?t)
                        (free Elizabeth ?t)
                        (free Walter ?t))
     :effect (and (meeting-at ?t)
                  (not (free Alexander ?t))
                  (not (free Elizabeth ?t))
                  (not (free Walter ?t)))
  )

  (:action schedule_meeting_at_1430
     :parameters ()
     :precondition (and
       (available Alexander slot-1430-1500)
       (available Elizabeth slot-1430-1500)
       (available Walter slot-1430-1500))
     :effect (and
       (not (available Alexander slot-1430-1500))
       (not (available Elizabeth slot-1430-1500))
       (not (available Walter slot-1430-1500))
       (meeting-at slot-1430-1500))
  )

  (:action schedule_meeting_at_1500
     :parameters ()
     :precondition (and
       (available Alexander slot-1500-1530)
       (available Elizabeth slot-1500-1530)
       (available Walter slot-1500-1530))
     :effect (and
       (not (available Alexander slot-1500-1530))
       (not (available Elizabeth slot-1500-1530))
       (not (available Walter slot-1500-1530))
       (meeting-at slot-1500-1530))
  )
)