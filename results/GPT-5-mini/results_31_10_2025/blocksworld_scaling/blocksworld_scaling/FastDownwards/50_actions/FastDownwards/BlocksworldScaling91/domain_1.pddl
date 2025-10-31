(define (domain BlocksworldScaling91)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?p - block)        ; block ?b is directly on block ?p
    (ontable ?b - block)              ; block ?b is directly on the table
    (clear ?b - block)                ; no block on top of ?b
    (holding ?a - agent ?b - block)   ; agent is holding a block
    (handempty ?a - agent)            ; agent's hand is empty
    (is-vowel-agent ?a - agent)       ; agent is the vowel agent
    (is-consonant-agent ?a - agent)   ; agent is the consonant agent
    (vowel ?b - block)                ; block is a vowel-labeled block
    (consonant ?b - block)            ; block is a consonant-labeled block
  )

  ; ===== Vowel agent pickup/put actions =====
  (:action vowel-pickup-from-block
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (is-vowel-agent ?a) (handempty ?a) (on ?b ?c) (clear ?b) (vowel ?b))
    :effect (and
              (not (on ?b ?c))
              (clear ?c)
              (not (handempty ?a))
              (holding ?a ?b)
            )
  )

  (:action vowel-pickup-from-table
    :parameters (?a - agent ?b - block)
    :precondition (and (is-vowel-agent ?a) (handempty ?a) (ontable ?b) (clear ?b) (vowel ?b))
    :effect (and
              (not (ontable ?b))
              (not (handempty ?a))
              (holding ?a ?b)
            )
  )

  (:action vowel-put-to-block
    :parameters (?a - agent ?b - block ?dest - block)
    :precondition (and (is-vowel-agent ?a) (holding ?a ?b) (clear ?dest))
    :effect (and
              (not (holding ?a ?b))
              (handempty ?a)
              (on ?b ?dest)
              (not (clear ?dest))
              (clear ?b)
            )
  )

  (:action vowel-put-to-table
    :parameters (?a - agent ?b - block)
    :precondition (and (is-vowel-agent ?a) (holding ?a ?b))
    :effect (and
              (not (holding ?a ?b))
              (handempty ?a)
              (ontable ?b)
              (clear ?b)
            )
  )

  ; ===== Consonant agent pickup/put actions =====
  (:action consonant-pickup-from-block
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (is-consonant-agent ?a) (handempty ?a) (on ?b ?c) (clear ?b) (consonant ?b))
    :effect (and
              (not (on ?b ?c))
              (clear ?c)
              (not (handempty ?a))
              (holding ?a ?b)
            )
  )

  (:action consonant-pickup-from-table
    :parameters (?a - agent ?b - block)
    :precondition (and (is-consonant-agent ?a) (handempty ?a) (ontable ?b) (clear ?b) (consonant ?b))
    :effect (and
              (not (ontable ?b))
              (not (handempty ?a))
              (holding ?a ?b)
            )
  )

  (:action consonant-put-to-block
    :parameters (?a - agent ?b - block ?dest - block)
    :precondition (and (is-consonant-agent ?a) (holding ?a ?b) (clear ?dest))
    :effect (and
              (not (holding ?a ?b))
              (handempty ?a)
              (on ?b ?dest)
              (not (clear ?dest))
              (clear ?b)
            )
  )

  (:action consonant-put-to-table
    :parameters (?a - agent ?b - block)
    :precondition (and (is-consonant-agent ?a) (holding ?a ?b))
    :effect (and
              (not (holding ?a ?b))
              (handempty ?a)
              (ontable ?b)
              (clear ?b)
            )
  )
)