(define (domain multi-agent-blocks)
  (:requirements :strips :equality)
  (:predicates
    ;; world/state predicates
    (on ?b ?x)           ; block ?b is on block ?x
    (ontable ?b)         ; block ?b is on the table
    (clear ?b)           ; nothing on top of ?b

    ;; agent and capability predicates
    (agent ?a)
    (can-move ?a ?b)     ; authorization: agent ?a may move block ?b (used by vowel-agent)
    (consonant ?b)       ; block is consonant (used by consonant-agent)

    ;; per-agent hand state for consonant agent(s)
    (handempty ?a)
    (holding ?a ?b)
  )

  ;; -----------------------
  ;; Vowel-agent style actions
  ;; -----------------------
  ;; These actions correspond to the first agent's model: direct moves
  ;; (they require authorization via can-move ?agent ?b).
  (:action vowel-move-block-block
    :parameters (?agent ?b ?from ?to)
    :precondition (and
      (agent ?agent)
      (can-move ?agent ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?agent ?b ?to)
    :precondition (and
      (agent ?agent)
      (can-move ?agent ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?agent ?b ?from)
    :precondition (and
      (agent ?agent)
      (can-move ?agent ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  ;; --------------------------------
  ;; Consonant-agent style pick/stack
  ;; --------------------------------
  ;; These actions follow the second agent's pick/unstack/stack/putdown model,
  ;; but parameterized by agent so multiple agents can exist without a global hand.
  (:action cons-pickup
    :parameters (?agent ?x)
    :precondition (and
      (agent ?agent)
      (consonant ?x)
      (ontable ?x)
      (clear ?x)
      (handempty ?agent)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?agent))
      (holding ?agent ?x)
    )
  )

  (:action cons-unstack
    :parameters (?agent ?x ?y)
    :precondition (and
      (agent ?agent)
      (consonant ?x)
      (on ?x ?y)
      (clear ?x)
      (handempty ?agent)
    )
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (handempty ?agent))
      (holding ?agent ?x)
    )
  )

  (:action cons-putdown
    :parameters (?agent ?x)
    :precondition (and
      (agent ?agent)
      (consonant ?x)
      (holding ?agent ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty ?agent)
      (not (holding ?agent ?x))
    )
  )

  (:action cons-stack
    :parameters (?agent ?x ?y)
    :precondition (and
      (agent ?agent)
      (consonant ?x)
      (holding ?agent ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty ?agent)
      (not (holding ?agent ?x))
    )
  )
)