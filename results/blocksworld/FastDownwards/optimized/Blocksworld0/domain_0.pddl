(define (domain multiagent_blocks_domain)
  (:requirements :strips :typing :equality :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; Actions belonging to the vowel agent (manipulates vowel-labeled blocks)
  (:action vowel_move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel_move-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel_move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  ;; Actions belonging to the consonant agent (manipulates consonant-labeled blocks)
  (:action consonant_move-from-table-to-block
    :parameters (?x - block ?to - block)
    :precondition (and
      (ontable ?x)
      (clear ?x)
      (clear ?to)
      (consonant ?x)
      (consonant ?to)
      (not (= ?x ?to))
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action consonant_move-block-to-block
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (consonant ?x)
      (consonant ?to)
      (not (= ?x ?to))
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?x)
    )
  )

  (:action consonant_move-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and
      (on ?x ?from)
      (clear ?x)
      (consonant ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?from)
      (not (on ?x ?from))
      (clear ?x)
    )
  )
)