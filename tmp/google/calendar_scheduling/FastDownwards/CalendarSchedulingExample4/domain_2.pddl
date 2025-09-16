(define (domain multi_agent_meeting_scheduler)
  (:requirements :typing)
  (:types
     person slot
  )
  (:constants
     alice bob carol john - person
  )
  (:predicates
     (free ?p - person ?t - slot)
     (available ?p - person ?t - slot)
     (slot-available ?t - slot)
     (meeting-scheduled ?t - slot)
  )

  ;; Agent 1 (Donna-like) schedules a meeting for three people in one free slot
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

  ;; Agent 2 (John-like) schedules a meeting in a slot John can attend
  (:action john_schedule_meeting
     :parameters (?t - slot)
     :precondition (and (available john ?t)
                        (not (meeting-scheduled ?t)))
     :effect (meeting-scheduled ?t)
  )

  ;; Agent 3 (Third agent) schedules a meeting in a slot the third agent considers available
  (:action third_schedule_meeting
     :parameters (?t - slot)
     :precondition (and (slot-available ?t)
                        (not (meeting-scheduled ?t)))
     :effect (and (not (slot-available ?t))
                  (meeting-scheduled ?t))
  )
)