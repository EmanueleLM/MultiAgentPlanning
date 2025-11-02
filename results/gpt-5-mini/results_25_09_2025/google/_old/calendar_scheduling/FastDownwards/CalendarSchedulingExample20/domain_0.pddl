(define (domain orchestrated-scheduling)
  (:requirements :strips :typing :fluents :conditional-effects)
  (:types person slot)
  (:predicates
    (slot ?s - slot)

    ;; Participant-specific availability predicates (kept distinct per agent)
    (ralph_free ?s - slot)        ; from agent 1 / Ralph's view
    (peter_free ?s - slot)        ; from agent 2 / Peter's view
    (daniel_available ?s - slot)  ; from agent 3 / Daniel's view

    ;; Daniel's undesirable times (preference marker)
    (daniel_undesirable ?s - slot)

    ;; Meeting state
    (unscheduled)
    (meeting_scheduled)
    (scheduled_at ?s - slot)
  )

  (:functions (total-cost))

  ;; Separate scheduling actions for each participant (actions kept distinct).
  ;; All of them require all participants to be free for the chosen slot.
  ;; If the chosen slot is marked undesirable by Daniel, scheduling increases total-cost by 1.
  (:action schedule_by_ralph
    :parameters (?s - slot)
    :precondition (and (unscheduled) (slot ?s) (ralph_free ?s) (peter_free ?s) (daniel_available ?s))
    :effect (and
              (meeting_scheduled)
              (scheduled_at ?s)
              (not (unscheduled))
              (when (daniel_undesirable ?s) (increase (total-cost) 1))
            )
  )

  (:action schedule_by_peter
    :parameters (?s - slot)
    :precondition (and (unscheduled) (slot ?s) (ralph_free ?s) (peter_free ?s) (daniel_available ?s))
    :effect (and
              (meeting_scheduled)
              (scheduled_at ?s)
              (not (unscheduled))
              (when (daniel_undesirable ?s) (increase (total-cost) 1))
            )
  )

  (:action schedule_by_daniel
    :parameters (?s - slot)
    :precondition (and (unscheduled) (slot ?s) (ralph_free ?s) (peter_free ?s) (daniel_available ?s))
    :effect (and
              (meeting_scheduled)
              (scheduled_at ?s)
              (not (unscheduled))
              (when (daniel_undesirable ?s) (increase (total-cost) 1))
            )
  )
)