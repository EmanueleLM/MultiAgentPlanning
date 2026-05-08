(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)        ; ?x is directly on ?y
    (ontable ?x - block)              ; ?x is on the table
    (clear ?x - block)                ; nothing is on ?x and it is not being held
    (holding ?x - block)              ; the agent is holding ?x
    (handempty)                       ; the agent's hand is empty
    (at ?s - stage)                   ; the current discrete stage/time is ?s
    (next ?s1 - stage ?s2 - stage)    ; successor relation among stages
  )

  ;; pick-up a clear block from the table, advancing from stage ?s to its successor ?s'
  (:action pick-up
    :parameters (?b - block ?s - stage ?s' - stage)
    :precondition (and
      (at ?s)
      (next ?s ?s')
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))     ; held blocks are not clear
      (not (handempty))
      (holding ?b)
      (not (at ?s))
      (at ?s')
    )
  )

  ;; unstack a clear block ?b from on top of ?c, advancing stages
  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?s' - stage)
    :precondition (and
      (at ?s)
      (next ?s ?s')
      (on ?b ?c)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))   ; held block is not clear
      (not (handempty))
      (holding ?b)
      (clear ?c)         ; the block underneath becomes clear
      (not (at ?s))
      (at ?s')
    )
  )

  ;; put down a held block onto the table, advancing stages
  (:action put-down
    :parameters (?b - block ?s - stage ?s' - stage)
    :precondition (and
      (at ?s)
      (next ?s ?s')
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (at ?s))
      (at ?s')
    )
  )

  ;; stack a held block ?b onto a clear block ?c, advancing stages
  ;; local check to avoid immediate 2-cycles: destination cannot be directly on ?b
  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?s' - stage)
    :precondition (and
      (at ?s)
      (next ?s ?s')
      (holding ?b)
      (clear ?c)
      (not (on ?c ?b))
    )
    :effect (and
      (not (holding ?b))
      (on ?b ?c)
      (not (ontable ?b))
      (clear ?b)
      (not (clear ?c))  ; destination is no longer clear after stacking
      (handempty)
      (not (at ?s))
      (at ?s')
    )
  )
)