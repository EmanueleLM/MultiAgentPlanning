(define (domain blocks-multiagent)
  ; Domain: multi-agent blocksworld with two acting agents:
  ;  - vowel-agent: may pick/place only vowel-blocks (A, E, I)
  ;  - consonant-agent: may pick/place only consonant-blocks (B, C, D, F, G, H, J, K, L, M, N)
  ; Actions enforce: only clear (top) blocks can be picked, one block per action,
  ; and placements are allowed either on the table or on another clear block.
  ; Assumptions:
  ;  - There is no explicit "orchestrator" actor performing moves; orchestrator role is only to produce this domain/problem.
  ;  - Consonant-agent is permitted to place consonant blocks onto any clear block (vowel or consonant).
  ;  - Vowel-agent may place vowel blocks onto any clear block (vowel or consonant).
  ;  - All moves are atomic pick-and-place (modeled as separate pick and place actions).
  ; Requirements and constructs are Fast Downward compatible (:strips :typing :negative-preconditions).
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
  ; Vowel-agent actions (may move only vowel blocks A, E, I)
  ; ---------------------------

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
  ; Consonant-agent actions (may move only consonant blocks)
  ; ---------------------------

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