(define (domain multi-party-meeting-domain)
  ; Scheduling a 1-hour meeting on Monday for Arthur, Michael, and Samantha
  ; Each participant has their own free slots and their own scheduling action.
  (:requirements :typing :strips)
  (:types
    person slot
  )

  (:predicates
    ; Free status per person and slot
    (free-arthur ?s - slot)
    (free-michael ?s - slot)
    (free-samantha ?s - slot)

    ; Per-person scheduling flag for a given slot
    (scheduled-arthur ?s - slot)
    (scheduled-michael ?s - slot)
    (scheduled-samantha ?s - slot)

    ; A meeting has been scheduled at a given slot (shared coordination)
    (meeting-at ?s - slot)
  )

  ; Action: Arthur schedules a meeting at a given slot
  (:action schedule-arthur-at-slot
     :parameters (?s - slot)
     :precondition (and (free-arthur ?s)
                        (not (scheduled-arthur ?s))
                        (not (meeting-at ?s)))
     :effect (and (not (free-arthur ?s))
                  (scheduled-arthur ?s)
                  (meeting-at ?s))
  )

  ; Action: Michael schedules a meeting at a given slot
  (:action schedule-michael-at-slot
     :parameters (?s - slot)
     :precondition (and (free-michael ?s)
                        (not (scheduled-michael ?s))
                        (not (meeting-at ?s)))
     :effect (and (not (free-michael ?s))
                  (scheduled-michael ?s)
                  (meeting-at ?s))
  )

  ; Action: Samantha schedules a meeting at a given slot
  (:action schedule-samantha-at-slot
     :parameters (?s - slot)
     :precondition (and (free-samantha ?s)
                        (not (scheduled-samantha ?s))
                        (not (meeting-at ?s)))
     :effect (and (not (free-samantha ?s))
                  (scheduled-samantha ?s)
                  (meeting-at ?s))
  )
)