(define (domain meeting-scheduling-integrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    ;; Agent 1 predicates (from first agent)
    (fits_all ?s - slot)                 ; public info: slot fits all participants (agent1 notion)
    (free_a1 ?p - person ?s - slot)      ; agent1's free predicate for persons (diane knowledge)
    (scheduled_a1 ?s - slot)             ; agent1's scheduled indicator

    ;; Agent 2 predicates (from second agent)
    (slot ?s - slot)                     ; explicit slot declaration (agent2)
    (available ?p - person ?s - slot)    ; agent2's availability predicate
    (meeting_made)                       ; agent2: global meeting-made flag
    (no_meeting_made)                    ; agent2: initial "no meeting made" flag
    (meeting_scheduled_a2 ?s - slot)     ; agent2's scheduled indicator
    (scheduled_for ?p - person ?s - slot); agent2: participant assigned to a slot

    ;; Agent 3 predicates (from third agent)
    (person ?p - person)                 ; agent3: person declaration
    (free_a3 ?p - person ?s - slot)      ; agent3's free predicate (Deborah data)
    (meeting_scheduled_a3 ?s - slot)     ; agent3's scheduled indicator
    (meeting_with ?p1 - person ?p2 - person ?s - slot) ; agent3: meeting between two persons at a slot
    (fits_all_exists)                    ; agent3: public fact "there exists at least one fitting slot"
  )

  ;; Actions kept distinct (renamed to avoid collisions)
  ;; ---------- Agent 1 action ----------
  (:action schedule_meeting_a1
    :parameters (?s - slot)
    :precondition (and
                    (fits_all ?s)
                    (free_a1 diane_kelly ?s)
                    (not (scheduled_a1 ?s))
                  )
    :effect (and
              (scheduled_a1 ?s)
              (not (free_a1 diane_kelly ?s))
            )
  )

  ;; ---------- Agent 2 action ----------
  (:action schedule_meeting_two_a2
    :parameters (?s - slot ?p1 - person ?p2 - person)
    :precondition (and
                    (slot ?s)
                    (available ?p1 ?s)
                    (available ?p2 ?s)
                    (no_meeting_made)
                  )
    :effect (and
              (meeting_made)
              (not (no_meeting_made))
              (meeting_scheduled_a2 ?s)
              (scheduled_for ?p1 ?s)
              (scheduled_for ?p2 ?s)
              (not (available ?p1 ?s))
              (not (available ?p2 ?s))
            )
  )

  ;; ---------- Agent 3 action ----------
  (:action schedule_meeting_a3
    :parameters (?a - person ?b - person ?s - slot)
    :precondition (and
                    (person ?a)
                    (person ?b)
                    (slot ?s)
                    (free_a3 ?a ?s)
                    (fits_all_exists)
                  )
    :effect (and
              (meeting_scheduled_a3 ?s)
              (meeting_with ?a ?b ?s)
              (not (free_a3 ?a ?s))
            )
  )
)