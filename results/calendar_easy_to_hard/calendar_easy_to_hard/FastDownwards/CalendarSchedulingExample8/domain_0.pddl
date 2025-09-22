(define (domain integrated-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot day)

  (:predicates
    (day ?d - day)
    (slot ?s - slot)               ; slot start times (30-min)
    (work-slot ?s - slot)          ; within 09:00-17:00
    (free ?p - person ?s - slot)   ; person is free at slot
    (busy ?p - person ?s - slot)   ; person is busy at slot
    (meeting-scheduled)            ; flag: a meeting has been scheduled
    (meeting-at ?s - slot)         ; meeting scheduled at this slot
    (attending ?p - person ?d - day ?s - slot) ; attendance record that includes day
  )

  ; Agent 1's scheduling action (keeps agent1 semantics distinct)
  ; Preconditions (from agent1): day exists, slot is a work-slot, Adam free at that slot
  ; Effects: record meeting-at, meeting-scheduled, attending facts for all three,
  ;          and mark Adam not free (agent1 had knowledge only of Adam's availability).
  (:action schedule-meeting-agent1
    :parameters (?d - day ?s - slot)
    :precondition (and (day ?d) (work-slot ?s) (free adam ?s))
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (attending adam ?d ?s)
      (attending jerry ?d ?s)
      (attending matthew ?d ?s)
      (not (free adam ?s))
    )
  )

  ; Agent 2's scheduling action (keeps agent2 semantics distinct)
  ; Preconditions (from agent2): the chosen slot is a known slot, the three persons are not busy,
  ;                              and no meeting has already been scheduled.
  ; Effects: set meeting-scheduled and meeting-at, and mark all three busy at that slot.
  (:action schedule-meeting-agent2
    :parameters (?s - slot ?a - person ?j - person ?m - person)
    :precondition (and
      (slot ?s)
      (not (busy ?a ?s))
      (not (busy ?j ?s))
      (not (busy ?m ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (busy ?a ?s)
      (busy ?j ?s)
      (busy ?m ?s)
    )
  )

  ; Agent 3's scheduling action (keeps agent3 semantics distinct)
  ; Preconditions (from agent3): no meeting scheduled yet, and all three explicitly free at the slot.
  ; Effects: schedule meeting-at that slot and remove free facts for the three attendees.
  (:action schedule-meeting-agent3
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (free adam ?s)
      (free jerry ?s)
      (free matthew ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (not (free adam ?s))
      (not (free jerry ?s))
      (not (free matthew ?s))
    )
  )

)