(define (domain multiagent_blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    ;; Agent-specific hand predicates to model two independent agents
    (holding_v ?x - block)    ; vowel-agent holds ?x
    (handempty_v)             ; vowel-agent's hand empty
    (holding_c ?x - block)    ; consonant-agent holds ?x
    (handempty_c)             ; consonant-agent's hand empty
    ;; static classifications
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; Vowel-agent actions (prefix vowel_)
  (:action vowel_pick_from_table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty_v))
    :effect (and
      (holding_v ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty_v))
    )
  )

  (:action vowel_pick_from_block
    :parameters (?b - block ?x - block)
    :precondition (and (vowel ?b) (on ?b ?x) (clear ?b) (handempty_v))
    :effect (and
      (holding_v ?b)
      (clear ?x)
      (not (on ?b ?x))
      (not (clear ?b))
      (not (handempty_v))
    )
  )

  (:action vowel_put_on_table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (holding_v ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding_v ?b))
      (handempty_v)
    )
  )

  (:action vowel_put_on_block
    :parameters (?b - block ?x - block)
    :precondition (and (vowel ?b) (holding_v ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (not (clear ?x))
      (not (holding_v ?b))
      (handempty_v)
    )
  )

  ;; Consonant-agent actions (prefix consonant_)
  (:action consonant_pickup
    :parameters (?x - block)
    :precondition (and (consonant ?x) (ontable ?x) (clear ?x) (handempty_c))
    :effect (and
      (holding_c ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty_c))
    )
  )

  (:action consonant_unstack
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (consonant ?y) (on ?x ?y) (clear ?x) (handempty_c))
    :effect (and
      (holding_c ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty_c))
    )
  )

  (:action consonant_putdown
    :parameters (?x - block)
    :precondition (and (consonant ?x) (holding_c ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty_c)
      (not (holding_c ?x))
    )
  )

  (:action consonant_stack
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (consonant ?y) (holding_c ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty_c)
      (not (holding_c ?x))
      (not (clear ?y))
    )
  )
)