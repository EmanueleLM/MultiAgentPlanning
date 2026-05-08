(define (domain blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block hand stage)

  (:predicates
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (clear ?b - block)
    (holding ?h - hand ?b - block)
    (handempty ?h - hand)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Pick up a clear block from the table, advancing to successor stage.
  (:action pickup-from-table
    :parameters (?h - hand ?x - block ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (succ ?s ?s2)
                    (ontable ?x)
                    (clear ?x)
                    (handempty ?h)
                  )
    :effect (and
              (holding ?h ?x)
              (not (ontable ?x))
              (not (handempty ?h))
              (not (clear ?x))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Put a held block down onto the table, advancing to successor stage.
  (:action put-down-on-table
    :parameters (?h - hand ?x - block ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (succ ?s ?s2)
                    (holding ?h ?x)
                  )
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty ?h)
              (not (holding ?h ?x))
              ;; ensure no residual on-relations remain for the put-down block
              (forall (?y - block) (when (on ?x ?y) (not (on ?x ?y))))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Unstack a clear block from on top of another block, advancing to successor stage.
  (:action unstack-from-block
    :parameters (?h - hand ?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (succ ?s ?s2)
                    (on ?x ?y)
                    (clear ?x)
                    (handempty ?h)
                  )
    :effect (and
              (holding ?h ?x)
              (not (on ?x ?y))
              (clear ?y)
              (not (handempty ?h))
              (not (clear ?x))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Stack a held block onto a clear block, advancing to successor stage.
  (:action stack-onto-block
    :parameters (?h - hand ?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (succ ?s ?s2)
                    (holding ?h ?x)
                    (clear ?y)
                    (not (= ?x ?y))
                  )
    :effect (and
              (on ?x ?y)
              (not (ontable ?x))
              (clear ?x)
              (not (clear ?y))
              (handempty ?h)
              (not (holding ?h ?x))
              (not (current ?s))
              (current ?s2)
            )
  )
)