(define (domain block-orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (ontable ?b - block)                 ; block is on the table
    (on ?b - block ?b2 - block)         ; block b is directly on block b2
    (clear ?b - block)                  ; nothing is on block b and block is not picked up
    (holding ?b - block)                ; the single hand is holding block b
    (handempty)                         ; the single hand is empty
    (current-stage ?s - stage)          ; the current discrete stage/time
    (succ ?s - stage ?s2 - stage)       ; successor relation between stages
  )

  ; Pick a clear block from the table.
  (:action pick-up
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (handempty) (clear ?x) (ontable ?x) (current-stage ?s) (succ ?s ?s2))
    :effect (and
              (not (ontable ?x))
              (not (clear ?x))     ; a held block is not considered clear (per spec)
              (not (handempty))
              (holding ?x)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  ; Unstack a clear block that is on another block.
  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (handempty) (clear ?x) (on ?x ?y) (current-stage ?s) (succ ?s ?s2))
    :effect (and
              (not (on ?x ?y))
              (clear ?y)           ; the supporting block becomes clear
              (not (clear ?x))     ; held block is not clear
              (not (handempty))
              (holding ?x)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  ; Put the held block down onto the table.
  (:action put-down
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (current-stage ?s) (succ ?s ?s2))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty)
              (not (holding ?x))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  ; Stack the held block onto another clear block.
  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (clear ?y) (current-stage ?s) (succ ?s ?s2))
    :effect (and
              (on ?x ?y)
              (not (holding ?x))
              (handempty)
              (not (clear ?y))     ; supporting block is no longer clear
              (clear ?x)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )
)