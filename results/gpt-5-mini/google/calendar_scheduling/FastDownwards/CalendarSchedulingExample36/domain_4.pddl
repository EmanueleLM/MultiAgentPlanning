(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person meeting timeslot)

  ;; Declare the specific participants as domain constants so actions can
  ;; require those exact people (model is specific to this instance).
  (:constants ryan ruth denise - person)

  (:predicates
    (next ?s ?t - timeslot)            ; successor 30-minute slot
    (free ?p - person ?s - timeslot)   ; person p is free at timeslot s
    (allowed_start ?s - timeslot)      ; meeting may start at s (meeting must finish by 12:30)
    (scheduled ?m - meeting)           ; meeting m has been scheduled
    (meeting_at ?m - meeting ?s - timeslot) ; meeting m starts at timeslot s
  )

  ;; Schedule the meeting for the three required participants (ryan, ruth, denise).
  ;; The meeting duration is exactly two consecutive 30-minute timeslots (1 hour).
  (:action schedule_meeting
    :parameters (?m - meeting ?s ?next - timeslot)
    :precondition (and
      (not (scheduled ?m))
      (next ?s ?next)
      (allowed_start ?s)
      ;; all three named participants must be free for both consecutive slots
      (free ryan ?s) (free ryan ?next)
      (free ruth ?s) (free ruth ?next)
      (free denise ?s) (free denise ?next)
    )
    :effect (and
      (scheduled ?m)
      (meeting_at ?m ?s)
      ;; occupy those slots for each participant
      (not (free ryan ?s)) (not (free ryan ?next))
      (not (free ruth ?s)) (not (free ruth ?next))
      (not (free denise ?s)) (not (free denise ?next))
    )
  )
)