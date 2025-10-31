(define (domain meeting-scheduling)
  (:requirements :typing :strips :adl :negative-preconditions :fluents)
  (:types person time)

  (:constants dylan kathryn hannah anna - person
              t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
              t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time)

  (:predicates
    (next ?t1 - time ?t2 - time)
    (free ?p - person ?t - time)
    (meeting-scheduled ?t - time)
    (meeting-placed)
  )

  (:functions (total-cost))

  (:action schedule-t0900
    :parameters ()
    :precondition (and
      (next t0900 t0930)
      (free dylan t0900) (free dylan t0930)
      (free kathryn t0900) (free kathryn t0930)
      (free hannah t0900) (free hannah t0930)
      (free anna t0900) (free anna t0930)
      (not (meeting-placed))
    )
    :effect (and (meeting-scheduled t0900) (meeting-placed) (increase (total-cost) 0))
  )

  (:action schedule-t0930
    :parameters ()
    :precondition (and
      (next t0930 t1000)
      (free dylan t0930) (free dylan t1000)
      (free kathryn t0930) (free kathryn t1000)
      (free hannah t0930) (free hannah t1000)
      (free anna t0930) (free anna t1000)
      (not (meeting-placed))
    )
    :effect (and (meeting-scheduled t0930) (meeting-placed) (increase (total-cost) 1))
  )

  (:action schedule-t1000
    :parameters ()
    :precondition (and
      (next t1000 t1030)
      (free dylan t1000) (free dylan t1030)
      (free kathryn t1000) (free kathryn t1030)
      (free hannah t1000) (free hannah t1030)
      (free anna t1000) (free anna t1030)
      (not (meeting-placed))
    )
    :effect (and (meeting-scheduled t1000) (meeting-placed) (increase (total-cost) 2))
  )

  (:action schedule-t1030
    :parameters ()
    :precondition (and
      (next t1030 t1100)
      (free dylan t1030) (free dylan t1100)
      (free kathryn t1030) (free kathryn t1100)
      (free hannah t1030) (free hannah t1100)
      (free anna t1030) (free anna t1100)
      (not (meeting-placed))
    )
    :effect (and (meeting-scheduled t1030) (meeting-placed) (increase (total-cost) 3))
  )

  (:action schedule-t1100
    :parameters ()
    :precondition (and
      (next t1100 t1130)
      (free dylan t1100) (free dylan t1130)
      (free kathryn t1100) (free kathryn t1130)
      (free hannah t1100) (free hannah t1130)
      (free anna t1100) (free anna t1130)
      (not (meeting-placed))
    )
    :effect (and (meeting-scheduled t1100) (meeting-placed) (increase (total-cost) 4))
  )

  (:action schedule-t1130
    :parameters ()
    :precondition (and
      (next t1130 t1200)
      (free dylan t1130) (free dylan t1200)
      (free kathryn t1130) (free kathryn t1200)
      (free hannah t1130) (free hannah t1200)
      (free anna t1130) (free anna t1200)
      (not (meeting-placed))
    )
    :effect (and (meeting-scheduled t1130) (meeting-placed) (increase (total-cost) 5))
  )

  (:action schedule-t1200
    :parameters ()
    :precondition (and
      (next t1200 t1230)
      (free dylan t1200) (free dylan t1230)
      (free kathryn t1200) (free kathryn t1230)
      (free hannah t1200) (free hannah t1230)
      (free anna t1200) (free anna t1230)
      (not (meeting-placed))
    )
    :effect (and (meeting-scheduled t1200) (meeting-placed) (increase (total-cost) 6))
  )

  (:action schedule-t1230
    :parameters ()
    :precondition (and
      (next t1230 t1300)
      (free dylan t1230) (free dylan t1300)
      (free kathryn t1230) (free kathryn t1300)
      (free hannah t1230) (free hannah t1300)
      (free anna t1230) (free anna t1300)
      (not (meeting-placed))
    )
    :effect (and (meeting-scheduled t1230) (meeting-placed) (increase (total-cost) 7))
  )

  (:action schedule-t1300
    :parameters ()
    :precondition (and
      (next t1300 t1330)
      (free dylan t1300) (free dylan t1330)
      (free kathryn t1300) (free kathryn t1330)
      (free hannah t1300) (free hannah t1330)
      (free anna t1300) (free anna t1330)
      (not (meeting-placed))
    )
    :effect (and (meeting-scheduled t1300) (meeting-placed) (increase (total-cost) 8))
  )

  (:action schedule-t1330
    :parameters ()
    :precondition (and
      (next t1330 t1400)
      (free dylan t1330) (free dylan t1400)
      (free kathryn t1330) (free kathryn t1400)
      (free hannah t1330) (free hannah t1400)
      (free anna t1330) (free anna t1400)
      (not (meeting-placed))
    )
    :effect (and (meeting-scheduled t1330) (meeting-placed) (increase (total-cost) 9))
  )

  (:action schedule-t1400
    :parameters ()
    :precondition (and
      (next t1400 t1430)
      (free dylan t1400) (free dylan t1430)
      (free kathryn t1400) (free kathryn t1430)
      (free hannah t1400) (free hannah t1430)
      (free anna t1400) (free anna t1430)
      (not (meeting-placed))
    )
    :effect (and (meeting-scheduled t1400) (meeting-placed) (increase (total-cost) 10))
  )

  (:action schedule-t1430
    :parameters ()
    :precondition (and
      (next t1430 t1500)
      (free dylan t1430) (free dylan t1500)
      (free kathryn t1430) (free kathryn t1500)
      (free hannah t1430) (free hannah t1500)
      (free anna t1430) (free anna t1500)
      (not (meeting-placed))
    )
    :effect (and (meeting-scheduled t1430) (meeting-placed) (increase (total-cost) 11))
  )

  (:action schedule-t1500
    :parameters ()
    :precondition (and
      (next t1500 t1530)
      (free dylan t1500) (free dylan t1530)
      (free kathryn t1500) (free kathryn t1530)
      (free hannah t1500) (free hannah t1530)
      (free anna t1500) (free anna t1530)
      (not (meeting-placed))
    )
    :effect (and (meeting-scheduled t1500) (meeting-placed) (increase (total-cost) 12))
  )

  (:action schedule-t1530
    :parameters ()
    :precondition (and
      (next t1530 t1600)
      (free dylan t1530) (free dylan t1600)
      (free kathryn t1530) (free kathryn t1600)
      (free hannah t1530) (free hannah t1600)
      (free anna t1530) (free anna t1600)
      (not (meeting-placed))
    )
    :effect (and (meeting-scheduled t1530) (meeting-placed) (increase (total-cost) 13))
  )

  (:action schedule-t1600
    :parameters ()
    :precondition (and
      (next t1600 t1630)
      (free dylan t1600) (free dylan t1630)
      (free kathryn t1600) (free kathryn t1630)
      (free hannah t1600) (free hannah t1630)
      (free anna t1600) (free anna t1630)
      (not (meeting-placed))
    )
    :effect (and (meeting-scheduled t1600) (meeting-placed) (increase (total-cost) 14))
  )
)