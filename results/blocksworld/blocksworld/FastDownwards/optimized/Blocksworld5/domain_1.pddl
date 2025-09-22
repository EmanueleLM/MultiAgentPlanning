(define (domain stacking-multi-agent)
  (:requirements :typing :strips :action-costs)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (clear ?from) (not (clear ?to)))
    :cost 1
  )

  (:action vowel-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and (not (on ?b ?from)) (ontable ?b) (clear ?from))
    :cost 1
  )

  (:action vowel-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and (not (ontable ?b)) (on ?b ?to) (not (clear ?to)))
    :cost 1
  )

  (:action consonant-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (on ?b ?to) (clear ?from) (not (clear ?to)))
    :cost 1
  )

  (:action consonant-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and (not (on ?b ?from)) (ontable ?b) (clear ?from))
    :cost 1
  )

  (:action consonant-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and (not (ontable ?b)) (on ?b ?to) (not (clear ?to)))
    :cost 1
  )
)