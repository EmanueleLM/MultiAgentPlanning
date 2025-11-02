(define (domain multiagent-blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; Vowel-agent actions
  (:action move-vowel-block-to-block
    :parameters (?b - block ?s - block ?d - block)
    :precondition (and (vowel ?b) (on ?b ?s) (clear ?b) (clear ?d))
    :effect (and
      (not (on ?b ?s))
      (on ?b ?d)
      (clear ?s)
      (not (clear ?d))
    )
  )

  (:action move-vowel-table-to-block
    :parameters (?b - block ?d - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?d))
    :effect (and
      (not (ontable ?b))
      (on ?b ?d)
      (not (clear ?d))
    )
  )

  (:action move-vowel-block-to-table
    :parameters (?b - block ?s - block)
    :precondition (and (vowel ?b) (on ?b ?s) (clear ?b))
    :effect (and
      (not (on ?b ?s))
      (ontable ?b)
      (clear ?s)
    )
  )

  ;; Consonant-agent actions
  (:action move-consonant-block-to-block
    :parameters (?b - block ?s - block ?d - block)
    :precondition (and (consonant ?b) (on ?b ?s) (clear ?b) (clear ?d))
    :effect (and
      (not (on ?b ?s))
      (on ?b ?d)
      (clear ?s)
      (not (clear ?d))
    )
  )

  (:action move-consonant-table-to-block
    :parameters (?b - block ?d - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (clear ?d))
    :effect (and
      (not (ontable ?b))
      (on ?b ?d)
      (not (clear ?d))
    )
  )

  (:action move-consonant-block-to-table
    :parameters (?b - block ?s - block)
    :precondition (and (consonant ?b) (on ?b ?s) (clear ?b))
    :effect (and
      (not (on ?b ?s))
      (ontable ?b)
      (clear ?s)
    )
  )
)