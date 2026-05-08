(define (domain meeting-scheduling)
  ; Solver target: FastDownwards
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (succ ?s1 - slot ?s2 - slot)            ; temporal contiguity between discrete 30-min slots
    (free ?p - participant ?s - slot)       ; participant is free at this slot
    (within-workday ?s - slot)              ; slot lies within Monday 09:00-17:00 window
    (before-1330 ?s - slot)                 ; slot ends no later than 13:30 (enforces Daniel's preference)
    (meeting-scheduled)                     ; global flag: meeting has been scheduled
    (scheduled-at ?s - slot)                ; meeting is scheduled at this slot
  )

  ; Schedule a single 30-minute meeting by selecting one discrete slot.
  ; Preconditions:
  ;  - chosen slot exists and is within the business window
  ;  - all three distinct participants are free at that slot
  ;  - Daniel's preference is enforced by requiring (before-1330 ?s)
  ;  - meeting not already scheduled
  ; Effects:
  ;  - set meeting scheduled and record the slot
  ;  - mark the participants as no longer free at that slot
  (:action schedule-meeting
    :parameters (?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (slot ?s)
      (participant ?p1) (participant ?p2) (participant ?p3)
      (free ?p1 ?s) (free ?p2 ?s) (free ?p3 ?s)
      (within-workday ?s)
      (before-1330 ?s)
      (not (meeting-scheduled))
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p2 ?p3))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
      (not (free ?p1 ?s)) (not (free ?p2 ?s)) (not (free ?p3 ?s))
    )
  )
)