(define (domain meeting-scheduling)
  (:requirements :typing :adl :action-costs :negative-preconditions :equality)
  (:types participant slot meeting)
  (:constants
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430 slot-1500 slot-1530 slot-1600 slot-1630 - slot
  )
  (:predicates
    (free ?p - participant ?s - slot)
    (assigned ?m - meeting)
    (scheduled ?m - meeting ?s - slot)
  )
  (:functions (total-cost))

  (:action schedule-0900
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-0900) (free ?p2 slot-0900) (free ?p3 slot-0900) (free ?p4 slot-0900) (free ?p5 slot-0900)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-0900)
      (not (free ?p1 slot-0900)) (not (free ?p2 slot-0900)) (not (free ?p3 slot-0900)) (not (free ?p4 slot-0900)) (not (free ?p5 slot-0900))
      (increase (total-cost) 1)
    )
    :cost 1
  )

  (:action schedule-0930
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-0930) (free ?p2 slot-0930) (free ?p3 slot-0930) (free ?p4 slot-0930) (free ?p5 slot-0930)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-0930)
      (not (free ?p1 slot-0930)) (not (free ?p2 slot-0930)) (not (free ?p3 slot-0930)) (not (free ?p4 slot-0930)) (not (free ?p5 slot-0930))
      (increase (total-cost) 2)
    )
    :cost 2
  )

  (:action schedule-1000
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-1000) (free ?p2 slot-1000) (free ?p3 slot-1000) (free ?p4 slot-1000) (free ?p5 slot-1000)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1000)
      (not (free ?p1 slot-1000)) (not (free ?p2 slot-1000)) (not (free ?p3 slot-1000)) (not (free ?p4 slot-1000)) (not (free ?p5 slot-1000))
      (increase (total-cost) 3)
    )
    :cost 3
  )

  (:action schedule-1030
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-1030) (free ?p2 slot-1030) (free ?p3 slot-1030) (free ?p4 slot-1030) (free ?p5 slot-1030)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1030)
      (not (free ?p1 slot-1030)) (not (free ?p2 slot-1030)) (not (free ?p3 slot-1030)) (not (free ?p4 slot-1030)) (not (free ?p5 slot-1030))
      (increase (total-cost) 4)
    )
    :cost 4
  )

  (:action schedule-1100
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-1100) (free ?p2 slot-1100) (free ?p3 slot-1100) (free ?p4 slot-1100) (free ?p5 slot-1100)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1100)
      (not (free ?p1 slot-1100)) (not (free ?p2 slot-1100)) (not (free ?p3 slot-1100)) (not (free ?p4 slot-1100)) (not (free ?p5 slot-1100))
      (increase (total-cost) 5)
    )
    :cost 5
  )

  (:action schedule-1130
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-1130) (free ?p2 slot-1130) (free ?p3 slot-1130) (free ?p4 slot-1130) (free ?p5 slot-1130)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1130)
      (not (free ?p1 slot-1130)) (not (free ?p2 slot-1130)) (not (free ?p3 slot-1130)) (not (free ?p4 slot-1130)) (not (free ?p5 slot-1130))
      (increase (total-cost) 6)
    )
    :cost 6
  )

  (:action schedule-1200
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-1200) (free ?p2 slot-1200) (free ?p3 slot-1200) (free ?p4 slot-1200) (free ?p5 slot-1200)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1200)
      (not (free ?p1 slot-1200)) (not (free ?p2 slot-1200)) (not (free ?p3 slot-1200)) (not (free ?p4 slot-1200)) (not (free ?p5 slot-1200))
      (increase (total-cost) 7)
    )
    :cost 7
  )

  (:action schedule-1230
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-1230) (free ?p2 slot-1230) (free ?p3 slot-1230) (free ?p4 slot-1230) (free ?p5 slot-1230)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1230)
      (not (free ?p1 slot-1230)) (not (free ?p2 slot-1230)) (not (free ?p3 slot-1230)) (not (free ?p4 slot-1230)) (not (free ?p5 slot-1230))
      (increase (total-cost) 8)
    )
    :cost 8
  )

  (:action schedule-1300
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-1300) (free ?p2 slot-1300) (free ?p3 slot-1300) (free ?p4 slot-1300) (free ?p5 slot-1300)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1300)
      (not (free ?p1 slot-1300)) (not (free ?p2 slot-1300)) (not (free ?p3 slot-1300)) (not (free ?p4 slot-1300)) (not (free ?p5 slot-1300))
      (increase (total-cost) 9)
    )
    :cost 9
  )

  (:action schedule-1330
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-1330) (free ?p2 slot-1330) (free ?p3 slot-1330) (free ?p4 slot-1330) (free ?p5 slot-1330)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1330)
      (not (free ?p1 slot-1330)) (not (free ?p2 slot-1330)) (not (free ?p3 slot-1330)) (not (free ?p4 slot-1330)) (not (free ?p5 slot-1330))
      (increase (total-cost) 10)
    )
    :cost 10
  )

  (:action schedule-1400
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-1400) (free ?p2 slot-1400) (free ?p3 slot-1400) (free ?p4 slot-1400) (free ?p5 slot-1400)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1400)
      (not (free ?p1 slot-1400)) (not (free ?p2 slot-1400)) (not (free ?p3 slot-1400)) (not (free ?p4 slot-1400)) (not (free ?p5 slot-1400))
      (increase (total-cost) 11)
    )
    :cost 11
  )

  (:action schedule-1430
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-1430) (free ?p2 slot-1430) (free ?p3 slot-1430) (free ?p4 slot-1430) (free ?p5 slot-1430)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1430)
      (not (free ?p1 slot-1430)) (not (free ?p2 slot-1430)) (not (free ?p3 slot-1430)) (not (free ?p4 slot-1430)) (not (free ?p5 slot-1430))
      (increase (total-cost) 12)
    )
    :cost 12
  )

  (:action schedule-1500
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-1500) (free ?p2 slot-1500) (free ?p3 slot-1500) (free ?p4 slot-1500) (free ?p5 slot-1500)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1500)
      (not (free ?p1 slot-1500)) (not (free ?p2 slot-1500)) (not (free ?p3 slot-1500)) (not (free ?p4 slot-1500)) (not (free ?p5 slot-1500))
      (increase (total-cost) 13)
    )
    :cost 13
  )

  (:action schedule-1530
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-1530) (free ?p2 slot-1530) (free ?p3 slot-1530) (free ?p4 slot-1530) (free ?p5 slot-1530)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1530)
      (not (free ?p1 slot-1530)) (not (free ?p2 slot-1530)) (not (free ?p3 slot-1530)) (not (free ?p4 slot-1530)) (not (free ?p5 slot-1530))
      (increase (total-cost) 14)
    )
    :cost 14
  )

  (:action schedule-1600
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-1600) (free ?p2 slot-1600) (free ?p3 slot-1600) (free ?p4 slot-1600) (free ?p5 slot-1600)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1600)
      (not (free ?p1 slot-1600)) (not (free ?p2 slot-1600)) (not (free ?p3 slot-1600)) (not (free ?p4 slot-1600)) (not (free ?p5 slot-1600))
      (increase (total-cost) 15)
    )
    :cost 15
  )

  (:action schedule-1630
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (assigned ?m))
      (free ?p1 slot-1630) (free ?p2 slot-1630) (free ?p3 slot-1630) (free ?p4 slot-1630) (free ?p5 slot-1630)
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p1 ?p4)) (not (= ?p1 ?p5))
      (not (= ?p2 ?p3)) (not (= ?p2 ?p4)) (not (= ?p2 ?p5))
      (not (= ?p3 ?p4)) (not (= ?p3 ?p5))
      (not (= ?p4 ?p5))
    )
    :effect (and
      (assigned ?m)
      (scheduled ?m slot-1630)
      (not (free ?p1 slot-1630)) (not (free ?p2 slot-1630)) (not (free ?p3 slot-1630)) (not (free ?p4 slot-1630)) (not (free ?p5 slot-1630))
      (increase (total-cost) 16)
    )
    :cost 16
  )
)