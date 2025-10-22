(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)        ; ?x is on block ?y
    (ontable ?x - block)              ; ?x is on the table
    (clear ?x - block)                ; no block on ?x
    (handempty1)                      ; agent1 hand is empty
    (handempty2)                      ; agent2 hand is empty
    (holding1 ?x - block)             ; agent1 is holding ?x
    (holding2 ?x - block)             ; agent2 is holding ?x
  )

  ;; Agent1 actions: pickup and putdown of block B only (as observed)
  (:action pickup-B-agent1
    :parameters ()
    :precondition (and (ontable B) (clear B) (handempty1))
    :effect (and
      (not (ontable B))
      (not (clear B))
      (not (handempty1))
      (holding1 B)
    )
  )

  (:action putdown-B-agent1
    :parameters ()
    :precondition (and (holding1 B))
    :effect (and
      (ontable B)
      (clear B)
      (handempty1)
      (not (holding1 B))
    )
  )

  ;; Agent2 actions: unstack (from block), stack (onto block), putdown (to table)
  (:action unstack-agent2
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty2))
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (handempty2))
      (holding2 ?x)
    )
  )

  (:action stack-agent2
    :parameters (?x - block ?y - block)
    :precondition (and (holding2 ?x) (clear ?y))
    :effect (and
      (not (clear ?y))
      (on ?x ?y)
      (clear ?x)
      (handempty2)
      (not (holding2 ?x))
    )
  )

  (:action putdown-agent2
    :parameters (?x - block)
    :precondition (and (holding2 ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty2)
      (not (holding2 ?x))
    )
  )
)