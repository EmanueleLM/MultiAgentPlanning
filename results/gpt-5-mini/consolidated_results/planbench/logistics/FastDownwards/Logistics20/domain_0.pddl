(define (domain field-ops)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent task location day)

  (:predicates
    ;; objects & positioning
    (at ?a - agent ?l - location)
    (task-at ?t - task ?l - location)

    ;; task scheduling and progress
    (scheduled ?t - task ?d - day)
    (day-ready ?d - day)
    (day-succ ?d1 - day ?d2 - day)

    ;; task status
    (inspected ?t - task)
    (repaired ?t - task)

    ;; agent capabilities / status
    (charged ?a - agent)
    (has-tools ?a - agent)
    (can-inspect ?a - agent)
    (can-repair ?a - agent)

    ;; type markers (for readability; objects declared in problem)
    (agent-type ?a - agent)
    (task-type ?t - task)
    (location-type ?l - location)
    (day-type ?d - day)
  )

  ;; Move actions are agent-specific and named with the originating agent's identifier.
  (:action drone1_move
    :parameters (?from - location ?to - location)
    :precondition (and (at drone1 ?from) (not (at drone1 ?to)))
    :effect (and (not (at drone1 ?from)) (at drone1 ?to))
  )

  (:action tech1_move
    :parameters (?from - location ?to - location)
    :precondition (and (at tech1 ?from) (not (at tech1 ?to)))
    :effect (and (not (at tech1 ?from)) (at tech1 ?to))
  )

  ;; Charging action for drone1 (must be at base to charge). No other charging allowed.
  (:action drone1_charge
    :parameters ()
    :precondition (and (at drone1 base) (not (charged drone1)))
    :effect (and (charged drone1))
  )

  ;; Inspection by drone1: must be at the task location, scheduled on the current day,
  ;; the current day must be ready, drone must be charged, and drone must have inspect capability.
  ;; Performing the inspection consumes the drone charge and advances the day-ready marker to the successor day.
  (:action drone1_inspect
    :parameters (?t - task ?loc - location ?d - day ?d2 - day)
    :precondition (and
                   (task-type ?t)
                   (task-at ?t ?loc)
                   (at drone1 ?loc)
                   (scheduled ?t ?d)
                   (day-ready ?d)
                   (day-succ ?d ?d2)
                   (charged drone1)
                   (can-inspect drone1)
                   (not (inspected ?t))
                  )
    :effect (and
              (inspected ?t)
              (not (charged drone1))
              (not (day-ready ?d))
              (day-ready ?d2)
            )
  )

  ;; Optional: tech1 can also inspect if scheduled that day.
  (:action tech1_inspect
    :parameters (?t - task ?loc - location ?d - day ?d2 - day)
    :precondition (and
                   (task-type ?t)
                   (task-at ?t ?loc)
                   (at tech1 ?loc)
                   (scheduled ?t ?d)
                   (day-ready ?d)
                   (day-succ ?d ?d2)
                   (can-inspect tech1)
                   (not (inspected ?t))
                  )
    :effect (and
              (inspected ?t)
              (not (day-ready ?d))
              (day-ready ?d2)
            )
  )

  ;; Repair action is agent-specific (tech1 only). Enforces auditor-corrected causal constraint:
  ;; a repair requires a prior inspection of the same task and must occur exactly on the scheduled day
  ;; (cannot be done earlier or later). Repair consumes the day-ready marker and advances to successor.
  (:action tech1_repair
    :parameters (?t - task ?loc - location ?d - day ?d2 - day)
    :precondition (and
                   (task-type ?t)
                   (task-at ?t ?loc)
                   (at tech1 ?loc)
                   (scheduled ?t ?d)
                   (day-ready ?d)
                   (day-succ ?d ?d2)
                   (has-tools tech1)
                   (inspected ?t)
                   (can-repair tech1)
                   (not (repaired ?t))
                  )
    :effect (and
              (repaired ?t)
              (not (day-ready ?d))
              (day-ready ?d2)
            )
  )

)