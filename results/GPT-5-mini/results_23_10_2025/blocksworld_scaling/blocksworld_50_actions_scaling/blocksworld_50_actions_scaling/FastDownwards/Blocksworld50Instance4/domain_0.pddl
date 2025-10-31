(define (domain blocks-world-multiagent)
  (:requirements :strips :typing)
  (:types block robot)

  (:predicates
    ;; static / state predicates
    (on ?b - block ?under - block)     ;; block ?b is immediately on block ?under
    (ontable ?b - block)               ;; block ?b is on the table
    (clear ?b - block)                 ;; no block on top of ?b
    (holding ?r - robot ?b - block)    ;; robot ?r is holding block ?b
    (handempty ?r - robot)             ;; robot ?r has empty hand
  )

  ;; Robot r un-stacks block b from block c (b on c) and picks it up
  (:action unstack
    :parameters (?r - robot ?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty ?r))
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (holding ?r ?b)
      (clear ?c)
      (not (handempty ?r))
    )
  )

  ;; Robot r picks up block b from the table
  (:action pickup-from-table
    :parameters (?r - robot ?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty ?r))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding ?r ?b)
      (not (handempty ?r))
    )
  )

  ;; Robot r puts block b onto block c
  (:action put-on-block
    :parameters (?r - robot ?b - block ?c - block)
    :precondition (and (holding ?r ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (not (holding ?r ?b))
      (handempty ?r)
    )
  )

  ;; Robot r puts block b down on the table
  (:action put-on-table
    :parameters (?r - robot ?b - block)
    :precondition (and (holding ?r ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?r ?b))
      (handempty ?r)
    )
  )
)