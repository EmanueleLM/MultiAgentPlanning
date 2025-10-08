(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person slot)
  (:constants kathryn charlotte lauren - person
              s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot)
  (:predicates
    (available ?p - person ?s - slot)
    (meeting-scheduled)
  )
  (:functions (total-cost))

  (:action schedule-s0900
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s0900)
                       (available charlotte s0900)
                       (available lauren s0900))
    :effect (and (meeting-scheduled) (increase (total-cost) 0))
  )

  (:action schedule-s0930
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s0930)
                       (available charlotte s0930)
                       (available lauren s0930))
    :effect (and (meeting-scheduled) (increase (total-cost) 1))
  )

  (:action schedule-s1000
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s1000)
                       (available charlotte s1000)
                       (available lauren s1000))
    :effect (and (meeting-scheduled) (increase (total-cost) 2))
  )

  (:action schedule-s1030
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s1030)
                       (available charlotte s1030)
                       (available lauren s1030))
    :effect (and (meeting-scheduled) (increase (total-cost) 3))
  )

  (:action schedule-s1100
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s1100)
                       (available charlotte s1100)
                       (available lauren s1100))
    :effect (and (meeting-scheduled) (increase (total-cost) 4))
  )

  (:action schedule-s1130
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s1130)
                       (available charlotte s1130)
                       (available lauren s1130))
    :effect (and (meeting-scheduled) (increase (total-cost) 5))
  )

  (:action schedule-s1200
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s1200)
                       (available charlotte s1200)
                       (available lauren s1200))
    :effect (and (meeting-scheduled) (increase (total-cost) 6))
  )

  (:action schedule-s1230
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s1230)
                       (available charlotte s1230)
                       (available lauren s1230))
    :effect (and (meeting-scheduled) (increase (total-cost) 7))
  )

  (:action schedule-s1300
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s1300)
                       (available charlotte s1300)
                       (available lauren s1300))
    :effect (and (meeting-scheduled) (increase (total-cost) 8))
  )

  (:action schedule-s1330
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s1330)
                       (available charlotte s1330)
                       (available lauren s1330))
    :effect (and (meeting-scheduled) (increase (total-cost) 9))
  )

  (:action schedule-s1400
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s1400)
                       (available charlotte s1400)
                       (available lauren s1400))
    :effect (and (meeting-scheduled) (increase (total-cost) 10))
  )

  (:action schedule-s1430
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s1430)
                       (available charlotte s1430)
                       (available lauren s1430))
    :effect (and (meeting-scheduled) (increase (total-cost) 11))
  )

  (:action schedule-s1500
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s1500)
                       (available charlotte s1500)
                       (available lauren s1500))
    :effect (and (meeting-scheduled) (increase (total-cost) 12))
  )

  (:action schedule-s1530
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s1530)
                       (available charlotte s1530)
                       (available lauren s1530))
    :effect (and (meeting-scheduled) (increase (total-cost) 13))
  )

  (:action schedule-s1600
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s1600)
                       (available charlotte s1600)
                       (available lauren s1600))
    :effect (and (meeting-scheduled) (increase (total-cost) 14))
  )

  (:action schedule-s1630
    :parameters ()
    :precondition (and (not (meeting-scheduled))
                       (available kathryn s1630)
                       (available charlotte s1630)
                       (available lauren s1630))
    :effect (and (meeting-scheduled) (increase (total-cost) 15))
  )
)