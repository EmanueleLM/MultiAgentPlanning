(define (domain meeting-scheduling)
  (:requirements :strips :negative-preconditions :equality)
  (:predicates
    (busy ?agent ?slot)             ; agent is busy at slot
    (confirmed-by ?agent ?slot)     ; agent has confirmed availability for slot
    (within-window ?slot)           ; slot is within Monday 09:00-17:00 window
    (allowed-by-helen ?slot)        ; slot is allowed by Helen's preference (not after 13:30)
    (meeting-scheduled)             ; a meeting has been scheduled
    (meeting-at ?slot)              ; meeting is scheduled at slot
  )

  ;; Margaret's confirmation action (distinct)
  (:action margaret-confirm
    :parameters (?s)
    :precondition (and
      (within-window ?s)
      (not (busy margaret ?s))
      (not (confirmed-by margaret ?s))
    )
    :effect (confirmed-by margaret ?s)
  )

  ;; Donna's confirmation action (distinct)
  (:action donna-confirm
    :parameters (?s)
    :precondition (and
      (within-window ?s)
      (not (busy donna ?s))
      (not (confirmed-by donna ?s))
    )
    :effect (confirmed-by donna ?s)
  )

  ;; Helen's confirmation action (distinct) -- respects her preference
  (:action helen-confirm
    :parameters (?s)
    :precondition (and
      (within-window ?s)
      (allowed-by-helen ?s)          ; respect Helen's "Do not meet after 13:30" preference
      (not (busy helen ?s))
      (not (confirmed-by helen ?s))
    )
    :effect (confirmed-by helen ?s)
  )

  ;; Final scheduling action -- requires all three agents to have confirmed the same slot
  (:action schedule-meeting
    :parameters (?s)
    :precondition (and
      (confirmed-by margaret ?s)
      (confirmed-by donna ?s)
      (confirmed-by helen ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)