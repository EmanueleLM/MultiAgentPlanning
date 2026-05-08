(define (domain scheduling)
  (:requirements :typing :negative-preconditions :strips)
  (:types person timeslot)

  (:predicates
    (free ?p - person ?s - timeslot)            ; participant ?p is free at slot ?s
    (slot-occupied ?s - timeslot)               ; slot ?s has been occupied by a scheduled meeting
    (meeting-not-scheduled)                     ; marker: no meeting scheduled yet
    (meeting-scheduled)                         ; marker: meeting has been scheduled
    (meeting-at ?s - timeslot)                  ; meeting occurs at slot ?s
    (attending ?p - person ?s - timeslot)       ; participant ?p will attend at slot ?s
    (next ?s1 - timeslot ?s2 - timeslot)        ; successor relation between timeslots
  )

  ; Three distinct agent-initiated scheduling actions.
  ; Any one of the participants may execute the scheduling action,
  ; but each action requires that all participants be free at the chosen slot,
  ; that no meeting is scheduled yet, and that the slot is not already occupied.
  ; Effects set the meeting as scheduled, record the slot, mark attendance for ALL participants,
  ; and occupy the slot (so no later scheduling can override it).

  (:action schedule-by-alexander
    :parameters (?s - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (free alexander ?s)
      (free elizabeth ?s)
      (free walter ?s)
      (not (slot-occupied ?s))
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled)
      (meeting-at ?s)
      (attending alexander ?s)
      (attending elizabeth ?s)
      (attending walter ?s)
      (slot-occupied ?s)
    )
  )

  (:action schedule-by-elizabeth
    :parameters (?s - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (free alexander ?s)
      (free elizabeth ?s)
      (free walter ?s)
      (not (slot-occupied ?s))
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled)
      (meeting-at ?s)
      (attending alexander ?s)
      (attending elizabeth ?s)
      (attending walter ?s)
      (slot-occupied ?s)
    )
  )

  (:action schedule-by-walter
    :parameters (?s - timeslot)
    :precondition (and
      (meeting-not-scheduled)
      (free alexander ?s)
      (free elizabeth ?s)
      (free walter ?s)
      (not (slot-occupied ?s))
    )
    :effect (and
      (not (meeting-not-scheduled))
      (meeting-scheduled)
      (meeting-at ?s)
      (attending alexander ?s)
      (attending elizabeth ?s)
      (attending walter ?s)
      (slot-occupied ?s)
    )
  )
)