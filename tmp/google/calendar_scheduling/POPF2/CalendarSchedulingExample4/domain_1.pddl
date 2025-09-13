(define (domain integrated_meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types slot time)
  
  (:predicates
      (busy ?start ?end - time)
      (available ?start ?end - time)
      (available_slot ?s - slot)
      (scheduled ?start ?end - time)
      (scheduled_slot ?s - slot)
  )
  
  ; Agent 1 Actions
  (:action check-availability
      :parameters (?start ?end - time)
      :precondition (and (available ?start ?end) (not (busy ?start ?end)))
      :effect (scheduled ?start ?end)
  )
  
  ; Agent 2 Actions
  (:action schedule-meeting-agent2
      :parameters (?s - slot)
      :precondition (available_slot ?s)
      :effect (and (scheduled_slot ?s) (not (available_slot ?s)))
  )
  
  ; Agent 3 Actions
  (:action schedule_meeting_agent3
    :parameters (?start ?end - time)
    :precondition (and (available ?start ?end) (not (scheduled ?start ?end)))
    :effect (scheduled ?start ?end)
  )
)