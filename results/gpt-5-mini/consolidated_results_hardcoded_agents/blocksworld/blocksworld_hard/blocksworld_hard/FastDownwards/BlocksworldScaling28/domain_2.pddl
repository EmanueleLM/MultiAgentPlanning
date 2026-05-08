(define (domain blocksworld-scaling28)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)
  (:predicates
    (ontable ?b - block)
    (on ?b - block ?x - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (at-stage ?s - stage)
    (successor ?s1 - stage ?s2 - stage)
  )

  ;; Pickup a clear block from the table while the hand is empty and advance stage
  (:action pickup
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
                    (ontable ?b)
                    (clear ?b)
                    (handempty)
                    (at-stage ?s)
                    (successor ?s ?s2)
                  )
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty))
              (holding ?b)
              (not (at-stage ?s))
              (at-stage ?s2)
            )
  )

  ;; Unstack a clear block from another block while the hand is empty and advance stage
  (:action unstack
    :parameters (?b - block ?x - block ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?b ?x)
                    (clear ?b)
                    (handempty)
                    (at-stage ?s)
                    (successor ?s ?s2)
                    (not (= ?b ?x))
                  )
    :effect (and
              (not (on ?b ?x))
              (holding ?b)
              (not (clear ?b))
              (clear ?x)
              (not (handempty))
              (not (at-stage ?s))
              (at-stage ?s2)
            )
  )

  ;; Put down a held block onto the table and advance stage
  (:action putdown
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?b)
                    (at-stage ?s)
                    (successor ?s ?s2)
                  )
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty)
              (not (holding ?b))
              (not (at-stage ?s))
              (at-stage ?s2)
            )
  )

  ;; Stack a held block onto a clear block and advance stage
  (:action stack
    :parameters (?b - block ?x - block ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?b)
                    (clear ?x)
                    (at-stage ?s)
                    (successor ?s ?s2)
                    (not (= ?b ?x))
                  )
    :effect (and
              (on ?b ?x)
              (clear ?b)
              (not (clear ?x))
              (handempty)
              (not (holding ?b))
              (not (at-stage ?s))
              (at-stage ?s2)
            )
  )
)