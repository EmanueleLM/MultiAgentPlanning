(define (domain multiagent-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot day)
  (:predicates
    (scott_slot ?s - slot)
    (scott_available ?s - slot)
    (scott_scheduled ?s - slot)
    (gabriel_slot ?s - slot)
    (gabriel_available ?s - slot)
    (gabriel_scheduled ?s - slot)
    (christine_slot ?s - slot)
    (christine_available ?s - slot)
    (christine_scheduled ?s - slot)
    (slot_of ?s - slot ?d - day)
    (work_hour ?s - slot)
    (orchestrator_confirmed ?s - slot)
  )

  (:action scott_schedule
    :parameters (?s - slot)
    :precondition (and (scott_slot ?s) (scott_available ?s) (not (scott_scheduled ?s)))
    :effect (and (scott_scheduled ?s) (not (scott_available ?s)))
  )

  (:action gabriel_schedule
    :parameters (?s - slot)
    :precondition (and (gabriel_slot ?s) (gabriel_available ?s) (not (gabriel_scheduled ?s)))
    :effect (and (gabriel_scheduled ?s) (not (gabriel_available ?s)))
  )

  (:action christine_schedule
    :parameters (?s - slot)
    :precondition (and (christine_slot ?s) (christine_available ?s) (not (christine_scheduled ?s)))
    :effect (and (christine_scheduled ?s) (not (christine_available ?s)))
  )

  (:action orchestrator_schedule
    :parameters (?s - slot ?d - day)
    :precondition (and
                    (slot_of ?s ?d)
                    (work_hour ?s)
                    (scott_available ?s)
                    (gabriel_available ?s)
                    (christine_available ?s)
                    (not (orchestrator_confirmed ?s))
                  )
    :effect (and
              (scott_scheduled ?s)
              (gabriel_scheduled ?s)
              (christine_scheduled ?s)
              (orchestrator_confirmed ?s)
              (not (scott_available ?s))
              (not (gabriel_available ?s))
              (not (christine_available ?s))
            )
  )
)