(define (domain orchestrated-scheduling)
  (:requirements :strips :negative-preconditions :typing)
  (:types slot)

  (:predicates
    (next ?s - slot ?t - slot)                   ; consecutive 30-min slots
    (worktime ?s - slot)                         ; within 09:00-17:00
    (busy_billy ?s - slot)                       ; Billy's busy slots (cannot be used)
    (occupied_billy ?s - slot)                   ; Billy's slots occupied by a scheduled meeting
    (free_maria ?s - slot)                       ; Maria's free slots
    (available_william ?s - slot)                ; William's available slots
    (meeting-scheduled)                          ; global flag: meeting has been scheduled
    (scheduled-at ?s - slot)                     ; meeting start marked at slot ?s
  )

  ; Billy's scheduling action (keeps agent-specific name). Requires that all agents
  ; are available for the two consecutive slots so the meeting fits everyone's calendar.
  (:action billy-schedule-meeting
    :parameters (?s - slot ?t - slot)
    :precondition (and
      (next ?s ?t)
      (worktime ?s) (worktime ?t)
      (not (busy_billy ?s)) (not (busy_billy ?t))
      (not (occupied_billy ?s)) (not (occupied_billy ?t))
      (free_maria ?s) (free_maria ?t)
      (available_william ?s) (available_william ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
      (occupied_billy ?s) (occupied_billy ?t)
      (not (free_maria ?s)) (not (free_maria ?t))
      (not (available_william ?s)) (not (available_william ?t))
    )
  )

  ; Maria's scheduling action (keeps agent-specific name). Also requires all agents' availability.
  (:action maria-schedule-meeting
    :parameters (?s - slot ?t - slot)
    :precondition (and
      (next ?s ?t)
      (worktime ?s) (worktime ?t)
      (free_maria ?s) (free_maria ?t)
      (not (busy_billy ?s)) (not (busy_billy ?t))
      (available_william ?s) (available_william ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
      (not (free_maria ?s)) (not (free_maria ?t))
      (occupied_billy ?s) (occupied_billy ?t)
      (not (available_william ?s)) (not (available_william ?t))
    )
  )

  ; William's scheduling action (keeps agent-specific name). Also requires all agents' availability.
  (:action william-schedule-meeting
    :parameters (?s - slot ?t - slot)
    :precondition (and
      (next ?s ?t)
      (worktime ?s) (worktime ?t)
      (available_william ?s) (available_william ?t)
      (not (busy_billy ?s)) (not (busy_billy ?t))
      (free_maria ?s) (free_maria ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
      (not (available_william ?s)) (not (available_william ?t))
      (not (free_maria ?s)) (not (free_maria ?t))
      (occupied_billy ?s) (occupied_billy ?t)
    )
  )
)