(define (domain multiagent-blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (agent ?a - agent)
    (can-move ?a - agent ?b - block)    ;; specific move capability for vowel agent
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; Vowel agent actions (use can-move to restrict which blocks this agent can move)
  (:action vowel-move-table-to-block
    :parameters (?a - agent ?b - block ?to - block)
    :precondition (and
      (agent ?a)
      (can-move ?a ?b)
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel-move-block-to-block
    :parameters (?a - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (agent ?a)
      (can-move ?a ?b)
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?a - agent ?b - block ?from - block)
    :precondition (and
      (agent ?a)
      (can-move ?a ?b)
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  ;; Consonant agent actions (restricted by consonant predicate)
  (:action consonant-move-from-table-to-block
    :parameters (?a - agent ?x - block ?to - block)
    :precondition (and
      (agent ?a)
      (consonant ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action consonant-move-from-block-to-block
    :parameters (?a - agent ?x - block ?from - block ?to - block)
    :precondition (and
      (agent ?a)
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action consonant-move-from-block-to-table
    :parameters (?a - agent ?x - block ?from - block)
    :precondition (and
      (agent ?a)
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
      (clear ?x)
    )
  )
)