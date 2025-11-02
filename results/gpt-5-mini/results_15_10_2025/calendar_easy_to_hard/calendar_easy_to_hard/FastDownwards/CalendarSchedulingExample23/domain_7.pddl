(define (domain meeting-scheduling)
  (:requirements :typing :adl :action-costs :negative-preconditions :equality)
  (:types participant slot meeting)
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
    )
    :cost 16
  )
)