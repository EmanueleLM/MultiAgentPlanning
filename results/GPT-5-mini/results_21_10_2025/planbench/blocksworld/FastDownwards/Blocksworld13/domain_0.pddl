(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  ; Predicates required by the specification
  (:predicates
    (block ?b - block)          ; explicit block predicate (per agents' suggestions)
    (handempty)                 ; hand is empty
    (holding ?b - block)        ; agent is holding block ?b
    (on ?x - block ?y - block)  ; ?x is on ?y
    (on-table ?b - block)       ; ?b is on the table
    (clear ?b - block)          ; nothing is on ?b and it is not being held
  )

  ; Actions described / used by actor1 and validated by actor1's plan
  ; (actor1 provided the detailed executable plan; actor2 provided alternative sketches)
  ; Both agents assume standard blocksworld STRIPS semantics:
  ; - pick-up: from table to holding
  ; - unstack: from another block to holding
  ; - put-down: from holding to table
  ; - stack: from holding to another clear block

  ; pick-up action (as used by actor1 / described by both agents)
  (:action pick-up
    :parameters (?b - block)
    :precondition (and (on-table ?b) (clear ?b) (handempty))
    :effect (and
              (holding ?b)
              (not (on-table ?b))
              (not (handempty))
              (not (clear ?b))
            )
  )

  ; unstack action (as used by actor1 / described by both agents)
  (:action unstack
    :parameters (?b - block ?s - block) ; ?b from support ?s
    :precondition (and (on ?b ?s) (clear ?b) (handempty))
    :effect (and
              (holding ?b)
              (not (on ?b ?s))
              (not (handempty))
              (not (clear ?b))
              (clear ?s)
            )
  )

  ; put-down action (as used by actor1 / described by both agents)
  (:action put-down
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
              (on-table ?b)
              (clear ?b)
              (handempty)
              (not (holding ?b))
            )
  )

  ; stack action (as used by actor1 / described by both agents)
  (:action stack
    :parameters (?b - block ?dest - block)
    :precondition (and (holding ?b) (clear ?dest))
    :effect (and
              (on ?b ?dest)
              (handempty)
              (clear ?b)
              (not (holding ?b))
              (not (clear ?dest))
            )
  )

  ; Note: Both agents treat "clear" as false while the block is held.
  ; The actions ensure on-table and on relations are updated by the sequence of effects above.
)