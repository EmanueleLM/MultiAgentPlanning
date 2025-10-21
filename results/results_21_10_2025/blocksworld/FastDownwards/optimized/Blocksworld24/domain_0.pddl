(define (domain multi_agent_blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    ;; Separate hand/holding predicates per agent to preserve independent agent state
    (holding-v ?x - block)    ; vowel-agent is holding
    (handempty-v)             ; vowel-agent's hand is empty
    (holding-c ?x - block)    ; consonant-agent is holding
    (handempty-c)             ; consonant-agent's hand is empty
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; Vowel-agent actions (can move only blocks marked (vowel ?b))
  (:action vowel-pickup-from-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty-v))
    :effect (and
      (holding-v ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty-v))
    )
  )

  (:action vowel-unstack
    :parameters (?b - block ?x - block)
    :precondition (and (vowel ?b) (on ?b ?x) (clear ?b) (handempty-v))
    :effect (and
      (holding-v ?b)
      (clear ?x)
      (not (on ?b ?x))
      (not (clear ?b))
      (not (handempty-v))
    )
  )

  (:action vowel-putdown-to-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (holding-v ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty-v)
      (not (holding-v ?b))
    )
  )

  (:action vowel-stack
    :parameters (?b - block ?x - block)
    :precondition (and (vowel ?b) (holding-v ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (not (clear ?x))
      (handempty-v)
      (not (holding-v ?b))
    )
  )

  ;; Consonant-agent actions (can move only blocks marked (consonant ?x))
  (:action cons-pickup-from-table
    :parameters (?x - block)
    :precondition (and (consonant ?x) (ontable ?x) (clear ?x) (handempty-c))
    :effect (and
      (holding-c ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-c))
    )
  )

  (:action cons-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (on ?x ?y) (clear ?x) (handempty-c))
    :effect (and
      (holding-c ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty-c))
    )
  )

  (:action cons-putdown-to-table
    :parameters (?x - block)
    :precondition (and (consonant ?x) (holding-c ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty-c)
      (not (holding-c ?x))
    )
  )

  (:action cons-put-on
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (holding-c ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty-c)
      (not (holding-c ?x))
    )
  )
)