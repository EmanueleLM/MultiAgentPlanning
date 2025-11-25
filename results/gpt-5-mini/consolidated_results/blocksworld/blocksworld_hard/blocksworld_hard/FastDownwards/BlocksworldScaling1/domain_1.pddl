(define (domain blocks-world-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)
  (:predicates
    (handempty)
    (holding ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (clear ?b - block)
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; pick up a block from the table at a specific stage and advance to the next stage
  (:action pickup
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (handempty)
      (clear ?b)
      (ontable ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (handempty))
      (holding ?b)
      ;; clear is defined to mean "no block on top AND not held", so being held makes it not clear
      (not (clear ?b))
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; unstack a block ?b from on top of block ?c at a specific stage and advance to the next stage
  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (handempty)
      (clear ?b)
      (on ?b ?c)
    )
    :effect (and
      (not (on ?b ?c))
      (not (handempty))
      (holding ?b)
      ;; removing ?b from ?c makes ?c clear (no block on top), and ?b is held so not clear
      (clear ?c)
      (not (clear ?b))
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; put down a held block onto the table at a specific stage and advance to the next stage
  (:action putdown
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (handempty)
      (ontable ?b)
      ;; placed on table and not held, with nothing on top -> clear
      (clear ?b)
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; stack a held block ?b onto block ?c at a specific stage and advance to the next stage
  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (not (holding ?b))
      (handempty)
      (on ?b ?c)
      ;; after stacking, the placed block is not held and has nothing on top -> clear
      (clear ?b)
      ;; the supporting block now has something on top so is not clear
      (not (clear ?c))
      ;; ensure placed block is not also on the table (it was held)
      (not (ontable ?b))
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)