(define (domain blocks-multiagent)
  ; Assumptions and modeling notes:
  ; - Two agent subtypes: vowel-agent and consonant-agent. Objects named vowel_agent and consonant_agent appear in the problem file.
  ; - Blocks are typed as vowel-block or consonant-block. Vowels: A, E, I. Consonants: B C D F G H J K L M N.
  ; - We adopt the permissive interpretation for the consonant agent: the consonant agent may place a consonant onto any clear block (including vowels).
  ; - Moves are single-block atomic pick-and-place operations. Only top blocks (clear) may be picked.
  ; - The domain contains distinct actions for vowel-agent vs consonant-agent to encode per-agent permissions.
  ; - All natural-language preferences in the capability descriptions have been encoded as hard constraints (i.e., types and action preconditions).
  ; - No costs are modeled. Requirements limited to :strips, :typing, :negative-preconditions.
  (:requirements :strips :typing :negative-preconditions)
  (:types
    vowel-agent consonant-agent - agent
    vowel-block consonant-block - block
  )

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?ag - agent ?x - block)
    (handempty ?ag - agent)
  )

  ; ---------------------------
  ; Vowel-agent actions (can move only vowel-blocks A,E,I)
  ; ---------------------------

  ; Pick a vowel block from the table
  (:action pick-vowel-from-table
    :parameters (?ag - vowel-agent ?b - vowel-block)
    :precondition (and
      (handempty ?ag)
      (clear ?b)
      (ontable ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  ; Pick a vowel block from on top of another block ?under
  (:action pick-vowel-from-block
    :parameters (?ag - vowel-agent ?b - vowel-block ?under - block)
    :precondition (and
      (handempty ?ag)
      (clear ?b)
      (on ?b ?under)
    )
    :effect (and
      (not (on ?b ?under))
      (not (clear ?b))
      (clear ?under)
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  ; Place a held vowel block onto the table
  (:action place-vowel-on-table
    :parameters (?ag - vowel-agent ?b - vowel-block)
    :precondition (and
      (holding ?ag ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?ag ?b))
      (handempty ?ag)
    )
  )

  ; Place a held vowel block onto a clear target block (any block type)
  (:action place-vowel-on-block
    :parameters (?ag - vowel-agent ?b - vowel-block ?target - block)
    :precondition (and
      (holding ?ag ?b)
      (clear ?target)
      (not (= ?b ?target))
    )
    :effect (and
      (not (clear ?target))
      (on ?b ?target)
      (clear ?b)
      (not (holding ?ag ?b))
      (handempty ?ag)
    )
  )

  ; ---------------------------
  ; Consonant-agent actions (can move only consonant-blocks)
  ; ---------------------------

  ; Pick a consonant block from the table
  (:action pick-consonant-from-table
    :parameters (?ag - consonant-agent ?b - consonant-block)
    :precondition (and
      (handempty ?ag)
      (clear ?b)
      (ontable ?b)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  ; Pick a consonant block from on top of another block ?under
  (:action pick-consonant-from-block
    :parameters (?ag - consonant-agent ?b - consonant-block ?under - block)
    :precondition (and
      (handempty ?ag)
      (clear ?b)
      (on ?b ?under)
    )
    :effect (and
      (not (on ?b ?under))
      (not (clear ?b))
      (clear ?under)
      (not (handempty ?ag))
      (holding ?ag ?b)
    )
  )

  ; Place a held consonant block onto the table
  (:action place-consonant-on-table
    :parameters (?ag - consonant-agent ?b - consonant-block)
    :precondition (and
      (holding ?ag ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?ag ?b))
      (handempty ?ag)
    )
  )

  ; Place a held consonant block onto a clear target block (per permissive interpretation, target may be vowel or consonant)
  (:action place-consonant-on-block
    :parameters (?ag - consonant-agent ?b - consonant-block ?target - block)
    :precondition (and
      (holding ?ag ?b)
      (clear ?target)
      (not (= ?b ?target))
    )
    :effect (and
      (not (clear ?target))
      (on ?b ?target)
      (clear ?b)
      (not (holding ?ag ?b))
      (handempty ?ag)
    )
  )
)