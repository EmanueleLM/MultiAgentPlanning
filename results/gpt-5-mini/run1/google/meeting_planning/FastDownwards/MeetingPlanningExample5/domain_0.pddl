(define (domain scheduling-domain)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent person slot)

  (:predicates
    ; slot is currently free (not yet assigned)
    (slot-free ?s - slot)
    ; slot is assigned to a person
    (assigned ?s - slot ?p - person)
    ; successor relation between slots to enforce contiguity
    (succ ?s1 - slot ?s2 - slot)
    ; goal fact: William has at least one contiguous block meeting of required length
    (william-satisfied)
  )

  (:functions
    ; total-cost is used so the planner can prefer (minimize) schedules that schedule more slots.
    (total-cost)
  )

  ; Action executed by the orchestrator to assign a single discrete slot to a person.
  ; Preconditions:
  ;   - slot must be free.
  ; Effects:
  ;   - slot becomes assigned to the person and is no longer free.
  ;   - decrease total-cost by 1 to make including more assignments preferable.
  (:action schedule-slot-by-orchestrator
    :parameters (?a - agent ?s - slot ?p - person)
    :precondition (slot-free ?s)
    :effect (and
              (not (slot-free ?s))
              (assigned ?s ?p)
              (increase (total-cost) -1)
            )
  )

  ; Action the orchestrator can apply when five consecutive slots are already assigned to William.
  ; This action recognizes that the hard constraint "meet William for at least 75 minutes"
  ; (modeled as five contiguous slots of 15 minutes each in this encoding) is satisfied.
  ; Preconditions:
  ;   - the five contiguous slots are assigned to william and the succ chain is present
  ; Effects:
  ;   - mark william-satisfied (used as an explicit goal fact so the solver cannot reorder steps arbitrarily)
  (:action register-william-block
    :parameters (?a - agent ?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot ?s5 - slot)
    :precondition (and
                    (assigned ?s1 william)
                    (succ ?s1 ?s2)
                    (assigned ?s2 william)
                    (succ ?s2 ?s3)
                    (assigned ?s3 william)
                    (succ ?s3 ?s4)
                    (assigned ?s4 william)
                    (succ ?s4 ?s5)
                    (assigned ?s5 william)
                  )
    :effect (and
              (william-satisfied)
            )
  )
)