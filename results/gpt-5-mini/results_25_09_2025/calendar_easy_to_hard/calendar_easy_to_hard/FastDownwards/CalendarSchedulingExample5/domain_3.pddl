(define (domain meeting-scheduling)
  (:requirements :strips :typing :fluents :action-costs)
  (:types agent slot)
  (:constants
    kathryn charlotte lauren - agent
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - slot
  )
  (:predicates
    (agent ?a - agent)
    (slot ?s - slot)
    (available ?a - agent ?s - slot)
    (agreed ?a - agent ?s - slot)
    (meeting-scheduled)
  )
  (:functions (total-cost))
  (:action agree-kathryn
    :parameters (?s - slot)
    :precondition (available kathryn ?s)
    :effect (and (agreed kathryn ?s) (increase (total-cost) 0))
  )
  (:action agree-charlotte
    :parameters (?s - slot)
    :precondition (available charlotte ?s)
    :effect (and (agreed charlotte ?s) (increase (total-cost) 0))
  )
  (:action agree-lauren
    :parameters (?s - slot)
    :precondition (available lauren ?s)
    :effect (and (agreed lauren ?s) (increase (total-cost) 0))
  )
  (:action schedule-meeting-t1
    :precondition (and (agreed kathryn t1) (agreed charlotte t1) (agreed lauren t1))
    :effect (and (meeting-scheduled) (increase (total-cost) 1))
  )
  (:action schedule-meeting-t2
    :precondition (and (agreed kathryn t2) (agreed charlotte t2) (agreed lauren t2))
    :effect (and (meeting-scheduled) (increase (total-cost) 2))
  )
  (:action schedule-meeting-t3
    :precondition (and (agreed kathryn t3) (agreed charlotte t3) (agreed lauren t3))
    :effect (and (meeting-scheduled) (increase (total-cost) 3))
  )
  (:action schedule-meeting-t4
    :precondition (and (agreed kathryn t4) (agreed charlotte t4) (agreed lauren t4))
    :effect (and (meeting-scheduled) (increase (total-cost) 4))
  )
  (:action schedule-meeting-t5
    :precondition (and (agreed kathryn t5) (agreed charlotte t5) (agreed lauren t5))
    :effect (and (meeting-scheduled) (increase (total-cost) 5))
  )
  (:action schedule-meeting-t6
    :precondition (and (agreed kathryn t6) (agreed charlotte t6) (agreed lauren t6))
    :effect (and (meeting-scheduled) (increase (total-cost) 6))
  )
  (:action schedule-meeting-t7
    :precondition (and (agreed kathryn t7) (agreed charlotte t7) (agreed lauren t7))
    :effect (and (meeting-scheduled) (increase (total-cost) 7))
  )
  (:action schedule-meeting-t8
    :precondition (and (agreed kathryn t8) (agreed charlotte t8) (agreed lauren t8))
    :effect (and (meeting-scheduled) (increase (total-cost) 8))
  )
  (:action schedule-meeting-t9
    :precondition (and (agreed kathryn t9) (agreed charlotte t9) (agreed lauren t9))
    :effect (and (meeting-scheduled) (increase (total-cost) 9))
  )
  (:action schedule-meeting-t10
    :precondition (and (agreed kathryn t10) (agreed charlotte t10) (agreed lauren t10))
    :effect (and (meeting-scheduled) (increase (total-cost) 10))
  )
  (:action schedule-meeting-t11
    :precondition (and (agreed kathryn t11) (agreed charlotte t11) (agreed lauren t11))
    :effect (and (meeting-scheduled) (increase (total-cost) 11))
  )
  (:action schedule-meeting-t12
    :precondition (and (agreed kathryn t12) (agreed charlotte t12) (agreed lauren t12))
    :effect (and (meeting-scheduled) (increase (total-cost) 12))
  )
  (:action schedule-meeting-t13
    :precondition (and (agreed kathryn t13) (agreed charlotte t13) (agreed lauren t13))
    :effect (and (meeting-scheduled) (increase (total-cost) 13))
  )
  (:action schedule-meeting-t14
    :precondition (and (agreed kathryn t14) (agreed charlotte t14) (agreed lauren t14))
    :effect (and (meeting-scheduled) (increase (total-cost) 14))
  )
  (:action schedule-meeting-t15
    :precondition (and (agreed kathryn t15) (agreed charlotte t15) (agreed lauren t15))
    :effect (and (meeting-scheduled) (increase (total-cost) 15))
  )
  (:action schedule-meeting-t16
    :precondition (and (agreed kathryn t16) (agreed charlotte t16) (agreed lauren t16))
    :effect (and (meeting-scheduled) (increase (total-cost) 16))
  )
)