(define (domain blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block hand stage)

  (:predicates
    (ontable ?b - block)                ; block is directly on the table
    (on ?b - block ?c - block)         ; block b is directly on block c
    (clear ?b - block)                 ; nothing on top of block b AND it is not held
    (holding ?h - hand ?b - block)     ; hand h is holding block b
    (handempty ?h - hand)              ; hand h is empty
    (current ?s - stage)               ; current discrete stage/timepoint
    (succ ?s1 - stage ?s2 - stage)     ; successor relation between stages
  )

  ;; Pick up a clear block from the table at a current stage, advancing to the successor stage.
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
              (not (clear ?x))     ; being held means not clear per definition
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Put a held block down onto the table, advancing to the successor stage.
  (:action put-down-on-table
    :parameters (?h - hand ?x - block ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (succ ?s ?s2)
                    (holding ?h ?x)
                  )
    :effect (and
              (ontable ?x)
              (clear ?x)           ; on table and nothing on top -> clear
              (handempty ?h)
              (not (holding ?h ?x))
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Unstack a clear block from another block, advancing to the successor stage.
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
              (clear ?y)            ; removing x frees y (no block on top)
              (not (handempty ?h))
              (not (clear ?x))      ; being held means x is not clear
              (not (current ?s))
              (current ?s2)
            )
  )

  ;; Stack a held block onto a clear block, advancing to the successor stage.
  (:action stack-onto-block
    :parameters (?h - hand ?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
                    (current ?s)
                    (succ ?s ?s2)
                    (holding ?h ?x)
                    (clear ?y)
                    (not (on ?y ?x))     ; prevent trivial cycles where y is on x
                  )
    :effect (and
              (on ?x ?y)
              (not (ontable ?x))
              (clear ?x)
              (not (clear ?y))     ; y no longer clear once x placed on it
              (handempty ?h)
              (not (holding ?h ?x))
              (not (current ?s))
              (current ?s2)
            )
  )
)