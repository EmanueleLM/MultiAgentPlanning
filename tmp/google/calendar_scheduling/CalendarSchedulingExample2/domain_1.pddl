(define (domain integrated-scheduling)

  (:requirements :strips :typing)

  (:types time-slot slot)

  (:predicates
    (time-slot ?t - time-slot) 
    (blocked ?t - time-slot) 
    (free ?t - time-slot)    
    (meeting-scheduled ?hour ?min - slot)
    (available ?hour ?min - slot)     
    (preferred ?t - time-slot)         
    (scheduled ?t - time-slot)
  )

  ;; Actions for Agent 1 (Roy)
  (:action block-time-slot
    :parameters (?t - time-slot)
    :precondition (and (time-slot ?t) (free ?t))
    :effect (and (blocked ?t) (not (free ?t)))
  )

  (:action free-time-slot
    :parameters (?t - time-slot)
    :precondition (and (time-slot ?t) (blocked ?t))
    :effect (and (free ?t) (not (blocked ?t)))
  )

  ;; Action for Agent 2 (Kathryn)
  (:action schedule-meeting
    :parameters (?hour ?min - slot)
    :precondition (and (available ?hour ?min))
    :effect (meeting-scheduled ?hour ?min)
  )

  ;; Actions for Agent 3 (Amy)
  (:action check-availability
    :parameters (?t - time-slot)
    :precondition (and (time-slot ?t) (available ts14_30_15_00))
    :effect (scheduled ?t)
  )

  (:action check-preference
    :parameters (?t - time-slot)
    :precondition (preferred ?t)
    :effect (available ts14_30_15_00))
)