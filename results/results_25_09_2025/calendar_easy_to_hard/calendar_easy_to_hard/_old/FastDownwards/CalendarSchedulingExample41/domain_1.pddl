(define (domain integrated-meeting-scheduling)
  (:requirements :typing :adl :negative-preconditions :action-costs)
  (:types slot person)
  (:predicates
    (slot ?s - slot)
    (person ?p - person)
    (free ?p - person ?s - slot)
    (preferred ?p - person ?s - slot)
    (confirmed ?p - person ?s - slot)
    (has-confirmed ?p - person)
    (finalized)
    (scheduled ?s - slot)
  )

  (:action confirm-a1-preferred
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person agent1) (free agent1 ?s) (preferred agent1 ?s) (not (has-confirmed agent1)) (not (finalized)))
    :effect (and (confirmed agent1 ?s) (has-confirmed agent1))
    :cost 0
  )

  (:action confirm-a1-nonpreferred
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person agent1) (free agent1 ?s) (not (preferred agent1 ?s)) (not (has-confirmed agent1)) (not (finalized)))
    :effect (and (confirmed agent1 ?s) (has-confirmed agent1))
    :cost 1
  )

  (:action confirm-a2-preferred
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person agent2) (free agent2 ?s) (preferred agent2 ?s) (not (has-confirmed agent2)) (not (finalized)))
    :effect (and (confirmed agent2 ?s) (has-confirmed agent2))
    :cost 0
  )

  (:action confirm-a2-nonpreferred
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person agent2) (free agent2 ?s) (not (preferred agent2 ?s)) (not (has-confirmed agent2)) (not (finalized)))
    :effect (and (confirmed agent2 ?s) (has-confirmed agent2))
    :cost 1
  )

  (:action confirm-a3-preferred
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person agent3) (free agent3 ?s) (preferred agent3 ?s) (not (has-confirmed agent3)) (not (finalized)))
    :effect (and (confirmed agent3 ?s) (has-confirmed agent3))
    :cost 0
  )

  (:action confirm-a3-nonpreferred
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person agent3) (free agent3 ?s) (not (preferred agent3 ?s)) (not (has-confirmed agent3)) (not (finalized)))
    :effect (and (confirmed agent3 ?s) (has-confirmed agent3))
    :cost 1
  )

  (:action confirm-a4-preferred
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person agent4) (free agent4 ?s) (preferred agent4 ?s) (not (has-confirmed agent4)) (not (finalized)))
    :effect (and (confirmed agent4 ?s) (has-confirmed agent4))
    :cost 0
  )

  (:action confirm-a4-nonpreferred
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person agent4) (free agent4 ?s) (not (preferred agent4 ?s)) (not (has-confirmed agent4)) (not (finalized)))
    :effect (and (confirmed agent4 ?s) (has-confirmed agent4))
    :cost 1
  )

  (:action confirm-a5-preferred
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person agent5) (free agent5 ?s) (preferred agent5 ?s) (not (has-confirmed agent5)) (not (finalized)))
    :effect (and (confirmed agent5 ?s) (has-confirmed agent5))
    :cost 0
  )

  (:action confirm-a5-nonpreferred
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person agent5) (free agent5 ?s) (not (preferred agent5 ?s)) (not (has-confirmed agent5)) (not (finalized)))
    :effect (and (confirmed agent5 ?s) (has-confirmed agent5))
    :cost 1
  )

  (:action confirm-a6-preferred
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person agent6) (free agent6 ?s) (preferred agent6 ?s) (not (has-confirmed agent6)) (not (finalized)))
    :effect (and (confirmed agent6 ?s) (has-confirmed agent6))
    :cost 0
  )

  (:action confirm-a6-nonpreferred
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person agent6) (free agent6 ?s) (not (preferred agent6 ?s)) (not (has-confirmed agent6)) (not (finalized)))
    :effect (and (confirmed agent6 ?s) (has-confirmed agent6))
    :cost 1
  )

  (:action confirm-a7-preferred
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person agent7) (free agent7 ?s) (preferred agent7 ?s) (not (has-confirmed agent7)) (not (finalized)))
    :effect (and (confirmed agent7 ?s) (has-confirmed agent7))
    :cost 0
  )

  (:action confirm-a7-nonpreferred
    :parameters (?s - slot)
    :precondition (and (slot ?s) (person agent7) (free agent7 ?s) (not (preferred agent7 ?s)) (not (has-confirmed agent7)) (not (finalized)))
    :effect (and (confirmed agent7 ?s) (has-confirmed agent7))
    :cost 1
  )

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
    :effect (and (finalized) (scheduled ?s))
    :cost 0
  )
)