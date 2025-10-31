(define (domain meeting-scheduling)
  (:requirements :typing :fluents :action-costs :strips :equality)
  (:types participant slot)

  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (free ?p - participant ?s - slot)
    (meeting-started ?s - slot)
    (attends ?p - participant ?s - slot)
  )

  (:functions (total-cost))

  (:action start-meeting-s0900
    :precondition (slot s0900)
    :effect (and (meeting-started s0900) (increase (total-cost) 1))
  )
  (:action start-meeting-s0930
    :precondition (slot s0930)
    :effect (and (meeting-started s0930) (increase (total-cost) 2))
  )
  (:action start-meeting-s1000
    :precondition (slot s1000)
    :effect (and (meeting-started s1000) (increase (total-cost) 3))
  )
  (:action start-meeting-s1030
    :precondition (slot s1030)
    :effect (and (meeting-started s1030) (increase (total-cost) 4))
  )
  (:action start-meeting-s1100
    :precondition (slot s1100)
    :effect (and (meeting-started s1100) (increase (total-cost) 5))
  )
  (:action start-meeting-s1130
    :precondition (slot s1130)
    :effect (and (meeting-started s1130) (increase (total-cost) 6))
  )
  (:action start-meeting-s1200
    :precondition (slot s1200)
    :effect (and (meeting-started s1200) (increase (total-cost) 7))
  )
  (:action start-meeting-s1230
    :precondition (slot s1230)
    :effect (and (meeting-started s1230) (increase (total-cost) 8))
  )
  (:action start-meeting-s1300
    :precondition (slot s1300)
    :effect (and (meeting-started s1300) (increase (total-cost) 9))
  )
  (:action start-meeting-s1330
    :precondition (slot s1330)
    :effect (and (meeting-started s1330) (increase (total-cost) 10))
  )
  (:action start-meeting-s1400
    :precondition (slot s1400)
    :effect (and (meeting-started s1400) (increase (total-cost) 11))
  )
  (:action start-meeting-s1430
    :precondition (slot s1430)
    :effect (and (meeting-started s1430) (increase (total-cost) 12))
  )
  (:action start-meeting-s1500
    :precondition (slot s1500)
    :effect (and (meeting-started s1500) (increase (total-cost) 13))
  )
  (:action start-meeting-s1530
    :precondition (slot s1530)
    :effect (and (meeting-started s1530) (increase (total-cost) 14))
  )
  (:action start-meeting-s1600
    :precondition (slot s1600)
    :effect (and (meeting-started s1600) (increase (total-cost) 15))
  )
  (:action start-meeting-s1630
    :precondition (slot s1630)
    :effect (and (meeting-started s1630) (increase (total-cost) 16))
  )

  (:action attend
    :parameters (?p - participant ?s - slot)
    :precondition (and (participant ?p) (slot ?s) (free ?p ?s) (meeting-started ?s))
    :effect (attends ?p ?s)
  )
)