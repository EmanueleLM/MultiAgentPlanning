(define (domain meeting-scheduling)
  (:requirements :typing :strips :equality :action-costs)
  (:types participant slot)

  (:predicates
    (is-participant ?p - participant)
    (is-slot ?s - slot)
    (free ?p - participant ?s - slot)
    (meeting-started ?s - slot)
    (attends ?p - participant ?s - slot)
  )

  (:functions (total-cost))

  (:action start-meeting-s0900
    :parameters ()
    :precondition (is-slot s0900)
    :effect (and (meeting-started s0900) (increase (total-cost) 1))
  )
  (:action start-meeting-s0930
    :parameters ()
    :precondition (is-slot s0930)
    :effect (and (meeting-started s0930) (increase (total-cost) 2))
  )
  (:action start-meeting-s1000
    :parameters ()
    :precondition (is-slot s1000)
    :effect (and (meeting-started s1000) (increase (total-cost) 3))
  )
  (:action start-meeting-s1030
    :parameters ()
    :precondition (is-slot s1030)
    :effect (and (meeting-started s1030) (increase (total-cost) 4))
  )
  (:action start-meeting-s1100
    :parameters ()
    :precondition (is-slot s1100)
    :effect (and (meeting-started s1100) (increase (total-cost) 5))
  )
  (:action start-meeting-s1130
    :parameters ()
    :precondition (is-slot s1130)
    :effect (and (meeting-started s1130) (increase (total-cost) 6))
  )
  (:action start-meeting-s1200
    :parameters ()
    :precondition (is-slot s1200)
    :effect (and (meeting-started s1200) (increase (total-cost) 7))
  )
  (:action start-meeting-s1230
    :parameters ()
    :precondition (is-slot s1230)
    :effect (and (meeting-started s1230) (increase (total-cost) 8))
  )
  (:action start-meeting-s1300
    :parameters ()
    :precondition (is-slot s1300)
    :effect (and (meeting-started s1300) (increase (total-cost) 9))
  )
  (:action start-meeting-s1330
    :parameters ()
    :precondition (is-slot s1330)
    :effect (and (meeting-started s1330) (increase (total-cost) 10))
  )
  (:action start-meeting-s1400
    :parameters ()
    :precondition (is-slot s1400)
    :effect (and (meeting-started s1400) (increase (total-cost) 11))
  )
  (:action start-meeting-s1430
    :parameters ()
    :precondition (is-slot s1430)
    :effect (and (meeting-started s1430) (increase (total-cost) 12))
  )
  (:action start-meeting-s1500
    :parameters ()
    :precondition (is-slot s1500)
    :effect (and (meeting-started s1500) (increase (total-cost) 13))
  )
  (:action start-meeting-s1530
    :parameters ()
    :precondition (is-slot s1530)
    :effect (and (meeting-started s1530) (increase (total-cost) 14))
  )
  (:action start-meeting-s1600
    :parameters ()
    :precondition (is-slot s1600)
    :effect (and (meeting-started s1600) (increase (total-cost) 15))
  )
  (:action start-meeting-s1630
    :parameters ()
    :precondition (is-slot s1630)
    :effect (and (meeting-started s1630) (increase (total-cost) 16))
  )

  (:action attend
    :parameters (?p - participant ?s - slot)
    :precondition (and (is-participant ?p) (is-slot ?s) (free ?p ?s) (meeting-started ?s))
    :effect (and (attends ?p ?s))
  )
)