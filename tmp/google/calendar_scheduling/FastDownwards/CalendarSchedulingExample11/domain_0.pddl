(define (domain scheduling-merge)
  (:requirements :typing :durative-actions)
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

  ;; Agent A: durative action (30 minutes) requiring all three to be free in the slot
  (:durative-action schedule-meeting
     :parameters (?slot - slot ?p1 - person ?p2 - person ?p3 - person)
     :duration 30
     :condition (and
       (over all (free ?p1 ?slot))
       (over all (free ?p2 ?slot))
       (over all (free ?p3 ?slot)))
     :effect (and
       (at end (not (free ?p1 ?slot)))
       (at end (not (free ?p2 ?slot)))
       (at end (not (free ?p3 ?slot)))
       (at end (meeting-at ?slot))
     )
  )

  ;; Agent B: STRIPS-like action requiring all three to be free for a given slot
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

  ;; Agent C: two specific-slot actions using "available" predicate
  (:action schedule_meeting_at_1430
     :parameters (?m - meeting)
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
     :parameters (?m - meeting)
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