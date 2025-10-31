(define (domain two-agent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    vowel_agent - agent
    consonant_agent - agent
    block
  )

  (:predicates
    (on ?x - block ?y - block)        ; x is directly on y
    (ontable ?x - block)              ; x is on the table (bottom of a stack)
    (clear ?x - block)                ; nothing on top of x (x is top of its stack)
    (is-vowel ?x - block)             ; block is vowel
    (is-consonant ?x - block)         ; block is consonant
  )

  ;; Vowel agent actions (can only move vowel-labelled blocks)
  (:action vowel-move-from-block-to-block
    :parameters (?ag - vowel_agent ?b - block ?below - block ?dst - block)
    :precondition (and
      (is-vowel ?b)
      (on ?b ?below)
      (clear ?b)
      (clear ?dst)
      (not (= ?b ?dst))
    )
    :effect (and
      (not (on ?b ?below))
      (on ?b ?dst)
      (clear ?below)
      (not (clear ?dst))
      (clear ?b)
      (not (ontable ?b)) ; in case it was previously ontable (harmless if false)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?ag - vowel_agent ?b - block ?dst - block)
    :precondition (and
      (is-vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?dst)
      (not (= ?b ?dst))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dst)
      (not (clear ?dst))
      (clear ?b)
    )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?ag - vowel_agent ?b - block ?below - block)
    :precondition (and
      (is-vowel ?b)
      (on ?b ?below)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?below))
      (ontable ?b)
      (clear ?below)
      (clear ?b)
    )
  )

  ;; Consonant agent actions (can only move consonant-labelled blocks)
  (:action consonant-move-from-block-to-block
    :parameters (?ag - consonant_agent ?b - block ?below - block ?dst - block)
    :precondition (and
      (is-consonant ?b)
      (on ?b ?below)
      (clear ?b)
      (clear ?dst)
      (not (= ?b ?dst))
    )
    :effect (and
      (not (on ?b ?below))
      (on ?b ?dst)
      (clear ?below)
      (not (clear ?dst))
      (clear ?b)
      (not (ontable ?b))
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?ag - consonant_agent ?b - block ?dst - block)
    :precondition (and
      (is-consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?dst)
      (not (= ?b ?dst))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dst)
      (not (clear ?dst))
      (clear ?b)
    )
  )

  (:action consonant-move-from-block-to-table
    :parameters (?ag - consonant_agent ?b - block ?below - block)
    :precondition (and
      (is-consonant ?b)
      (on ?b ?below)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?below))
      (ontable ?b)
      (clear ?below)
      (clear ?b)
    )
  )
)