(define (domain blocksworld-scaling10-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Pick a clear block from the table into the (previously empty) hand,
  ;; advancing the current stage to its immediate successor.
  (:action pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding ?b)
      (not (handempty))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Remove a clear block from atop another block into the (previously empty) hand,
  ;; making the supporting block clear, and advance stage to successor.
  (:action unstack
    :parameters (?b - block ?p - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (on ?b ?p)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
    :effect (and
      (not (on ?b ?p))
      (not (clear ?b))
      (holding ?b)
      (clear ?p)
      (not (handempty))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Put the held block down on the table, making it clear and emptying the hand,
  ;; and advance to the next stage.
  (:action put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (holding ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Stack the held block onto a clear block, update clear predicates,
  ;; empty the hand, and advance to the successor stage.
  (:action stack
    :parameters (?b - block ?p - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (holding ?b)
      (clear ?p)
      (not (holding ?p))
    )
    :effect (and
      (on ?b ?p)
      (clear ?b)
      (not (clear ?p))
      (not (holding ?b))
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)