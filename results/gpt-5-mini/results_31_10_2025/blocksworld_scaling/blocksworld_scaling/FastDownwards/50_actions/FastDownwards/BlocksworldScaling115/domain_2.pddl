(define (domain blocks-dual-agent)
  (:requirements :typing :negative-preconditions)
  (:types
    block agent
    vowel consonant - block
    vowel-agent consonant-agent - agent
  )

  (:predicates
    (ontable ?b - block)
    (on ?x - block ?y - block)
    (clear ?b - block)
    (holding ?a - agent ?b - block)
    (handempty ?a - agent)
  )

  (:action pick-vowel-from-table
    :parameters (?ag - vowel-agent ?v - vowel)
    :precondition (and (handempty ?ag) (ontable ?v) (clear ?v))
    :effect (and
              (not (ontable ?v))
              (not (clear ?v))
              (not (handempty ?ag))
              (holding ?ag ?v)
            )
  )

  (:action pick-vowel-from-block
    :parameters (?ag - vowel-agent ?v - vowel ?under - block)
    :precondition (and (handempty ?ag) (on ?v ?under) (clear ?v))
    :effect (and
              (not (on ?v ?under))
              (clear ?under)
              (not (clear ?v))
              (not (handempty ?ag))
              (holding ?ag ?v)
            )
  )

  (:action place-vowel-on
    :parameters (?ag - vowel-agent ?v - vowel ?target - block)
    :precondition (and (holding ?ag ?v) (clear ?target))
    :effect (and
              (not (holding ?ag ?v))
              (handempty ?ag)
              (on ?v ?target)
              (not (clear ?target))
              (clear ?v)
            )
  )

  (:action place-vowel-table
    :parameters (?ag - vowel-agent ?v - vowel)
    :precondition (holding ?ag ?v)
    :effect (and
              (not (holding ?ag ?v))
              (handempty ?ag)
              (ontable ?v)
              (clear ?v)
            )
  )

  (:action pick-consonant-from-table
    :parameters (?ag - consonant-agent ?c - consonant)
    :precondition (and (handempty ?ag) (ontable ?c) (clear ?c))
    :effect (and
              (not (ontable ?c))
              (not (clear ?c))
              (not (handempty ?ag))
              (holding ?ag ?c)
            )
  )

  (:action pick-consonant-from-block
    :parameters (?ag - consonant-agent ?c - consonant ?under - block)
    :precondition (and (handempty ?ag) (on ?c ?under) (clear ?c))
    :effect (and
              (not (on ?c ?under))
              (clear ?under)
              (not (clear ?c))
              (not (handempty ?ag))
              (holding ?ag ?c)
            )
  )

  (:action place-consonant-on
    :parameters (?ag - consonant-agent ?c - consonant ?target - block)
    :precondition (and (holding ?ag ?c) (clear ?target))
    :effect (and
              (not (holding ?ag ?c))
              (handempty ?ag)
              (on ?c ?target)
              (not (clear ?target))
              (clear ?c)
            )
  )

  (:action place-consonant-table
    :parameters (?ag - consonant-agent ?c - consonant)
    :precondition (holding ?ag ?c)
    :effect (and
              (not (holding ?ag ?c))
              (handempty ?ag)
              (ontable ?c)
              (clear ?c)
            )
  )
)