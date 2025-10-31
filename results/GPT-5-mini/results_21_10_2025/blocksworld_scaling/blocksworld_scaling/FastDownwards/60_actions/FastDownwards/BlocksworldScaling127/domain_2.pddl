(define (domain blocksworld-multiagent)
  (:requirements :typing :negative-preconditions)
  (:types agent vowel-agent consonant-agent block position)

  (:predicates
    (is-vowel ?b - block)
    (is-consonant ?b - block)
    (on ?b - block ?under - block)
    (ontable ?b - block ?p - position)
    (top ?b - block)
    (available ?a - agent)
  )

  (:action vowel-move-block-to-block
    :parameters (?ag - vowel-agent ?b - block ?from - block ?to - block)
    :precondition (and (available ?ag) (is-vowel ?b) (on ?b ?from) (top ?b) (top ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (not (top ?to)) (top ?b) (top ?from))
  )

  (:action vowel-move-block-to-pos
    :parameters (?ag - vowel-agent ?b - block ?from - block ?p - position)
    :precondition (and (available ?ag) (is-vowel ?b) (on ?b ?from) (top ?b))
    :effect (and (not (on ?b ?from)) (ontable ?b ?p) (top ?b) (top ?from))
  )

  (:action vowel-move-pos-to-block
    :parameters (?ag - vowel-agent ?b - block ?p - position ?to - block)
    :precondition (and (available ?ag) (is-vowel ?b) (ontable ?b ?p) (top ?b) (top ?to))
    :effect (and (not (ontable ?b ?p)) (on ?b ?to) (not (top ?to)) (top ?b))
  )

  (:action vowel-move-pos-to-pos
    :parameters (?ag - vowel-agent ?b - block ?p1 - position ?p2 - position)
    :precondition (and (available ?ag) (is-vowel ?b) (ontable ?b ?p1) (top ?b))
    :effect (and (not (ontable ?b ?p1)) (ontable ?b ?p2) (top ?b))
  )

  (:action consonant-move-block-to-block
    :parameters (?ag - consonant-agent ?b - block ?from - block ?to - block)
    :precondition (and (available ?ag) (is-consonant ?b) (on ?b ?from) (top ?b) (top ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (not (top ?to)) (top ?b) (top ?from))
  )

  (:action consonant-move-block-to-pos
    :parameters (?ag - consonant-agent ?b - block ?from - block ?p - position)
    :precondition (and (available ?ag) (is-consonant ?b) (on ?b ?from) (top ?b))
    :effect (and (not (on ?b ?from)) (ontable ?b ?p) (top ?b) (top ?from))
  )

  (:action consonant-move-pos-to-block
    :parameters (?ag - consonant-agent ?b - block ?p - position ?to - block)
    :precondition (and (available ?ag) (is-consonant ?b) (ontable ?b ?p) (top ?b) (top ?to))
    :effect (and (not (ontable ?b ?p)) (on ?b ?to) (not (top ?to)) (top ?b))
  )

  (:action consonant-move-pos-to-pos
    :parameters (?ag - consonant-agent ?b - block ?p1 - position ?p2 - position)
    :precondition (and (available ?ag) (is-consonant ?b) (ontable ?b ?p1) (top ?b))
    :effect (and (not (ontable ?b ?p1)) (ontable ?b ?p2) (top ?b))
  )
)