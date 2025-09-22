(define (domain integrated-meeting-scheduling)
  (:requirements :typing :adl :negative-preconditions :fluents)
  (:types slot person)
  (:predicates
    (slot ?s - slot)
    (person ?p - person)

    ;; availability per participant (hard constraint)
    (free ?p - person ?s - slot)

    ;; soft preference per participant (informational; used to compute cost)
    (preferred ?p - person ?s - slot)

    ;; per-participant confirmation that they accept the meeting at a slot
    (confirmed ?p - person ?s - slot)

    ;; meeting status
    (finalized)
    (scheduled ?s - slot)
  )

  (:functions
    (total-cost) ; accumulates preference violations (lower is better)
  )

  ;; One distinct confirm action per participant agent (keeps agent actions distinct).
  ;; Each confirm action requires the participant to be free at the chosen slot and the meeting not finalized yet.
  ;; If the chosen slot is not preferred by that participant, the action increases total-cost by 1.
  (:action confirm-a1
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free agent1 ?s) (not (confirmed agent1 ?s)) (not (finalized)))
    :effect (and
              (confirmed agent1 ?s)
              (when (not (preferred agent1 ?s)) (increase (total-cost) 1))
            )
  )

  (:action confirm-a2
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free agent2 ?s) (not (confirmed agent2 ?s)) (not (finalized)))
    :effect (and
              (confirmed agent2 ?s)
              (when (not (preferred agent2 ?s)) (increase (total-cost) 1))
            )
  )

  (:action confirm-a3
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free agent3 ?s) (not (confirmed agent3 ?s)) (not (finalized)))
    :effect (and
              (confirmed agent3 ?s)
              (when (not (preferred agent3 ?s)) (increase (total-cost) 1))
            )
  )

  (:action confirm-a4
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free agent4 ?s) (not (confirmed agent4 ?s)) (not (finalized)))
    :effect (and
              (confirmed agent4 ?s)
              (when (not (preferred agent4 ?s)) (increase (total-cost) 1))
            )
  )

  (:action confirm-a5
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free agent5 ?s) (not (confirmed agent5 ?s)) (not (finalized)))
    :effect (and
              (confirmed agent5 ?s)
              (when (not (preferred agent5 ?s)) (increase (total-cost) 1))
            )
  )

  (:action confirm-a6
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free agent6 ?s) (not (confirmed agent6 ?s)) (not (finalized)))
    :effect (and
              (confirmed agent6 ?s)
              (when (not (preferred agent6 ?s)) (increase (total-cost) 1))
            )
  )

  (:action confirm-a7
    :parameters (?s - slot)
    :precondition (and (slot ?s) (free agent7 ?s) (not (confirmed agent7 ?s)) (not (finalized)))
    :effect (and
              (confirmed agent7 ?s)
              (when (not (preferred agent7 ?s)) (increase (total-cost) 1))
            )
  )

  ;; Finalize the meeting at slot ?s once all participants have confirmed that same slot.
  (:action finalize
    :parameters (?s - slot)
    :precondition (and
                    (slot ?s)
                    (confirmed agent1 ?s)
                    (confirmed agent2 ?s)
                    (confirmed agent3 ?s)
                    (confirmed agent4 ?s)
                    (confirmed agent5 ?s)
                    (confirmed agent6 ?s)
                    (confirmed agent7 ?s)
                    (not (finalized))
                  )
    :effect (and
              (finalized)
              (scheduled ?s)
            )
  )
)