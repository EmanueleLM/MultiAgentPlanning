(define (domain blocks_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types vowel consonant - block
          vowel_agent consonant_agent - agent)
  (:predicates
    (on ?b - block ?c - block)            ; ?b is on ?c
    (ontable ?b - block)                  ; ?b is on the table
    (clear ?b - block)                    ; nothing on top of ?b
    (handempty ?a - agent)                ; agent ?a has an empty hand
    (holding ?a - agent ?b - block)       ; agent ?a is holding block ?b
  )

  ;-------------------------
  ; Actions for the vowel agent (handles vowels only)
  ;-------------------------
  (:action vowel_pickup_from_table
    :parameters (?a - vowel_agent ?b - vowel)
    :precondition (and (ontable ?b) (clear ?b) (handempty ?a))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?a))
              (holding ?a ?b)
            )
  )

  (:action vowel_pickup
    :parameters (?a - vowel_agent ?b - vowel ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty ?a))
    :effect (and
              (not (on ?b ?c))
              (not (clear ?b))
              (not (handempty ?a))
              (holding ?a ?b)
              (clear ?c)
            )
  )

  (:action vowel_putdown_table
    :parameters (?a - vowel_agent ?b - vowel)
    :precondition (and (holding ?a ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty ?a)
              (not (holding ?a ?b))
            )
  )

  (:action vowel_putdown
    :parameters (?a - vowel_agent ?b - vowel ?c - block)
    :precondition (and (holding ?a ?b) (clear ?c))
    :effect (and
              (on ?b ?c)
              (clear ?b)
              (handempty ?a)
              (not (holding ?a ?b))
              (not (clear ?c))
            )
  )

  ;-------------------------
  ; Actions for the consonant agent (handles consonants only)
  ;-------------------------
  (:action consonant_pickup_from_table
    :parameters (?a - consonant_agent ?b - consonant)
    :precondition (and (ontable ?b) (clear ?b) (handempty ?a))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?a))
              (holding ?a ?b)
            )
  )

  (:action consonant_pickup
    :parameters (?a - consonant_agent ?b - consonant ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty ?a))
    :effect (and
              (not (on ?b ?c))
              (not (clear ?b))
              (not (handempty ?a))
              (holding ?a ?b)
              (clear ?c)
            )
  )

  (:action consonant_putdown_table
    :parameters (?a - consonant_agent ?b - consonant)
    :precondition (and (holding ?a ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty ?a)
              (not (holding ?a ?b))
            )
  )

  (:action consonant_putdown
    :parameters (?a - consonant_agent ?b - consonant ?c - block)
    :precondition (and (holding ?a ?b) (clear ?c))
    :effect (and
              (on ?b ?c)
              (clear ?b)
              (handempty ?a)
              (not (holding ?a ?b))
              (not (clear ?c))
            )
  )
)