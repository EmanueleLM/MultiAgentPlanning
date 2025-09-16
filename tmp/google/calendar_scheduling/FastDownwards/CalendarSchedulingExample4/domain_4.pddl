(define (domain multi_agent_meeting_scheduler)
  (:requirements :typing)
  (:types
     person slot
  )
  (:constants
     donna john billy - person
  )
  (:predicates
     (free ?p - person ?t - slot)
     (available ?p - person ?t - slot)
     (slot-available ?t - slot)
     (meeting-scheduled ?t - slot)
  )

  (:action donna_schedule_meeting
     :parameters (?a - person ?b - person ?c - person ?t - slot)
     :precondition (and (free ?a ?t)
                        (free ?b ?t)
                        (free ?c ?t)
                        (not (meeting-scheduled ?t)))
     :effect (and (not (free ?a ?t))
                  (not (free ?b ?t))
                  (not (free ?c ?t))
                  (meeting-scheduled ?t))
  )

  (:action john_schedule_meeting
     :parameters (?t - slot)
     :precondition (and (available john ?t)
                        (not (meeting-scheduled ?t)))
     :effect (meeting-scheduled ?t)
  )

  (:action billy_schedule_meeting
     :parameters (?t - slot)
     :precondition (and (slot-available ?t)
                        (not (meeting-scheduled ?t)))
     :effect (and (not (slot-available ?t))
                  (meeting-scheduled ?t))
  )
)