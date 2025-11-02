(define (domain multi_agent_block_domain)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (clear ?x - block)
    (holding1 ?x - block)   ;; held by vowel-agent (agent 1)
    (holding2 ?x - block)   ;; held by consonant-agent (agent 2)
    (handempty1)            ;; vowel-agent's hand is empty
    (handempty2)            ;; consonant-agent's hand is empty
    (vowel ?x - block)      ;; blocks the vowel agent may handle
    (consonant ?x - block)  ;; blocks the consonant agent may handle
  )

  ;; Vowel-agent actions (agent 1). Can only pick vowels.
  (:action vowel-pick-up
    :parameters (?x - block ?y - block)
    :precondition (and (vowel ?x) (on ?x ?y) (clear ?x) (handempty1))
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (holding1 ?x)
      (not (handempty1))
      (clear ?y)
    )
  )

  ;; Vowel-agent: put a held vowel onto a clear block (not table).
  (:action vowel-put-down
    :parameters (?x - block ?y - block)
    :precondition (and (holding1 ?x) (clear ?y) (not (= ?y ?x)))
    :effect (and
      (on ?x ?y)
      (not (clear ?y))
      (clear ?x)
      (not (holding1 ?x))
      (handempty1)
    )
  )

  ;; Vowel-agent: put a held vowel down on the table (table is a block constant).
  (:action vowel-put-down-table
    :parameters (?x - block ?t - block)
    :precondition (and (holding1 ?x) (equals ?t table))
    :effect (and
      (on ?x table)
      (clear ?x)
      (not (holding1 ?x))
      (handempty1)
    )
  )

  ;; Consonant-agent actions (agent 2). Can only pick consonants.

  ;; Pick a consonant that is on the table.
  (:action cons-pickup-from-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (on ?b table) (clear ?b) (handempty2))
    :effect (and
      (holding2 ?b)
      (not (on ?b table))
      (not (clear ?b))
      (not (handempty2))
    )
  )

  ;; Unstack a consonant block from any block
  (:action cons-unstack
    :parameters (?b - block ?x - block)
    :precondition (and (consonant ?b) (on ?b ?x) (clear ?b) (handempty2))
    :effect (and
      (holding2 ?b)
      (clear ?x)
      (not (on ?b ?x))
      (not (clear ?b))
      (not (handempty2))
    )
  )

  ;; Put a held consonant block onto another consonant block
  (:action cons-put-down-on
    :parameters (?b - block ?x - block)
    :precondition (and (consonant ?b) (consonant ?x) (holding2 ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (not (clear ?x))
      (not (holding2 ?b))
      (handempty2)
    )
  )

  ;; Put a held consonant block down on the table
  (:action cons-put-down-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (holding2 ?b))
    :effect (and
      (on ?b table)
      (clear ?b)
      (not (holding2 ?b))
      (handempty2)
    )
  )
)