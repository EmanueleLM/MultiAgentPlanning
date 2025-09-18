(define (domain meeting-scheduling-combined)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; Common / global
    (slot ?s)
    (within-hours ?s)

    ;; Agent 1 (first agent) predicates (prefix a1_)
    (a1_busy ?p ?s)                 ; agent1's knowledge of busy times (joyce)
    (a1_scheduled ?s)               ; agent1 marks a slot scheduled
    (a1_has_attendee ?s ?p)         ; agent1's attendance marker
    (participant ?p)                ; agent1's participant listing
    (a1_meeting_scheduled)          ; agent1-level meeting scheduled flag
    (a1_meeting_with ?p1 ?p2)       ; agent1-level pairwise meeting marker

    ;; Agent 2 (second agent) predicates (prefix a2_)
    (a2_free ?p ?s)                 ; agent2's knowledge of known free slots
    (a2_busy ?p ?s)                 ; agent2's knowledge of busy slots
    (a2_meeting_scheduled ?s)       ; agent2-level scheduled marker
    (a2_attends ?p ?s)              ; agent2-level attendance marker
    (meeting-duration-30)           ; agent2's public meeting duration fact

    ;; Agent 3 (third agent) predicates (prefix a3_)
    (a3_busy ?p ?s)                 ; agent3's knowledge of busy times (alexander)
    (meeting ?m)                    ; meeting objects for agent3
    (a3_scheduled ?m ?s)            ; agent3's meeting scheduled at slot
    (a3_meeting-with ?m ?p)         ; agent3's meeting membership facts
    (used ?s)                       ; agent3 marks slot as used
  )

  ;; Agent 1 action (adapted from first agent): schedule-with
  (:action a1_schedule-with
    :parameters (?s ?p1 ?p2)
    :precondition (and
      (slot ?s)
      (within-hours ?s)
      (participant ?p1)
      (participant ?p2)
      (not (a1_busy joyce ?s))    ;; agent1's known busy constraints for Joyce
      (not (a1_scheduled ?s))
    )
    :effect (and
      (a1_scheduled ?s)
      (a1_has_attendee ?s ?p1)
      (a1_has_attendee ?s ?p2)
      (a1_has_attendee ?s joyce)
      (a1_meeting_scheduled)
      (a1_meeting_with ?p1 ?p2)
    )
  )

  ;; Agent 2 action (adapted from second agent): schedule-meeting
  (:action a2_schedule-meeting
    :parameters (?s ?p1 ?p2 ?p3)
    :precondition (and
      (slot ?s)
      (a2_free ?p1 ?s)
      (a2_free ?p2 ?s)
      (a2_free ?p3 ?s)
      (meeting-duration-30)
    )
    :effect (and
      (a2_meeting_scheduled ?s)
      (a2_attends ?p1 ?s)
      (a2_attends ?p2 ?s)
      (a2_attends ?p3 ?s)
    )
  )

  ;; Agent 3 action (adapted from third agent): schedule
  (:action a3_schedule
    :parameters (?m ?s)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (within-hours ?s)
      (not (a3_busy alexander ?s))  ;; agent3's known busy constraints for Alexander
      (not (used ?s))
    )
    :effect (and
      (a3_scheduled ?m ?s)
      (a3_meeting-with ?m alexander)
      (a3_meeting-with ?m joyce)
      (a3_meeting-with ?m christine)
      (used ?s)
    )
  )
)