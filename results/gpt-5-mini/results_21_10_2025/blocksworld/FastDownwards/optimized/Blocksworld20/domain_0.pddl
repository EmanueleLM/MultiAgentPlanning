(define (domain blocks-multi-agent)
  (:requirements :strips :typing)
  (:types block agent)

  (:predicates
    (agent ?a - agent)
    (vowel ?b - block)
    (consonant ?b - block)
    (ontable ?b - block)
    (on ?b - block ?under - block)
    (clear ?b - block)
  )

  ;; Vowel-agent actions (namespaced with "vowel-")
  (:action vowel-move-to-table
    :parameters (?ag - agent ?b - block ?under - block)
    :precondition (and
      (agent ?ag)
      (vowel ?b)
      (clear ?b)
      (on ?b ?under)
    )
    :effect (and
      (not (on ?b ?under))
      (ontable ?b)
      (clear ?under)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?ag - agent ?b - block ?dest - block)
    :precondition (and
      (agent ?ag)
      (vowel ?b)
      (clear ?b)
      (ontable ?b)
      (clear ?dest)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dest)
      (not (clear ?dest))
    )
  )

  (:action vowel-move-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?dest - block)
    :precondition (and
      (agent ?ag)
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?dest)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?dest)
      (clear ?from)
      (not (clear ?dest))
    )
  )

  ;; Consonant-agent actions (namespaced with "cons-")
  (:action cons-move-to-table
    :parameters (?ag - agent ?x - block ?from - block)
    :precondition (and
      (agent ?ag)
      (consonant ?x)
      (clear ?x)
      (on ?x ?from)
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
    )
  )

  (:action cons-move-from-table-to-block
    :parameters (?ag - agent ?x - block ?to - block)
    :precondition (and
      (agent ?ag)
      (consonant ?x)
      (clear ?x)
      (ontable ?x)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
    )
  )

  (:action cons-move-to-block
    :parameters (?ag - agent ?x - block ?from - block ?to - block)
    :precondition (and
      (agent ?ag)
      (consonant ?x)
      (clear ?x)
      (clear ?to)
      (on ?x ?from)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)