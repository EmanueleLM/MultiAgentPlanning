(define (domain blocksworld_staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (current ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  ;; Pickup a clear block from the table into the hand,
  ;; advancing the discrete stage by one successor step.
  (:action pickup
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Put the held block down on the table, making it clear,
  ;; and advance the stage.
  (:action putdown
    :parameters (?b - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Unstack a clear block from on top of another block into the hand,
  ;; the supporting block becomes clear; advance the stage.
  (:action unstack
    :parameters (?b - block ?s - block ?t - stage ?t2 - stage)
    :precondition (and
      (on ?b ?s)
      (clear ?b)
      (handempty)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (holding ?b)
      (clear ?s)
      (not (on ?b ?s))
      (not (clear ?b))
      (not (handempty))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Stack the held block on top of a clear block, making the destination not clear,
  ;; ensuring the held block is no longer on the table, and advance the stage.
  (:action stack
    :parameters (?b - block ?s - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?s)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (on ?b ?s)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?s))
      (not (ontable ?b))
      (not (current ?t))
      (current ?t2)
    )
  )
)