(define (domain blocks_multi_agent)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?b ?s - block)      ; ?b is directly on support ?s (a block)
    (ontable ?b - block)    ; ?b is directly on the table
    (clear ?b - block)      ; nothing on top of ?b
    (vowel ?b - block)      ; block is vowel (moved by vowel-agent)
    (consonant ?b - block)  ; block is consonant (moved by consonant-agent)
  )

  ;; Vowel-agent atomic moves (kept as single-step operations that
  ;; respect "only move top blocks" restrictions via preconditions)
  (:action vowel_move-block-to-block
    :parameters (?b ?from ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action vowel_move-from-table-to-block
    :parameters (?b ?to - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action vowel_move-block-to-table
    :parameters (?b ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )

  ;; Consonant-agent atomic moves (distinct names)
  (:action consonant_move-block-to-block
    :parameters (?b ?from ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action consonant_move-table-to-block
    :parameters (?b ?to - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action consonant_move-block-to-table
    :parameters (?b ?from - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )
)