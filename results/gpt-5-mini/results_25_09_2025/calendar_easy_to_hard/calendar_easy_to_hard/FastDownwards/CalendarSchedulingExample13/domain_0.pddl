(define (domain meeting-scheduling-multiagent)
  (:requirements :strips :typing :negative-preconditions :adl :fluents)
  (:types agent timeslot)

  (:predicates
    (agent ?a - agent)
    (timeslot ?t - timeslot)
    (free ?a - agent ?t - timeslot)                 ; agent is free at time slot
    (gerald-pref ?t - timeslot)                     ; Gerald prefers this slot (>= 13:00)
    (meeting-scheduled ?t - timeslot)               ; meeting scheduled at this slot
    (meeting-scheduled-flag)                        ; a meeting has been scheduled (global flag)
    (scheduled-by-gerald ?t - timeslot)
    (scheduled-by-roy ?t - timeslot)
    (scheduled-by-barbara ?t - timeslot)
  )

  (:functions
    (total-cost)                                    ; numeric cost to encode Gerald's soft preference
  )

  ; Action for Gerald to schedule (keeps actions distinct per agent)
  (:action schedule-by-gerald
    :parameters (?t - timeslot)
    :precondition (and
      (agent gerald)
      (agent roy)
      (agent barbara)
      (timeslot ?t)
      (free gerald ?t)
      (free roy ?t)
      (free barbara ?t)
      (not (meeting-scheduled-flag))
    )
    :effect (and
      (meeting-scheduled ?t)
      (meeting-scheduled-flag)
      (scheduled-by-gerald ?t)

      ; increase total-cost by 0 if preferred for Gerald, otherwise by 1
      (when (gerald-pref ?t) (increase (total-cost) 0))
      (when (not (gerald-pref ?t)) (increase (total-cost) 1))
    )
  )

  ; Action for Roy to schedule (distinct)
  (:action schedule-by-roy
    :parameters (?t - timeslot)
    :precondition (and
      (agent gerald)
      (agent roy)
      (agent barbara)
      (timeslot ?t)
      (free gerald ?t)
      (free roy ?t)
      (free barbara ?t)
      (not (meeting-scheduled-flag))
    )
    :effect (and
      (meeting-scheduled ?t)
      (meeting-scheduled-flag)
      (scheduled-by-roy ?t)

      ; preference is Gerald's; apply same cost logic regardless of who schedules
      (when (gerald-pref ?t) (increase (total-cost) 0))
      (when (not (gerald-pref ?t)) (increase (total-cost) 1))
    )
  )

  ; Action for Barbara to schedule (distinct)
  (:action schedule-by-barbara
    :parameters (?t - timeslot)
    :precondition (and
      (agent gerald)
      (agent roy)
      (agent barbara)
      (timeslot ?t)
      (free gerald ?t)
      (free roy ?t)
      (free barbara ?t)
      (not (meeting-scheduled-flag))
    )
    :effect (and
      (meeting-scheduled ?t)
      (meeting-scheduled-flag)
      (scheduled-by-barbara ?t)

      ; preference is Gerald's; apply same cost logic regardless of who schedules
      (when (gerald-pref ?t) (increase (total-cost) 0))
      (when (not (gerald-pref ?t)) (increase (total-cost) 1))
    )
  )
)