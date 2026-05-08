(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)

  ;; declare the three participants as constants so they can be referenced
  ;; directly in action preconditions/effects (model is specific to this instance)
  (:constants janet rachel cynthia - person)

  (:predicates
    (available ?p - person ?s - slot)    ; person p is free during slot s
    (next ?s1 - slot ?s2 - slot)         ; s2 immediately follows s1 (consecutive half-hour)
    (meeting_not_scheduled)              ; meeting still needs scheduling
    (meeting_scheduled)                  ; meeting has been scheduled
    (scheduled_at ?s - slot)             ; meeting starts at slot s
    (allowed_start ?s - slot)            ; slot s is allowed as a meeting start (preference / constraint)
  )

  ;; Single scheduling action fixed to this instance's participants (janet, rachel, cynthia).
  ;; The meeting is one hour => requires two consecutive half-hour slots (?s and ?s2).
  (:action schedule_meeting
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (meeting_not_scheduled)
      (next ?s ?s2)
      (allowed_start ?s)

      ;; all three participants must be available for both consecutive half-hour slots
      (available janet ?s)   (available janet ?s2)
      (available rachel ?s)  (available rachel ?s2)
      (available cynthia ?s) (available cynthia ?s2)
    )
    :effect (and
      (not (meeting_not_scheduled))
      (meeting_scheduled)
      (scheduled_at ?s)

      ;; consume the availabilities for those two slots for each participant
      (not (available janet ?s))   (not (available janet ?s2))
      (not (available rachel ?s))  (not (available rachel ?s2))
      (not (available cynthia ?s)) (not (available cynthia ?s2))
    )
  )
)