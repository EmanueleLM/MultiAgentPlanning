(define (domain blocks-single-handed-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (holding ?x - block)
    (handempty)
    (clear ?x - block)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Pick up a clear block from the table into the hand, advancing to the next stage.
  (:action pick-up
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Unstack a clear block from on top of another block into the hand, making the below block clear, advancing stage.
  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (= ?b ?c))
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (clear ?c)
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put down a held block onto the table, making it clear and emptying the hand, advancing stage.
  (:action put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack a held block onto a clear block, making the target not clear and the hand empty, advancing stage.
  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?c)
      (not (= ?b ?c))
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (clear ?c))
      (not (holding ?b))
      (not (ontable ?b))
      (not (current ?s))
      (current ?s2)
    )
  )
)