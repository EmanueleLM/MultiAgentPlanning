(define (domain blocks-multiagent-revised)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handempty)
    (holding ?x - block)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Pick up a clear block from the table (operator action).
  ;; Advance explicitly from stage ?t to successor ?t2.
  (:action operator_pickup
    :parameters (?x - block ?t - stage ?t2 - stage)
    :precondition (and
                    (ontable ?x)
                    (clear ?x)
                    (handempty)
                    (current ?t)
                    (succ ?t ?t2)
                  )
    :effect (and
              (holding ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Unstack a clear block ?x from on top of another block ?y.
  ;; Advance explicitly from stage ?t to successor ?t2.
  (:action operator_unstack
    :parameters (?x - block ?y - block ?t - stage ?t2 - stage)
    :precondition (and
                    (on ?x ?y)
                    (clear ?x)
                    (handempty)
                    (current ?t)
                    (succ ?t ?t2)
                    (not (= ?x ?y))
                  )
    :effect (and
              (holding ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty))
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Put down a held block onto the table. Advance explicitly.
  (:action operator_putdown
    :parameters (?x - block ?t - stage ?t2 - stage)
    :precondition (and
                    (holding ?x)
                    (current ?t)
                    (succ ?t ?t2)
                  )
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty)
              (not (holding ?x))
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Stack a held block ?x onto a clear block ?y. Advance explicitly.
  (:action operator_stack
    :parameters (?x - block ?y - block ?t - stage ?t2 - stage)
    :precondition (and
                    (holding ?x)
                    (clear ?y)
                    (current ?t)
                    (succ ?t ?t2)
                    (not (= ?x ?y))
                  )
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (handempty)
              (not (holding ?x))
              (not (clear ?y))
              (not (ontable ?x))
              (not (current ?t))
              (current ?t2)
            )
  )
)