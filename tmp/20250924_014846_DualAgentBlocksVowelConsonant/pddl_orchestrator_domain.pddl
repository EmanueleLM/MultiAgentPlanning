(define (domain dual-agent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stack)
  (:predicates
    (vowel ?b - block)
    (consonant ?b - block)
    (ontable ?b - block ?s - stack)
    (on ?b - block ?under - block)
    (clear ?b - block)
    (stack-used ?s - stack)
    (stack-free ?s - stack)
    (handempty-va)
    (handempty-ca)
    (holding-va ?b - block)
    (holding-ca ?b - block)
  )

  ;; VA pick top block from a stack when the block is directly on the table (last block of that stack)
  (:action pick-table-va
    :parameters (?b - block ?s - stack)
    :precondition (and (vowel ?b) (ontable ?b ?s) (clear ?b) (handempty-va))
    :effect (and
              (not (ontable ?b ?s))
              (not (handempty-va))
              (holding-va ?b)
              (not (clear ?b))
              (not (stack-used ?s))
              (stack-free ?s)
            )
  )

  ;; VA pick top block that sits on another block
  (:action pick-block-va
    :parameters (?b - block ?under - block)
    :precondition (and (vowel ?b) (on ?b ?under) (clear ?b) (handempty-va))
    :effect (and
              (not (on ?b ?under))
              (not (handempty-va))
              (holding-va ?b)
              (not (clear ?b))
              (clear ?under)
            )
  )

  ;; CA pick top block from table (last block of that stack)
  (:action pick-table-ca
    :parameters (?b - block ?s - stack)
    :precondition (and (consonant ?b) (ontable ?b ?s) (clear ?b) (handempty-ca))
    :effect (and
              (not (ontable ?b ?s))
              (not (handempty-ca))
              (holding-ca ?b)
              (not (clear ?b))
              (not (stack-used ?s))
              (stack-free ?s)
            )
  )

  ;; CA pick top block that sits on another block
  (:action pick-block-ca
    :parameters (?b - block ?under - block)
    :precondition (and (consonant ?b) (on ?b ?under) (clear ?b) (handempty-ca))
    :effect (and
              (not (on ?b ?under))
              (not (handempty-ca))
              (holding-ca ?b)
              (not (clear ?b))
              (clear ?under)
            )
  )

  ;; VA place held block onto an existing block (target must be clear and not held by other agent)
  (:action place-on-block-va
    :parameters (?b - block ?t - block)
    :precondition (and (vowel ?b) (holding-va ?b) (clear ?t) (not (holding-ca ?t)))
    :effect (and
              (not (holding-va ?b))
              (on ?b ?t)
              (not (clear ?t))
              (clear ?b)
              (handempty-va)
            )
  )

  ;; VA place held block onto a free table stack (creates a new stack on the table)
  (:action place-on-table-va
    :parameters (?b - block ?s - stack)
    :precondition (and (vowel ?b) (holding-va ?b) (stack-free ?s))
    :effect (and
              (not (holding-va ?b))
              (ontable ?b ?s)
              (not (stack-free ?s))
              (stack-used ?s)
              (clear ?b)
              (handempty-va)
            )
  )

  ;; CA place held block onto an existing block (target must be clear and not held by other agent)
  (:action place-on-block-ca
    :parameters (?b - block ?t - block)
    :precondition (and (consonant ?b) (holding-ca ?b) (clear ?t) (not (holding-va ?t)))
    :effect (and
              (not (holding-ca ?b))
              (on ?b ?t)
              (not (clear ?t))
              (clear ?b)
              (handempty-ca)
            )
  )

  ;; CA place held block onto a free table stack (creates a new stack on the table)
  (:action place-on-table-ca
    :parameters (?b - block ?s - stack)
    :precondition (and (consonant ?b) (holding-ca ?b) (stack-free ?s))
    :effect (and
              (not (holding-ca ?b))
              (ontable ?b ?s)
              (not (stack-free ?s))
              (stack-used ?s)
              (clear ?b)
              (handempty-ca)
            )
  )
)