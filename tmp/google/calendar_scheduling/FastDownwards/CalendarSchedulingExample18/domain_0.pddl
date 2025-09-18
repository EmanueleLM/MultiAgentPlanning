(define (domain orchestrated-meeting)
  (:requirements :typing :negative-preconditions :conditional-effects :adl :fluents)
  (:types person slot meeting)

  ;; Predicates representing each agent's view (kept distinct)
  (:predicates
    ;; Agent 1 (first participant's model) - explicit availability facts it provided
    (avail_a1 ?p - person ?s - slot)

    ;; Agent 2 (second participant's model) - busy/free, attendees, unscheduled state, late marker
    (busy_a2 ?p - person ?s - slot)
    (free_a2 ?s - slot)
    (attendee_a2 ?m - meeting ?p - person)
    (unscheduled_a2 ?m - meeting)

    ;; Agent 3 (third participant's model) - explicit availability facts it provided
    (avail_a3 ?p - person ?s - slot)

    ;; Confirmation predicates produced by each agent's local check/action
    (confirmed_a1 ?s - slot ?p - person)    ;; agent1 confirms this person is available at slot
    (confirmed_a2 ?m - meeting ?s - slot)   ;; agent2 confirms meeting can be scheduled at slot (no attendee busy + slot free)
    (confirmed_a3 ?s - slot ?p - person)    ;; agent3 confirms this person is available at slot

    ;; Final meeting state (orchestrator view / common predicates)
    (meeting-scheduled)
    (meeting-at ?s - slot)
    (meeting-with ?p - person)
    (scheduled_a2 ?m - meeting ?s - slot)   ;; mirrors agent2's scheduled flag if they set it
    (late ?s - slot)                        ;; marks slots considered "late" (soft preference)
  )

  (:functions
    (penalty)  ;; numeric penalty used by agent2's soft-preference for "late" times
  )

  ;; Agent 1 action: confirm organizer/participant availability according to agent1's facts.
  (:action confirm-by-agent1
    :parameters (?s - slot ?p - person)
    :precondition (and
                    (avail_a1 ?p ?s)
                  )
    :effect (and
              (confirmed_a1 ?s ?p)
            )
  )

  ;; Agent 3 action: confirm participant availability according to agent3's facts.
  (:action confirm-by-agent3
    :parameters (?s - slot ?p - person)
    :precondition (and
                    (avail_a3 ?p ?s)
                  )
    :effect (and
              (confirmed_a3 ?s ?p)
            )
  )

  ;; Agent 2 action: check that the meeting (attendee list) can occupy slot ?s:
  ;; - meeting must be currently unscheduled in agent2's view
  ;; - slot must be free in agent2's view
  ;; - all attendees listed by agent2 must not be busy at ?s (explicit negative preconditions)
  ;; Effects:
  ;; - mark agent2's meeting as scheduled for the slot
  ;; - mark that agent2 has confirmed the slot
  ;; - unset unscheduled flag in agent2's view
  ;; - if the slot is late, increase the penalty (soft preference)
  (:action confirm-by-agent2
    :parameters (?m - meeting ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
                    (unscheduled_a2 ?m)
                    (free_a2 ?s)
                    ;; attendees must be explicitly declared in agent2's view
                    (attendee_a2 ?m ?p1)
                    (attendee_a2 ?m ?p2)
                    (attendee_a2 ?m ?p3)
                    ;; ensure none are busy in this slot (negative preconditions)
                    (not (busy_a2 ?p1 ?s))
                    (not (busy_a2 ?p2 ?s))
                    (not (busy_a2 ?p3 ?s))
                  )
    :effect (and
              (confirmed_a2 ?m ?s)
              (scheduled_a2 ?m ?s)
              (not (unscheduled_a2 ?m))
              (not (free_a2 ?s))
              ;; soft preference: incur penalty if slot is late (agent2 preference)
              (when (late ?s)
                    (increase (penalty) 1))
            )
  )

  ;; Orchestrator / finalizing action: requires confirmations from each agent for the slot
  ;; - Agent1 must confirm the organizer (here Brian) is available at ?s
  ;; - Agent3 must confirm Patricia is available at ?s
  ;; - Agent2 must have confirmed that the meeting can be scheduled at ?s (no busy attendees + slot free)
  ;; Once applied, the meeting is globally scheduled and attendees are recorded in the common predicates.
  (:action finalize-meeting
    :parameters (?m - meeting ?s - slot ?org - person ?p1 - person ?p2 - person)
    :precondition (and
                    (confirmed_a1 ?s ?org)
                    (confirmed_a3 ?s ?p1)
                    (confirmed_a2 ?m ?s)
                    ;; agent2 confirmed in its attendee list that ?p2 and ?p1 and ?org are attendees;
                    ;; finalization does not re-check busy-times (agent2 already checked).
                    (attendee_a2 ?m ?org)
                    (attendee_a2 ?m ?p1)
                    (attendee_a2 ?m ?p2)
                    ;; ensure meeting is not already globally scheduled
                    (not (meeting-scheduled))
                  )
    :effect (and
              (meeting-scheduled)
              (meeting-at ?s)
              (meeting-with ?org)
              (meeting-with ?p1)
              (meeting-with ?p2)
            )
  )
)