(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)    ; ?x is directly on ?y
    (ontable ?x - block)          ; ?x is directly on the table
    (clear ?x - block)            ; nothing on ?x
    (vowel ?x - block)            ; block is vowel (A,E,I)
    (consonant ?x - block)        ; block is consonant (others)
  )

  ;; Vowel agent actions (can move only vowel blocks: a e i)
  (:action vowel-move-block-to-block
    :parameters (?v - block ?below - block ?dest - block)
    :precondition (and (vowel ?v) (clear ?v) (on ?v ?below) (clear ?dest))
    :effect (and
             (not (on ?v ?below))
             (on ?v ?dest)
             (clear ?below)
             (not (clear ?dest))
            )
  )

  (:action vowel-move-block-to-table
    :parameters (?v - block ?below - block)
    :precondition (and (vowel ?v) (clear ?v) (on ?v ?below))
    :effect (and
             (not (on ?v ?below))
             (ontable ?v)
             (clear ?below)
            )
  )

  (:action vowel-move-table-to-block
    :parameters (?v - block ?dest - block)
    :precondition (and (vowel ?v) (clear ?v) (ontable ?v) (clear ?dest))
    :effect (and
             (not (ontable ?v))
             (on ?v ?dest)
             (not (clear ?dest))
            )
  )

  ;; Consonant agent actions (can move only consonant blocks: b c d f g h j)
  (:action consonant-move-block-to-block
    :parameters (?x - block ?below - block ?dest - block)
    :precondition (and (consonant ?x) (clear ?x) (on ?x ?below) (clear ?dest))
    :effect (and
             (not (on ?x ?below))
             (on ?x ?dest)
             (clear ?below)
             (not (clear ?dest))
            )
  )

  (:action consonant-move-block-to-table
    :parameters (?x - block ?below - block)
    :precondition (and (consonant ?x) (clear ?x) (on ?x ?below))
    :effect (and
             (not (on ?x ?below))
             (ontable ?x)
             (clear ?below)
            )
  )

  (:action consonant-move-table-to-block
    :parameters (?x - block ?dest - block)
    :precondition (and (consonant ?x) (clear ?x) (ontable ?x) (clear ?dest))
    :effect (and
             (not (ontable ?x))
             (on ?x ?dest)
             (not (clear ?dest))
            )
  )
)