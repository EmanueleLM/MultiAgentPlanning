(define (domain integrated-schedule-meeting)
  (:requirements :typing :negative-preconditions)
  (:types person hour halfslot meeting)

  (:predicates
    ;; Agent 1 predicates (hourly)
    (free_hour ?p - person ?h - hour)            ; agent1: person is free in this hourly timeslot
    (unscheduled ?m - meeting)                   ; agent1: meeting not scheduled yet

    ;; Agent 2 predicates (30-min halfslots)
    (free_half ?p - person ?s - halfslot)        ; agent2: person free in 30-min halfslot
    (slot-next ?s1 - halfslot ?s2 - halfslot)    ; agent2: s2 is the immediate next halfslot after s1
    (meeting-available)                          ; agent2: meeting still available to schedule

    ;; Agent 3 predicates (hourly start-times)
    (available_hour ?p - person ?h - hour)       ; agent3: person available at hourly start
    (slot ?h - hour)                             ; agent3: hour is a valid meeting start slot
    (within-window ?h - hour)                    ; agent3: hour is within allowed window

    ;; Integration / global predicates
    (hour-starts ?h - hour ?s - halfslot)        ; maps an hourly start ?h to the corresponding first halfslot ?s
    (meeting-free)                               ; global mutual exclusion: meeting not yet scheduled (used by all agents)
    (meeting-scheduled-global ?m - meeting)      ; global: meeting scheduled
    (scheduled-at ?m - meeting ?h - hour)        ; global: meeting m scheduled at hour h
    (meeting-start-at-half ?s - halfslot)        ; agent2 informational: meeting starts at halfslot s
    (attends ?p - person ?m - meeting)           ; global attendance predicate

    ;; Aggregated availability (computed in the initial state by integration)
    (free_hour_agg ?p - person ?h - hour)        ; aggregated: person p is known-free at hour h across agents' knowledge
  )

  ; Agent 1's scheduling action (keeps agent1's original structure, but uses aggregated availability to ensure cross-agent constraints)
  (:action schedule-by-agent1
    :parameters (?m - meeting ?h - hour)
    :precondition (and
                    (unscheduled ?m)
                    (meeting-free)
                    ;; agent1's hourly free facts
                    (free_hour david ?h) (free_hour debra ?h) (free_hour kevin ?h)
                    ;; require aggregated availability so we do not violate other agents' known constraints
                    (free_hour_agg david ?h) (free_hour_agg debra ?h) (free_hour_agg kevin ?h)
                  )
    :effect (and
              (meeting-scheduled-global ?m)
              (scheduled-at ?m ?h)
              (attends david ?m) (attends debra ?m) (attends kevin ?m)
              (not (unscheduled ?m))
              (not (meeting-free))
              ;; reflect agent1's assumption: they become not free in that hourly slot
              (not (free_hour david ?h)) (not (free_hour debra ?h)) (not (free_hour kevin ?h))
            )
  )

  ; Agent 2's scheduling action (keeps agent2's original structure; requires mapping to an hourly start so it stays consistent with hourly model)
  (:action schedule-by-agent2
    :parameters (?m - meeting ?s1 - halfslot ?s2 - halfslot ?h - hour)
    :precondition (and
                    (slot-next ?s1 ?s2)             ; need two consecutive 30-min halfslots for a 60-min meeting
                    (hour-starts ?h ?s1)            ; this halfslot corresponds to hourly start ?h
                    (meeting-available)
                    (meeting-free)
                    ;; agent2 requires both halfslots free for each participant (preserves agent2 constraints)
                    (free_half david ?s1) (free_half david ?s2)
                    (free_half debra ?s1) (free_half debra ?s2)
                    (free_half kevin ?s1) (free_half kevin ?s2)
                    ;; aggregated availability to ensure compatibility with other agents' knowledge
                    (free_hour_agg david ?h) (free_hour_agg debra ?h) (free_hour_agg kevin ?h)
                  )
    :effect (and
              (not (meeting-available))
              (meeting-scheduled-global ?m)
              (meeting-start-at-half ?s1)
              (scheduled-at ?m ?h)
              (attends david ?m) (attends debra ?m) (attends kevin ?m)
              (not (free_half david ?s1)) (not (free_half david ?s2))
              (not (free_half debra ?s1)) (not (free_half debra ?s2))
              (not (free_half kevin ?s1)) (not (free_half kevin ?s2))
              (not (meeting-free))
            )
  )

  ; Agent 3's scheduling action (keeps agent3's original structure)
  (:action schedule-by-agent3
    :parameters (?m - meeting ?h - hour)
    :precondition (and
                    (slot ?h)
                    (within-window ?h)
                    (meeting-free)
                    ;; agent3 required availability for participants (agent3 only provided specific available_hour facts)
                    ;; we preserve agent3's constraint as given: they require (available ?p ?h) for all participants.
                    (available_hour david ?h) (available_hour debra ?h) (available_hour kevin ?h)
                    ;; aggregated availability to ensure cross-agent consistency
                    (free_hour_agg david ?h) (free_hour_agg debra ?h) (free_hour_agg kevin ?h)
                  )
    :effect (and
              (meeting-scheduled-global ?m)
              (scheduled-at ?m ?h)
              (attends david ?m) (attends debra ?m) (attends kevin ?m)
              (not (meeting-free))
            )
  )
)